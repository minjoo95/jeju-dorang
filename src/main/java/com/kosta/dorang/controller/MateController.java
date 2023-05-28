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
	
	
	
	
	
	
	

	@RequestMapping(value = "/writeform", method = RequestMethod.GET)
	public String Writeform() {
		return "/mate/mateWriteForm";
	}

	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String Insert(RedirectAttributes rttr, HttpServletRequest request) throws Exception {

		MultipartRequest multi = null;
		int fileMaxSize = 2 * 1024 * 1024;
		String savePath = request.getRealPath("resources/img");

		
		
		multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());

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
}
