package com.kosta.dorang.controller;

import java.util.Locale;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.dorang.dto.Article;

@Controller
public class MainController {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		try {
			Article article1 = sqlSession.selectOne("mapper.board.selectBoard", 3);
			Article article2 = sqlSession.selectOne("mapper.board.selectBoard", 2);
			System.out.println(article1);
			System.out.println(article2);
			model.addAttribute("data", article1);	
			model.addAttribute("data2", article2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "home";
	}
	
}
