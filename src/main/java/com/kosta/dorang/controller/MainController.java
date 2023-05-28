package com.kosta.dorang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.Trip;
import com.kosta.dorang.service.MainServiceI;

@Controller
public class MainController{

	@Autowired
	HttpSession session;
	
	/* SqlSessionTemplate sqlSession; */
	
	//@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) throws Exception {
//		try {
//			Article article1 = sqlSession.selectOne("mapper.board.selectBoard", 3);
//			Article article2 = sqlSession.selectOne("mapper.board.selectBoard", 2);
//			System.out.println(article1);
//			System.out.println(article2);
//			model.addAttribute("data", article1);	
//			model.addAttribute("data2", article2);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return "home";
//	}
	
	@Autowired
	private MainServiceI mainServiceI;
	
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String main(Model model) throws Exception{
		
		session.setAttribute("user", "sora6015");

		List<Trip> tripList=null;
		List<Mate> mateList=null;
		try {
			tripList = mainServiceI.selectBestTripList();
			for(Trip a:tripList) {
				System.out.println(a);
			}
			model.addAttribute("place",tripList);
//			mateList = mainServiceI.selectHotMateList();
//			for(Mate a:mateList) {
//				System.out.println(a);
//			}
//			model.addAttribute("mateA",mateList);
//			mateList = mainServiceI.selectMyMateList(kakao_id);
//			for(Mate a:mateList) {
//				System.out.println(a);
//			}
//			model.addAttribute("mateB",mateList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main";
	}
	
	/*
	 * @RequestMapping(value = "logout", method=RequestMethod.GET) public String
	 * mainLogout() throws Exception{ session.removeAttribute("id");
	 * System.out.println("로그아웃"); return "redirect:/"; }
	 */

}
