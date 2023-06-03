package com.kosta.dorang.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
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
	
	String access_tok;
	String access_tok_addition;
	
	@RequestMapping(value="/kakaoCallback", method = RequestMethod.GET)
	public String kakaoCallBack(@RequestParam(value = "code", required = false) String code) throws Throwable {
		// 로그인 누르면 - 카카오서버에서 토큰 얻어오긴
		access_tok = userService.getAccess_Token(code);
		// 얻어온 토큰으로 카카오서버에 있는 사용자 정보에 접근해서 User객체로 가져오기
		user = userService.getUserInfo(access_tok);
		
		// HttpSession session에 "user" : (Long) user_code
		session.setAttribute("user", user.getUser_code());
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) throws Exception {
		userService.getLogout(access_tok);
		session.setAttribute("user", null);
		session.setAttribute("userInfo", null);
		return "redirect:/";
	}
	
	@RequestMapping(value="/mypage")
	public String myPage() {
		return "myPage";
	}
	
	@RequestMapping(value="/kakaoAddition")
	public String kakaoAdditionAge(@RequestParam(value = "code", required = false) String code) throws Throwable {
		access_tok_addition = userService.getAccess_Token(code);
		access_tok = access_tok_addition;
		user = userService.getUserInfo(access_tok);
		return "redirect:/user/mypage";
	}
	

	@ResponseBody
	@RequestMapping(value="/uploadUserLocalProfile", method = RequestMethod.POST)
	public ModelAndView updateUserProfilePic(@RequestPart(value = "chooseFile",required = false) MultipartFile chooseFile, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();

		Long user_code = Long.parseLong(request.getParameter("bindedUserCode"));
		String user_nickname_local = request.getParameter("changingNickname");
		String user_tag = request.getParameter("changingTags");
		
		System.out.println(user_code);
		System.out.println(user_nickname_local);
		System.out.println(user_tag);
		System.out.println(chooseFile.getOriginalFilename()); // 카카오면 originalFilename이 안잡힘! -> 이걸로 구별

//		Map<String, Object> updateUser = new HashMap<>();
//		updateUser.put("user_code", user_code);
//		updateUser.put("user_nickname_local", user_nickname_local);
//		updateUser.put("user_tag", user_tag);
		
		
		/* user = userService.updateUserLocalProfile(param, chooseFile); */
		mav.setViewName("myPage");
		return mav;
	}
}	

