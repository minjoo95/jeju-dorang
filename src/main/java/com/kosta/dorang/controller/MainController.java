package com.kosta.dorang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateUser;
import com.kosta.dorang.dto.Trip;
import com.kosta.dorang.dto.User;
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
	
	
//	@RequestMapping(value = "/", method=RequestMethod.GET)
//	public String main(Model model) throws Exception{
//
//		List<Trip> tripList=null;
//		List<MateUser> mateList=null;
//
//		try {
//			tripList = mainServiceI.selectBestTripList();
//			for(Trip a:tripList) {
//				System.out.println(a);
//			}
//			model.addAttribute("place",tripList);
//			
////			if(session!=null) {
////				User user=(User) session.getAttribute("userInfo");
////				if(user!=null) {
////				System.out.println(user.getUser_nickname());
////				model.addAttribute(user);
////				}else {
////					System.out.println("로그인 필요");
////				}
////			}
//			
//			//HOT 동행
//			mateList = mainServiceI.selectHotMateList();
//			for(Mate a:mateList) {
//				System.out.println(a);
//			}
//			model.addAttribute("mateA",mateList);
//			
//			//MY 동행
////			User userInfo=(User) session.getAttribute("userInfo");
//			User user=(User) session.getAttribute("user");
//			System.out.println("user_code="+user.getUser_code());
//			mateList = mainServiceI.selectMyMateList(user.getUser_code());
//			System.out.println("왜 my 동행 안나와");
//			for(Mate a:mateList) {
//				System.out.println(a);
//			}
//			model.addAttribute("mateB",mateList);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "main";
//	}
	
	@RequestMapping(value = "/", method=RequestMethod.GET)
    public String main(Model model) throws Exception{

        List<Trip> tripList=null;
        List<MateUser> mateList=null;

        try {
            tripList = mainServiceI.selectBestTripList();
            for(Trip a:tripList) {
                System.out.println(a);
            }
            model.addAttribute("place",tripList);

//            if(session!=null) {
//                User user=(User) session.getAttribute("userInfo");
//                if(user!=null) {
//                System.out.println(user.getUser_nickname());
//                model.addAttribute(user);
//                }else {
//                    System.out.println("로그인 필요");
//                }
//            }

            mateList = mainServiceI.selectHotMateList();
            for(Mate a:mateList) {
                System.out.println(a);
            }
            model.addAttribute("mateA",mateList);

            long user_code =  (long) session.getAttribute("user");
            System.out.println("user_code="+user_code);
            mateList = mainServiceI.selectMyMateList(user_code);
            for(Mate a:mateList) {
                System.out.println(a);
            }
            model.addAttribute("mateB",mateList);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "main";
    }
}
