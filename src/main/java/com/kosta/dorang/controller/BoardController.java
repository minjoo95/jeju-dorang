package com.kosta.dorang.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import com.kosta.dorang.dto.BoardComments;
import com.kosta.dorang.dto.BoardCriteria;
import com.kosta.dorang.dto.BoardLike;
import com.kosta.dorang.dto.BoardPageMaker;
import com.kosta.dorang.dto.User;
import com.kosta.dorang.service.BoardServiceI;

@Controller
@RequestMapping("/board")
public class BoardController {
		
	@Autowired
	private BoardServiceI boardServiceI;
	
	@RequestMapping("/list")
//	public String boardList(Model model) {
	public String boardList(Model model, BoardCriteria cri) {
		
		//페이징
		BoardPageMaker pageMaker = new BoardPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardServiceI.countBoardListTotal());
		
		List<Map<String, Object>> list = boardServiceI.selectBoardPageList(cri);
		System.out.println("boardList : " + list);
		System.out.println("boardList Size : " + list.size());
		
		for(int i=0; i < list.size(); i ++) {
			System.out.println(list.get(i));
			System.out.println(list.get(i).get("board_reg_date"));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			//LocalDateTime -> Date
			//이렇게까지...?
			LocalDateTime ldt = (LocalDateTime) list.get(i).get("board_reg_date");
			Instant instant = ldt.atZone(ZoneId.systemDefault()).toInstant();
			Date regDate = Date.from(instant);
			
			System.out.println("regDate : " + regDate);
			System.out.println("sdf : " + sdf.format(regDate));
			
			list.get(i).replace("board_reg_date", sdf.format(regDate));
			
			System.out.println("after list : " + list.get(i));
		}
		
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		
		
		
/*		try {
			
			List<Board> list = boardServiceI.selectBoardList();
			model.addAttribute("list", list);
		} catch(Exception e) {
			e.printStackTrace();
		}*/
		
		return "board/boardMain";
	}
	
	//제목 검색만
	@RequestMapping(value= "/boardSearch", method=RequestMethod.GET)
	public void boardSearchList(Model model, BoardCriteria cri, @RequestParam String boardSearch) {
		
		System.out.println("boardSearch : " + boardSearch);
		
		BoardPageMaker pageMaker = new BoardPageMaker();

		cri.setSearch(boardSearch);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardServiceI.countBoardSearchListTotal(boardSearch));
		
		List<Map<String, Object>> list = boardServiceI.selectBoardSearchPageList(cri);
		
		System.out.println("boardSearchList : " + list);
		System.out.println("boardSearchList Size : " + list.size());
		
		for(int i=0; i < list.size(); i ++) {
			System.out.println(list.get(i));
			System.out.println(list.get(i).get("board_reg_date"));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			//LocalDateTime -> Date
			//이렇게까지...?
			LocalDateTime ldt = (LocalDateTime) list.get(i).get("board_reg_date");
			Instant instant = ldt.atZone(ZoneId.systemDefault()).toInstant();
			Date regDate = Date.from(instant);
			
			System.out.println("regDate : " + regDate);
			System.out.println("sdf : " + sdf.format(regDate));
			
			list.get(i).replace("board_reg_date", sdf.format(regDate));
			
			System.out.println("after list : " + list.get(i));
		}
		
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);	
		
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
		//boardServiceI.selectBoardList();
		
		try {
			
			Board board = boardServiceI.selectOneBoard(no);
			
			System.out.println("boardDetail : " + board.getBoard_title());
			System.out.println("boardDetail : " + board.getBoard_content());
			
			List<BoardComments> commentsList = boardServiceI.selectBoardCommentsList(no);
			System.out.println("commentsList : " + commentsList);
			
			
			model.addAttribute("board", board);
			model.addAttribute("commentsList", commentsList);
		
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
		
		System.out.println("update board: " + board);

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
	
	@ResponseBody
	@RequestMapping(value = "/boardLike", method = RequestMethod.POST)
	public int boardLike(Integer board_id, Long user_code) { //int board_id
	//public void boardLike(Integer board_id, Long user_code) {	
		
		int no = (int)board_id;
		long userCode = (long)user_code;
		
		System.out.println("no : " + no);
		System.out.println("userCode : " + userCode);
		
		//db확인
		
		BoardLike boardLike = new BoardLike(no, userCode);
		
		BoardLike resultBoardLike = boardServiceI.selectOneBoard(boardLike);
		
		if(resultBoardLike == null) {
			//db에 없으면 넣어주고 + board db like + 1
			
			//int result = boardServiceI.insertBoardLike(boardLike);
			int result1 = boardServiceI.insertBoardLike(boardLike);
			//System.out.println("like result : "  + result);
			
			//board db like + 1
			int result2 = boardServiceI.updateBoardLike(no);
			
			int likeCount = boardServiceI.selectOneBoard(no).getBoard_like();
			
			
			return likeCount;
			
		} else {
			//db에 있으면 안 넣어주고
			System.out.println("이미 있음!");
		
			return 0;
		}
		

	}
	
	@RequestMapping(value = "/boardCommentWrite", method = RequestMethod.POST)
	public String boardCommentWrite(BoardComments boardComments) {

		try {
			
			System.out.println(boardComments);
			
			int result = boardServiceI.insertBoardComments(boardComments);
			System.out.println("댓글 등록 갔다 옴");
//			model.addAttribute("");
			
		} catch(Exception e) {
			System.out.println("게시글 등록 오류");
			e.printStackTrace();
		}
		
		return "redirect:/board/boardDetail?no=" + boardComments.getBoard_id();
	
	}
	
	@RequestMapping(value = "/boardDeleteComment", method = RequestMethod.POST)
	public String boardDeleteComment(String comment_no, String board_id) {
	
		int commentNo = Integer.parseInt(comment_no);
		int boardId = Integer.parseInt(board_id);
		
		//delete하기
		int result = boardServiceI.deleteBoardComment(commentNo, boardId);
		
		return "";
	}
	
	//유저 프로필 보기
	@ResponseBody
	@RequestMapping(value = "/writerInfo", method = RequestMethod.POST)
//	public int boardLike(String user_code) { //int board_id
//	public int writerInfo(String user_code) {
	public User writerInfo(String user_code) {
		
		long userCode = Long.parseLong(user_code);
		System.out.println("userCode : " + userCode);
		
		//int result = boardServiceI.selectUser(userCode);
		
		User user = boardServiceI.selectUser(userCode);
		System.out.println("userInfo : " + user);
		System.out.println(user.getUser_id());
		
		//return 1;
		return user;
	}
	
	@RequestMapping(value = "/userBoard", method = RequestMethod.POST)
//	public int boardLike(String user_code) { //int board_id
	public void userBoard(Model model, BoardCriteria cri, @RequestParam String user_code)  {
		
		User user = writerInfo(user_code);
		System.out.println(user.getUser_nickname());
		
		long userCode = Long.parseLong(user_code);
		System.out.println("userBoard userCode : " + userCode);
		
		BoardPageMaker pageMaker = new BoardPageMaker();

		cri.setUserCode(userCode);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardServiceI.countBoardUserListTotal(userCode));
		
		List<Map<String, Object>> list = boardServiceI.selectBoardUserPageList(cri);
		
		System.out.println("boardUserList : " + list);
		System.out.println("boardUserList Size : " + list.size());
		
		for(int i=0; i < list.size(); i ++) {
			System.out.println(list.get(i));
			System.out.println(list.get(i).get("board_reg_date"));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			//LocalDateTime -> Date
			//이렇게까지...?
			LocalDateTime ldt = (LocalDateTime) list.get(i).get("board_reg_date");
			Instant instant = ldt.atZone(ZoneId.systemDefault()).toInstant();
			Date regDate = Date.from(instant);
			
			System.out.println("regDate : " + regDate);
			System.out.println("sdf : " + sdf.format(regDate));
			
			list.get(i).replace("board_reg_date", sdf.format(regDate));
			
			System.out.println("after list : " + list.get(i));
		}
		
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);	
		model.addAttribute("user", user);
		
	}
	
}
