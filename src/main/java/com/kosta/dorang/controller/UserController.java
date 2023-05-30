package com.kosta.dorang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
		System.out.println("추가 aT:"+access_tok_addition);
		access_tok = access_tok_addition;
		user = userService.getUserInfoAddition(access_tok);
		return "redirect:/user/mypage";
	}
	
	@RequestMapping(value="/submitPic", method = RequestMethod.POST)
	public void submitPic(@RequestParam(value = "chooseFile", required = false) MultipartFile local_pic) throws Throwable {
		System.out.println("-------------submitPic-----------------");
		System.out.println("contentType"+local_pic.getContentType());
		System.out.println("name"+local_pic.getName());
		System.out.println("filename"+local_pic.getOriginalFilename());
		System.out.println("tostring"+local_pic.toString());
	}
	
}
