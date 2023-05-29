package com.kosta.dorang.controller;

import java.io.File;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.dorang.dto.Board;
import com.kosta.dorang.service.BoardServiceI;

@Controller
@RequestMapping("/board")
public class BoardController {
		
	@Autowired
	private BoardServiceI boardServiceI;
	
	@RequestMapping("/list")
	public String boardList(Model model) {
		
		//페이징 추가하기 -> 코드수정
		
		//search 추가
		
		try {
			
			List<Board> list = boardServiceI.selectBoardList();
			model.addAttribute("list", list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "board/boardMain";
	}
	
	@RequestMapping(value= "/boardWrite", method=RequestMethod.GET)
	public String boardWrite(Model model, HttpSession session) { //이름
		
		if(session.getAttribute("user") == null) {
			System.out.println("null일때");
			//jsp에 로그인 하라는 창 추가하기
			return "redirect:/board/list";
		}

		return "board/boardWrite";
		
	}
	
	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
	public String boardEnroll(@RequestParam("image")MultipartFile multipartFile, @RequestParam String uri, HttpServletRequest request) {
		
		if(multipartFile.isEmpty()) {
			System.out.println("파일이 없음.");
		}
		
		String directory = null;
		directory = request.getSession().getServletContext().getRealPath("resources/upload/board/");
		
		String fileName = multipartFile.getOriginalFilename();
		int lastIndex = fileName.lastIndexOf(".");
		String ext = fileName.substring(lastIndex, fileName.length());
		String newFileName = LocalDate.now() + "_" + System.currentTimeMillis() + ext;
	
		try {
			
			File image = new File(directory + newFileName);
			
			multipartFile.transferTo(image);
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("uri : " + uri);
			System.out.println("directory : " + directory);
			System.out.println("newFileName : " + newFileName);
		}
		
		String path = request.getContextPath();
		int index = request.getRequestURL().indexOf(path);
		String url = request.getRequestURL().substring(0, index);
		
		return url + request.getContextPath() + "/resources/upload/board/" + newFileName;
	
	}
	
}
