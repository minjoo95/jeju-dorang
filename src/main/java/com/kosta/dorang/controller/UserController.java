package com.kosta.dorang.controller;

import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.dorang.dto.User;
import com.kosta.dorang.service.UserServiceI;

@Controller @RequestMapping("/user")
public class UserController {
	
	@Autowired
	HttpSession session;
	@Autowired
	UserServiceI userSerivce;
	@Autowired
	User user;
	
	String access_tok;
	
	@RequestMapping(value="/kakaoCallback", method = RequestMethod.GET)
	public String kakaoCallBack(@RequestParam(value = "code", required = false) String code) throws Throwable {
		access_tok = userSerivce.getAccess_Token(code);
		user = userSerivce.getUserInfo(access_tok);
		
		// HttpSession session에 "user" : (Long) user_code
		session.setAttribute("user", user.getUser_code());
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) throws Exception {
		userSerivce.getLogout(access_tok);
		session.setAttribute("user", null);
		session.setAttribute("userInfo", null);
		return "redirect:/";
	}
	
	@RequestMapping(value="/mypage")
	public String myPage() {
		return "myPage";
	}
}
