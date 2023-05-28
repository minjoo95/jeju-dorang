package com.kosta.dorang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		try {
			
			List<Board> list = boardServiceI.selectBoardList();
			model.addAttribute("list", list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "board/boardMain";
	}
	
	@RequestMapping("/boardWrite")
	public void boardWrite() {
	
	}
	
}
