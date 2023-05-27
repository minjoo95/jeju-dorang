package com.kosta.dorang.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.service.MateService;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Controller @RequestMapping("/mate")
public class MateController {
	
	@Autowired
	MateService mateService;
	

	@RequestMapping(value = "/writeform", method=RequestMethod.GET)
	public String Writeform() {
		return "/mate/mateWriteForm";
	}
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String Insert(RedirectAttributes rttr,HttpServletRequest request,Mate m) throws Exception {
		
	
		int fileMaxSize = 1024*1024*1024;
		String savePath=request.getRealPath("resources/img");
        
	

		try {
			MultipartRequest multi =  new MultipartRequest(request,savePath,fileMaxSize ,"UTF-8", new DefaultFileRenamePolicy());
			
			
		} catch (Exception e) {
			e.printStackTrace();
			rttr.addFlashAttribute("msgType","실패메세지");
			rttr.addFlashAttribute("msg","파일의 크기를 10MB를 넘을 수 없습니다.");
			
			return "";
		}
		
		//System.out.println(multi.getParameter("content"));		
		
		//mateService.insertMate(m);
		//다시 불러서 디테일에 보내기 
		
		//return "/mate/mateDetail";
		return null;
	}
}
