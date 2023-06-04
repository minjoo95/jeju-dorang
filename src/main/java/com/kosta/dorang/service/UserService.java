package com.kosta.dorang.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosta.dorang.dao.UserDAOI;
import com.kosta.dorang.dto.User;

@Repository
@Service
public class UserService implements UserServiceI {

	@Autowired
	HttpSession session;
	@Autowired
	UserDAOI userDAO;
	@Autowired
	User user;

	/* 카카오 서버로부터 토큰 얻어오기 */
	@Override
	public String getAccess_Token(String authorize_code) throws Exception {
		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			// POST 요청을 하기 위해 기본값이 false인 setDoOutput을 true로 변경
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 요구되는 필수파라미터를 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=a62a2c16a4182ec20a1185a3f707c2b1");
			sb.append("&redirect_uri=http://localhost:8080/dorang/user/kakaoCallback");
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			System.out.println("$$$$$$$코드"+authorize_code);
			// 결과 코드 : 200이면 성공
			int responseCode = conn.getResponseCode();

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();

			// JSON String을 Map으로 변환
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});
			access_token = jsonMap.get("access_token").toString();
			refresh_token = jsonMap.get("refresh_token").toString();

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_token;
	}
	
	@Override
	public String getAccess_TokenRe(String authorize_code) throws Exception {
		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			// POST 요청을 하기 위해 기본값이 false인 setDoOutput을 true로 변경
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 요구되는 필수파라미터를 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=a62a2c16a4182ec20a1185a3f707c2b1");
			sb.append("&redirect_uri=http://localhost:8080/dorang/user/kakaoAddition");
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			int responseCode = conn.getResponseCode();

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			ObjectMapper objectMapper = new ObjectMapper();

			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});
			access_token = jsonMap.get("access_token").toString();
			refresh_token = jsonMap.get("refresh_token").toString();

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_token;
	}

	
	/* 얻어온 액세스 토큰을 이용해 카카오 서버에 접근해서 사용자 정보 가져와서 유저 객체로 만들어 넘기기 */
	@Override
	public User getUserInfo(String access_token) throws Exception {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기 때문에 HashMap타입으로 선언해줌
		HashMap<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_token);

			int responseCode = conn.getResponseCode();

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});

			long user_code = (long) jsonMap.get("id");
			userInfo.put("user_code", user_code);
			System.out.println("@@@@@@@갱신하자마자 코드"+user_code);
			System.out.println(userInfo.get("user_code"));
			
			Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
			Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");
			
			String user_pic_kakao = null;
			String age_range = null;
			String gender = null;
			
			if (properties != null && properties.containsKey("profile_image")) {
			    user_pic_kakao = properties.get("profile_image").toString();
			    userInfo.put("user_pic_kakao", user_pic_kakao);
			    userInfo.put("user_pic", user_pic_kakao);
			}
			if (properties != null && kakao_account.containsKey("age_range")) {
			    age_range = kakao_account.get("age_range").toString();
			    System.out.println(age_range);
			    userInfo.put("user_age_range", age_range);
			    System.out.println(userInfo.get("user_age_range"));
			}
			if (properties != null && kakao_account.containsKey("gender")) {
			    gender = kakao_account.get("gender").toString();
			    userInfo.put("user_gender", gender);
			}
			
			String email = kakao_account.get("email").toString();
			userInfo.put("user_id", email);

			/* 닉네임 저장 */
			// 일단 닉네임 그대로 가져와서
			String nickname = properties.get("nickname").toString();
			// 닉네임에서 이모지 제거
			String emojiRegex = "[^\\p{L}\\p{M}\\p{N}\\p{P}\\p{Z}\\p{Cf}\\p{Cs}\\s]";
			nickname = nickname.replaceAll(emojiRegex, "");
			// 숫자, 문자 제외한 모든 특수문자 제거
			nickname = nickname.replaceAll("[^가-힣a-zA-Z0-9]", "");
			// 문자열 공백 제거 
			nickname = nickname.replaceAll(" ", "");
			// 카카오닉네임이 7글자보다 길면 7글자에서 컷
			if(nickname.length() > 6) {
				nickname = nickname.substring(0,7);				
			}
			// 카카오닉네임이 2글자보다 작거나 (특문거른 결과)공백이면 일단 닉네임은 저장하고, 최종닉네임에 랜덤닉 저장
			if(nickname.length() < 2 || nickname.isBlank() == true ) {
				userInfo.put("user_nickname_kakao", nickname);
				//userInfo.put("user_nickname",  "USER"+userInfo.get("user_code").toString().substring(0,4));
			} else {
				userInfo.put("user_nickname_kakao", nickname);
				//userInfo.put("user_nickname", nickname);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		/* 이 위까지 필요한 유저정보 다 가져와서 Map인 userInfo에 저장 완료 */
		
		// DB에 있는 USER인지 확인
		System.out.println(Long.parseLong(userInfo.get("user_code").toString()));
		user = userDAO.selectUser(Long.parseLong(userInfo.get("user_code").toString()));
		System.out.println("@@@새로갱신@@@"+user);
		// DB에 없으면 insert
		if (user == null) {
			userInfo.put("user_nickname", userInfo.get("user_nickname_kakao"));
			userInfo.put("user_pic", userInfo.get("user_pic_kakao"));
			userDAO.insertUser(userInfo);
			return userDAO.selectUser((Long)userInfo.get("user_code"));
		} else {
			// 변경사항 update : 기존 유저에 로컬닉네임이 존재한다면, 최종 닉네임은 로컬닉네임으로 변경
			if(user.getUser_nickname_local() != null) {
				userInfo.put("user_nickname", user.getUser_nickname_local());
			} else { // 로컬이 없으면 카카오
				userInfo.put("user_nickname", user.getUser_nickname_kakao());
			}
			// 기존 유저에 로컬프사가 존재한다면, 최종 프사는 로컬프사로 변경
			if(user.getUser_pic_local() != null) {
				userInfo.put("user_pic", user.getUser_pic_local());
			} else {
				userInfo.put("user_pic", user.getUser_pic_kakao());
			}
			userDAO.updateUserProfileInfo(userInfo);
			return userDAO.selectUser((Long)userInfo.get("user_code"));
		}
	}

	@Override
	public void getLogout(String access_token) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			int responseCode = conn.getResponseCode();
			System.out.println("LOGOUT RESPONSECODE:" + responseCode);

			if (responseCode == 400)
				throw new RuntimeException("로그아웃 오류!");

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String br_line = "";
			String result = "";
			while ((br_line = br.readLine()) != null) {
				result += br_line;
			}
			System.out.println("LOGOUT 결과:" + result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public User updateUserLocalProfile(User user) throws Exception {
		userDAO.updateUserProfile(user);
		return userDAO.selectUser(user.getUser_code());
	}

	@Override
	public void deleteNicknameLocal(HashMap<String, Object> userInfo) throws Exception {
		userDAO.deleteNicknameLocal(userInfo);
	}

	
}