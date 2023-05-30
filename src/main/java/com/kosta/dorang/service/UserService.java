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

			// 결과 코드 : 200이면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("#UserService.getAccessToken#_responseCode: " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("#UserService.getAccessToken#_response body : " + result);

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();

			// JSON String을 Map으로 변환
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});
			access_token = jsonMap.get("access_token").toString();
			refresh_token = jsonMap.get("refresh_token").toString();

			System.out.println("#UserService.getAccessToken#_access_token: " + access_token);
			System.out.println("#UserService.getAccessToken#_refresh_token: " + refresh_token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_token;
	}

	@Override
	public User getUserInfo(String access_token) throws Exception {

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기 때문에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_token);

			int responseCode = conn.getResponseCode();
			System.out.println("@UserService.getUserInfo responseCode:" + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("@UserService.getUserInfo response body:" + result);
			System.out.println("@UserService.getUserInfo result type" + result.getClass().getName()); // java.lang.String

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});

			long user_code = (long) jsonMap.get("id");
			System.out.println("@UserService.getUserInfo_user_code:" + user_code);
			userInfo.put("user_code", user_code);

			System.out.println(jsonMap.get("properties"));
			System.out.println(jsonMap.get("kakao_account"));

			Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
			Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");
			
			String user_pic = null;
			String age_range = null;
			String gender = null;
			
			if (properties != null && properties.containsKey("profile_image")) {
			    user_pic = properties.get("profile_image").toString();
			    userInfo.put("user_pic", user_pic);
			    System.out.println(userInfo.get("user_pic"));
			}
			if (properties != null && kakao_account.containsKey("age_range")) {
			    age_range = kakao_account.get("age_range").toString();
			    userInfo.put("user_age_range", age_range);
			    System.out.println(userInfo.get("user_age_range"));
			}
			if (properties != null && kakao_account.containsKey("gender")) {
			    gender = kakao_account.get("gender").toString();
			    userInfo.put("user_gender", gender);
			    System.out.println(userInfo.get("user_gender"));
			}
			
			// **닉네임에 이모지가 존재할 경우 처리 필요 -- 프론트에서 걸러주기**
			String nickname = properties.get("nickname").toString();
			String email = kakao_account.get("email").toString();
			userInfo.put("user_nickname", nickname);				
			userInfo.put("user_id", email);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// DB에 있는 USER인지 확인
		user = userDAO.selectUser(userInfo);
		System.out.println("등록유저 " + user); 

		if (user == null) {
			if(userInfo.get("user_pic")==null && userInfo.get("user_age_range") == null && userInfo.get("user_gender") == null) {
				userDAO.insertUserNothing(userInfo);
			}
			else if(userInfo.get("user_pic")==null && userInfo.get("user_age_range") == null) {
				userDAO.insertUserGender(userInfo);
			}
			else if(userInfo.get("user_pic")==null && userInfo.get("user_gender") == null) {
				userDAO.insertUserAge(userInfo);
			}
			else if(userInfo.get("user_age_range")==null && userInfo.get("user_gender")==null) {
				userDAO.insertUserPic(userInfo);
			}
			else if(userInfo.get("user_pic")==null) {
				userDAO.insertUserAgeAndGender(userInfo);
			}
			else if(userInfo.get("user_gender")==null) {
				userDAO.insertUserPicAndAge(userInfo);
			}
			else if(userInfo.get("user_age_range")==null) {
				userDAO.insertUserPicAndGender(userInfo);
			} else userDAO.insertUserAll(userInfo);  
			
			session.setAttribute("userInfo", user);
			return userDAO.selectUser(userInfo);
		} else {
			session.setAttribute("userInfo", user);
			return user;
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
	public String getAccess_TokenAddition(String authorize_code) throws Throwable {
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

			// 결과 코드 : 200이면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("#UserService.getAccessTokenAddition#_responseCode: " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("#UserService.getAccessTokenAddition#_response body : " + result);

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();

			// JSON String을 Map으로 변환
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});
			access_token = jsonMap.get("access_token").toString();
			refresh_token = jsonMap.get("refresh_token").toString();

			System.out.println("#UserService.getAccessTokenAddition#_access_token: " + access_token);
			System.out.println("#UserService.getAccessTokenAddition#_refresh_token: " + refresh_token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_token;
	}
	

	@Override
	public User getUserInfoAddition(String access_token) throws Exception {
		HashMap<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";		

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_token);

			int responseCode = conn.getResponseCode();
			System.out.println("@UserService.getUserInfoAddition responseCode:" + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("@UserService.getUserInfoAddition response body:" + result);
			System.out.println("@UserService.getUserInfoAddition result type" + result.getClass().getName()); // java.lang.String

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});

			long user_code = (long) jsonMap.get("id");
			System.out.println("@UserService.getUserInfoAddition_user_code:" + user_code);
			userInfo.put("user_code", user_code);

			System.out.println(jsonMap.get("properties"));
			System.out.println(jsonMap.get("kakao_account"));

			Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
			Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

			String user_pic = null;
			String age_range = null;
			String gender = null;
			
			if (properties != null && properties.containsKey("profile_image")) {
			    user_pic = properties.get("profile_image").toString();
			    userInfo.put("user_pic", user_pic);
			    System.out.println(userInfo.get("user_pic"));
			}
			if (properties != null && kakao_account.containsKey("age_range")) {
			    age_range = kakao_account.get("age_range").toString();
			    userInfo.put("user_age_range", age_range);
			    System.out.println(userInfo.get("user_age_range"));
			}
			if (properties != null && kakao_account.containsKey("gender")) {
			    gender = kakao_account.get("gender").toString();
			    userInfo.put("user_gender", gender);
			    System.out.println(userInfo.get("user_gender"));
			}
			
			// **닉네임에 이모지가 존재할 경우 처리 필요 -- 프론트에서 걸러주기**
			String nickname = properties.get("nickname").toString();
			String email = kakao_account.get("email").toString();
			userInfo.put("user_nickname", nickname);				
			userInfo.put("user_id", email);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 새로운 정보까지 userInfo에 저장해왔고, 이제 DB에 update
		// DB에 있는 USER 불러오기 -> DB에 있던 USER정보랑 새로 가져온 userInfo 비교해서 없던게 생겼으면 update
		user = userDAO.selectUser(userInfo);
		System.out.println("DB등록유저 " + user); 
		
		if(user.getUser_pic() == null && userInfo.get("user_pic") != null) {
			userDAO.updateUserPic(userInfo);
			userDAO.deleteUserPicLocal(userInfo); // 프사 연동해서 프사 가져왔으니까 로컬사진 null로 리셋해주기 -- 바로 프사 뜰 수 있게
		}
		if(user.getUser_age_range() == null && userInfo.get("user_age_range") != null) {
			userDAO.updateUserAge(userInfo);
		}
		if(user.getUser_gender() == null && userInfo.get("user_gender") != null) {
			userDAO.updateUserGender(userInfo);
		}
		// DB update 후 다시 가져오는 user
		user = userDAO.selectUser(userInfo);
		session.setAttribute("userInfo", user);
		return user;
	}

}
