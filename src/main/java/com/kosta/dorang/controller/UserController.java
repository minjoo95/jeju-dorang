package com.kosta.dorang.controller;

import java.util.HashMap;
import java.util.Map;

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
		access_tok = userService.getAccess_Token(code);
		System.out.println("처음 aT"+access_tok);
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
		access_tok_addition = userService.getAccess_TokenAddition(code);
		access_tok = access_tok_addition;
		user = userService.getUserInfoAddition(access_tok);
		return "redirect:/user/mypage";
	}
	

	@ResponseBody
	@RequestMapping(value="/uploadUserProfile", method = RequestMethod.POST)
	public Map<String, Object> updateUserProfile(@RequestPart(value = "key",required = false) Map<String, Object> param) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		System.out.println("파람"+param);
		user = userService.updateUserProfile(param);
		result.put("SUCCESS", true);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/uploadUserPic", method = RequestMethod.POST)
	public ModelAndView updateUserProfilePic(@RequestPart(value = "chooseFile",required = false) MultipartFile chooseFile) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("파일"+chooseFile);
		System.out.println(chooseFile.getOriginalFilename());
		/* user = userService.updateUserProfile(param, chooseFile); */
		mav.setViewName("myPage");
		return mav;
	}
}	

