package com.kosta.dorang.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.dorang.dto.User;
import com.kosta.dorang.service.UserServiceI;


@Controller @RequestMapping("/user")
public class UserController {
	
	@Autowired
	HttpSession session;
	@Autowired
	UserServiceI userService;
	@Autowired
	User user;
	
	String access_tok="";
	
	@RequestMapping(value="/kakaoCallback", method = RequestMethod.GET)
	public String kakaoCallBack(@RequestParam(value = "code", required = false) String code) throws Throwable {
		// 로그인 누르면 - 카카오서버에서 토큰 얻어오기
		access_tok = userService.getAccess_Token(code);
		// 얻어온 토큰으로 카카오서버에 있는 사용자 정보에 접근해서 User객체로 가져오기
		user = userService.getUserInfo(access_tok);
		
		// HttpSession session에 "user" : (Long) user_code
		System.out.println("*********************************************"+user.getUser_pic());
		
		HashMap<String, Object> userInfo = new HashMap<>();
		userInfo.put("user_code", user.getUser_code());
		userInfo.put("user_id", user.getUser_id());
		userInfo.put("user_nickname_kakao", user.getUser_nickname_kakao());
		userInfo.put("user_pic", user.getUser_pic());
		userInfo.put("user_nickname", user.getUser_nickname());
		userInfo.put("user_pic_kakao", user.getUser_pic_kakao());
		userInfo.put("user_age_range", user.getUser_age_range());
		userInfo.put("user_gender", user.getUser_gender());
		userInfo.put("user_nickname_local", user.getUser_nickname_local());
		userInfo.put("user_tag", user.getUser_tag());
		userInfo.put("user_pic_local", user.getUser_pic_local());
		
		session.setAttribute("user", user.getUser_code());
		session.setAttribute("userInfo", userInfo);
		session.setAttribute("access_token", access_tok);
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) throws Exception {
		userService.getLogout(access_tok);
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/mypage")
	public String myPage() {
		return "myPage";
	}
	
	@RequestMapping(value="/kakaoAddition")
	public String kakaoAddition(@RequestParam(value = "code", required = false) String code, HttpServletRequest request) throws Throwable {
		access_tok = userService.getAccess_TokenRe(code);
		user = userService.getUserInfo(access_tok);

		request.setCharacterEncoding("utf-8");

		HashMap<String, Object> userInfo = (HashMap)request.getSession().getAttribute("userInfo");
		userInfo.put("user_pic_kakao", user.getUser_pic_kakao());
		
		request.getSession().setAttribute("userInfo", userInfo);
		request.getSession().setAttribute("access_token", access_tok);
		return "redirect:/user/mypage";
	}
	
	
	@RequestMapping(value="/disconnectKakao", method = RequestMethod.GET)
	public String disconnectKakao(HttpSession session, HttpServletRequest request) {
		// 카카오 로그인 연결 끊기
		userService.disconnectKakao((String)session.getAttribute("access_token"));
		// 서버 DB 회원정보 삭제
		userService.deleteUser((HashMap<String, Object>)session.getAttribute("userInfo"));
		session.invalidate();
		return "redirect:/";
	}	
	
	
	@RequestMapping(value="/deleteNicknameLocal")
	public String deleteNicknameLocal(HttpServletRequest request) {
		HashMap<String, Object> userInfo = null;
		try {
			request.setCharacterEncoding("utf-8");
			userInfo = (HashMap)request.getSession().getAttribute("userInfo");
			userInfo.put("user_nickname", userInfo.get("user_nickname_kakao"));
			userInfo.put("user_nickname_local", null);
			userService.deleteNicknameLocal(userInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("userInfo", userInfo);
		return "redirect:/";
	}
	
	@RequestMapping(value="/deletePicLocal")
	public String deletePicLocal(HttpServletRequest request) {
		HashMap<String, Object> userInfo = null;
		try {
			request.setCharacterEncoding("utf-8");
			userInfo = (HashMap)request.getSession().getAttribute("userInfo");
			userInfo.put("user_pic_local", null);
			userInfo.put("user_pic", userInfo.get("user_pic_kakao"));
			userService.deletePicLocal(userInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("userInfo", userInfo);
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="/getSelectedTags", method= RequestMethod.GET)
	public Map<String, Object> getSelectedTags(HttpServletRequest request) {
		HashMap<String, Object> userInfo = (HashMap)request.getSession().getAttribute("userInfo");
		Map<String, Object> response = new HashMap<>();
		response.put("tags", userInfo.get("user_tag").toString());
		return response;
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadUserLocalProfile", method = RequestMethod.POST)
	public ModelAndView updateUserProfilePic(@RequestParam MultipartFile pic_local,
											@RequestParam Long bindedUserCode,
											@RequestParam String changingNickname,
											@RequestParam String changingTags,
											HttpServletRequest request ) throws Exception {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> userInfo = (HashMap)request.getSession().getAttribute("userInfo");
		
		String fullPath = "";
		String user_nickname = (String)userInfo.get("user_nickname");
		
		String user_tag = (String)userInfo.get("user_tag");
		
		String user_pic = (String)userInfo.get("user_pic");
		String picOriginalName = null;
		String picFileName = (String)userInfo.get("user_pic");
		
		String up = request.getSession().getServletContext().getRealPath("/").concat("resources");
		String uploadDir = up+"\\uploadProfilePic\\";

		// 파일이 비어있지 않으면
		if(!pic_local.isEmpty()) {
			picOriginalName = pic_local.getOriginalFilename(); // 파일의 진짜 원래 이름 (-.png)
			picFileName = bindedUserCode+pic_local.getOriginalFilename(); // 파일을 저장할 이름 (코드-.png --> DB)
			
			fullPath = uploadDir + picFileName; // 파일을 저장했을 때 볼 수 있는 전체 경로
			
			//파일 경로 지정
			if(user.getUser_pic_local() != null) {
				//현재 게시판에 존재하는 파일객체를 만듦
				File file = new File(uploadDir+(String)userInfo.get("user_pic"));
				if(file.exists()) { // 파일이 존재하면
					file.delete(); // 파일 삭제	
				}
			}
			
			pic_local.transferTo(new File(fullPath));
		}
		// 파일 업로드 완료
		
		// 새로 입력한 닉네임이 공백이면(아무것도 입력하지 않았다면) 
		if(changingNickname.trim().length()<1 || changingNickname == null) {
			// 아무것도 입력하지 않았지만, 최종 닉이 로컬이라면 유지
			if((String)userInfo.get("user_nickname_local") != null) {
				changingNickname = user.getUser_nickname_local();
				user_nickname = changingNickname;
			} else { // 아무것도 입력하지 않고, 최종 닉도 로컬이 아니라면- 로컬이 비어있다면
				changingNickname = null;
				user_nickname = (String)userInfo.get("user_nickname_kakao");
			}
		} else if (changingNickname == user_nickname ) { // 새로 입력한 값이 본래 닉네임과 같다면 그대로
			changingNickname = user_nickname;
		} else { // 새로 입력한값이 본래 닉네임과 다르면 새로 설정
			user_nickname = changingNickname;
		}
		// 닉네임 설정 완료
		
		// 파일의 원래 이름이 비었으면 / 디폴트 파일이라면 ( 파일 업로드가 안됨 )
		if(picOriginalName == null || picOriginalName.indexOf("img_profileDefault") > -1 || picOriginalName.indexOf("kakao") > -1) {
			// 업로드를 하지 않았지만, 최종 사진이 로컬이라면 유지해야 함
			if((String)userInfo.get("user_pic_local") != null) {
				picFileName = (String)userInfo.get("user_pic_local");
				user_pic = picFileName;
			} else { // 업로드를 하지 않았는데, 로컬사진이 비어있다면 
			picFileName = null; // db에 넘길 picFIleName = null
			user_pic = (String)userInfo.get("user_pic_kakao"); // 최종 pic은 카카오로
			}	
		// 올린 파일과 최종 사진이 같다면 그대로 
		} else if (user_pic == picFileName) {
			picFileName = user_pic;
		} else { // 올린 파일과 최종 사진이 다르다면 최종사진은 올린 사진
			user_pic = picFileName;
		}
		// 프사 설정 완료 
		
		// 태그에 아무것도 입력되지 않았다면
		if(changingTags == null) {
			if(((String)userInfo.get("user_tag")).trim() != null) { // 근데 유저태그가 비어있지 않다면
				changingTags = user_tag; // 원래태그 유지
			} else { // 유저태그가 비어있으면
				changingTags = null;
				user_tag = changingTags; // null 유지
			}
		} // 태그 선택했다면 changingTags 그대로 db에 입력
		
		user = new User(bindedUserCode, user_pic, user_nickname, changingNickname, changingTags, picFileName);
		user = userService.updateUserLocalProfile(user); 
		
		userInfo = new HashMap<>();
		userInfo.put("user_code", user.getUser_code());
		userInfo.put("user_id", user.getUser_id());
		userInfo.put("user_nickname_kakao", user.getUser_nickname_kakao());
		userInfo.put("user_pic", user.getUser_pic());
		userInfo.put("user_nickname", user.getUser_nickname());
		userInfo.put("user_pic_kakao", user.getUser_pic_kakao());
		userInfo.put("user_age_range", user.getUser_age_range());
		userInfo.put("user_gender", user.getUser_gender());
		userInfo.put("user_nickname_local", user.getUser_nickname_local());
		userInfo.put("user_tag", user.getUser_tag());
		userInfo.put("user_pic_local", user.getUser_pic_local());
		
		request.getSession().setAttribute("userInfo", userInfo);
		mav.setViewName("myPage");
		return mav;
	}
	
}	

