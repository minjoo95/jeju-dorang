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
	
	@ResponseBody
	@RequestMapping(value = "/image_upload.do", method = RequestMethod.POST)
	public String imageUpload(@RequestParam("image")MultipartFile multipartFile, @RequestParam String uri, HttpServletRequest request) {

		if (multipartFile.isEmpty()) {
			System.out.println("비어있음");
		}
		
		String directory = null;
		directory = request.getSession().getServletContext().getRealPath("resources/upload/board/");

		System.out.println("directory : " + directory);
		
		String fileName = multipartFile.getOriginalFilename();
		int lastIndex = fileName.lastIndexOf(".");
		String ext = fileName.substring(lastIndex, fileName.length());
		String newFileName = LocalDate.now() + "_" + System.currentTimeMillis() + ext;

		try {
			File image = new File(directory + newFileName);

			multipartFile.transferTo(image);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("fianlly");
		}

		String path = request.getContextPath();
		int index = request.getRequestURL().indexOf(path);
		String url = request.getRequestURL().substring(0, index);
		
		System.out.println(url + request.getContextPath() + "/resources/upload/board/" + newFileName);
		return url + request.getContextPath() + "/resources/upload/board/" + newFileName;
	}
	
	
	
//	@ResponseBody
	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
//	public String boardEnroll(Model model, Board board) {
	public String boardEnroll(Board board) {
//	public void boardEnroll(Model model, Board board) {	

		//Session
		
		try {
			
			System.out.println(board.getUser_code());
			System.out.println(board.getBoard_category());
			System.out.println(board.getBoard_title());
			System.out.println(board.getBoard_content());
			System.out.println(board.getBoard_reg_date());
			System.out.println(board.getBoard_like());
			
			String afterContent = replaceSpace(board.getBoard_content());
			
			board.setBoard_content(afterContent);
			
			int result = boardServiceI.insertBoard(board);
//			model.addAttribute("");
			
		} catch(Exception e) {
			System.out.println("게시글 등록 오류");
			e.printStackTrace();
		}
		
		return "redirect:/board/list";
//		return "/board/boardMain";
		//return "";
		
	
	}
	
	public String replaceSpace(String beforeContent) {
			
		String afterContent = beforeContent.replaceAll("  ", "&nbsp;&nbsp;");
		System.out.println("afterContent : " + afterContent);
		return afterContent;
		
	}
	
	@RequestMapping("/boardDetail")
	public void boardSelectOne(@RequestParam int no, Model model) {
		boardServiceI.selectBoardList();
		
		try {
			
			Board board = boardServiceI.selectOneBoard(no);
			
			System.out.println("boardDetail : " + board.getBoard_title());
			System.out.println("boardDetail : " + board.getBoard_content());
			model.addAttribute("board", board);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.GET)
	public void boardUpdateView(@RequestParam int no, Model model) {
		
		Board board = boardServiceI.selectOneBoard(no);
		
		System.out.println("boardUpdateView : " + board.getBoard_title());
		System.out.println("boardUpdateView : " + board.getBoard_content());
		model.addAttribute("board", board);
		
		
	}
	
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
//	public void boardUpdate(Board board) {
	public String boardUpdate(Board board) {
		
		System.out.println("update board_id : " + board.getBoard_id());
		System.out.println("update user_code : " + board.getUser_code());
		System.out.println("update title : " + board.getBoard_title());
		System.out.println("update content : " + board.getBoard_content());
		System.out.println("update reg date: " + board.getBoard_reg_date());
		System.out.println("update like: " + board.getBoard_like());
		
		String afterContent = replaceSpace(board.getBoard_content());		
		board.setBoard_content(afterContent);
		
		int result = boardServiceI.updateBoard(board);
		
		System.out.println(result);
		
		System.out.println("after update : " + board.getBoard_title());
		
		return "redirect:/board/boardDetail?no=" + board.getBoard_id();
		//return "redirect:/board/list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/boardDelete", method = RequestMethod.POST)
	public int boardDelete(Integer board_id) { //int board_id
		
		int no = (int)board_id;
		
		System.out.println("no : " + no);
		int result = boardServiceI.deleteBoard(no);
		
		return result;
	}
	
	
	
}
