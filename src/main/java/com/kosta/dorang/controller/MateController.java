package com.kosta.dorang.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.List;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.service.MateService;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
@RequestMapping("/mate")
public class MateController {

	@Autowired
	MateService mateService;
	
	
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String mateList(Model m) throws Exception {
		
		
		List<Mate> matelist = null;
	    try {
	        matelist = mateService.getMateListViewSort();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    m.addAttribute("mateList", matelist);

	    return "/mate/mateList";
	}

	@RequestMapping(value = "/writeform")
	public String Writeform() {
		return "/mate/mateWriteForm";
	}

	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String Insert(HttpServletRequest request) throws Exception {

		MultipartRequest multi = null;
		int fileMaxSize = 2 * 1024 * 1024;
		String savePath = request.getRealPath("resources/img");
		System.out.print(savePath);

		try {
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		long user_code = Long.parseLong(multi.getParameter("user_code"));
		String title =multi.getParameter("title");
		String content = multi.getParameter("content");
		String type = multi.getParameter("type");
		String direction = multi.getParameter("direction");
		String number = multi.getParameter("number");
		String age = multi.getParameter("age");
		String gender = multi.getParameter("gender");
		String daterange = multi.getParameter("daterange");
		String tags = multi.getParameter("tags");
		String status = multi.getParameter("status");
		File file = multi.getFile("image");
		String image = file.getName();
		String first_ask = multi.getParameter("first_ask");
		String second_ask = multi.getParameter("second_ask");
		String third_ask = multi.getParameter("third_ask");
	
		
		Mate m = new Mate(user_code, title, content, type, direction, number, age, gender, daterange, tags, status, image, first_ask, second_ask, third_ask, null);
		
		
		
		mateService.insertMate(m);//mate 테이블에 저장
	
		return "redirect:/mate/list";
	}
	
	
	
	
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public String select(Model m,@RequestParam("mate_code") int mate_Code) {
		Mate mt = null;
		try {
		   mt = mateService.selectMate(mate_Code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		m.addAttribute("mt",mt);
		
		return "/mate/mateDetail";
	}
	
	
	
	
	
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String updateForm(Model m,@RequestParam("mate_code") int mate_Code) {
		Mate mt = null;
		try {
			   mt = mateService.selectMate(mate_Code);
			} catch (Exception e) {
				e.printStackTrace();
			}
			m.addAttribute("mt",mt);
		
		
		return "/mate/mateUpdateForm";
	}
	

	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateMate(HttpServletRequest request) throws Exception {
	
		
		
		MultipartRequest multi = null;
		int fileMaxSize = 2 * 1024 * 1024;
		String savePath = request.getRealPath("resources/img");

		try {
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int mate_code = Integer.parseInt(multi.getParameter("mate_code"));
		System.out.println(mate_code);
		String title =multi.getParameter("title");
		String content = multi.getParameter("content");
		String type = multi.getParameter("type");
		String direction = multi.getParameter("direction");
		String number = multi.getParameter("number");
		String age = multi.getParameter("age");
		String gender = multi.getParameter("gender");
		String daterange = multi.getParameter("daterange");
		String tags = multi.getParameter("tags");
		String status = multi.getParameter("status");
		String first_ask = multi.getParameter("first_ask");
		String second_ask = multi.getParameter("second_ask");
		String third_ask = multi.getParameter("third_ask");
		
		File file = multi.getFile("image");
		
		
		//String image = file.getName();
	
		return "redirect:/";
	}
	
	// 응심이가 만든거 삭제 ㄴㄴ
	@RequestMapping(value="/mymatepage", method=RequestMethod.GET)
	public String mateReply(Model model){
		System.out.println("들어오기");
		return "/mate/mateCommunity";
	}
	
	
}
