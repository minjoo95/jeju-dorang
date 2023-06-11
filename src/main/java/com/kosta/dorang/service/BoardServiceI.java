package com.kosta.dorang.service;

import java.util.List;
import java.util.Map;

import com.kosta.dorang.dto.Board;
import com.kosta.dorang.dto.BoardComments;
import com.kosta.dorang.dto.BoardCriteria;
import com.kosta.dorang.dto.BoardLike;
import com.kosta.dorang.dto.User;

public interface BoardServiceI {

	List<Board> selectBoardList();
	
	List<Map<String, Object>> selectBoardPageList(BoardCriteria cri);
	
	int countBoardListTotal();

	int countBoardSearchListTotal(String boardSearch);

	int insertBoard(Board board);

	Board selectOneBoard(int no);

	int updateBoard(Board board);

	int deleteBoard(int no);

	BoardLike selectOneBoard(BoardLike boardLike);

	int insertBoardLike(BoardLike boardLike);

	int updateBoardLike(int no);

	int insertBoardComments(BoardComments boardComments);

	List<BoardComments> selectBoardCommentsList(int no);

	//삭제
	int deleteBoardComment(int commentNo, int boardId);
	
	
	//
	List<Map<String, Object>> selectBoardSearchPageList(BoardCriteria cri);

	User selectUser(long userCode);

	int countBoardUserListTotal(long userCode);

	List<Map<String, Object>> selectBoardUserPageList(BoardCriteria cri);

	int deleteBoardComment(int commentNo);

	void insertBoardReplyNotice(long baordUserCode, String noticeContent, int comment_no);

}
