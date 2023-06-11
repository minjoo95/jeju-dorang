package com.kosta.dorang.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.dorang.dao.BoardDAOI;
import com.kosta.dorang.dto.Board;
import com.kosta.dorang.dto.BoardComments;
import com.kosta.dorang.dto.BoardCriteria;
import com.kosta.dorang.dto.BoardLike;
import com.kosta.dorang.dto.BoardWithNickname;
import com.kosta.dorang.dto.User;

@Service
public class BoardService implements BoardServiceI {

	@Autowired
	private BoardDAOI boardDaoI;

	@Override
	public List<Board> selectBoardList() {
		
		return boardDaoI.selectBoardList();
	}
	
	@Override
	public List<Map<String, Object>> selectBoardPageList(BoardCriteria cri) {
		return boardDaoI.selectBoardPageList(cri);
	}
	
	@Override
	public int countBoardListTotal() {
		return boardDaoI.countBoardListTotal();
	}
	
	@Override
	public int countBoardSearchListTotal(String boardSearch) {
		return boardDaoI.countBoardSearchListTotal(boardSearch);
	}
	
	@Override
	public int insertBoard(Board board) {
		
		return boardDaoI.insertBoard(board);
	}

	@Override
//	public Board selectOneBoard(int no) {
	public BoardWithNickname selectOneBoard(int no)	{
		
		return boardDaoI.selectOneBoard(no);
	}

	@Override
	public int updateBoard(Board board) {
	
		return boardDaoI.updateBoard(board);
	}

	@Override
	public int deleteBoard(int no) {
		
		return boardDaoI.deleteBoard(no);
	}

	@Override
	public BoardLike selectOneBoard(BoardLike boardLike) {
		
		return boardDaoI.selectOneBoardLike(boardLike);

	}

	@Override
	public int insertBoardLike(BoardLike boardLike) {
		
		return boardDaoI.insertBoardLike(boardLike);
	}

	@Override
	public int updateBoardLike(int no) {

		return boardDaoI.updateBoardLike(no);		
	}

	@Override
	public int insertBoardComments(BoardComments boardComments) {
		
		return boardDaoI.insertBoardComments(boardComments);
	}

	@Override
	public List<BoardComments> selectBoardCommentsList(int no) {
		
		return boardDaoI.selectBoardCommentsList(no);
	}

	
	//삭제
	@Override
	public int deleteBoardComment(int commentNo, int boardId) {

		return boardDaoI.deleteBoardComment(commentNo, boardId);
	}

	@Override
	public List<Map<String, Object>> selectBoardSearchPageList(BoardCriteria cri) {
		
		return boardDaoI.selectBoardSearchPageList(cri);
	}

	@Override
	public User selectUser(long userCode) {
		
		return boardDaoI.selectUser(userCode);
	}

	@Override
	public int countBoardUserListTotal(long userCode) {
		
		return boardDaoI.countBoardUserListTotal(userCode);
	}

	@Override
	public List<Map<String, Object>> selectBoardUserPageList(BoardCriteria cri) {
		
		return boardDaoI.selectBoardUserPageList(cri);
	}

	@Override
	public int deleteBoardComment(int commentNo) {
		
		return boardDaoI.deleteBoardComment(commentNo);
	}

	@Override
	public int updateParentCommentNo(int comment_no) {
		
		return boardDaoI.updateParentCommentNo(comment_no);
	}

	@Override
	public int updateCommentGroupOrder(List<BoardComments> commentsList) {
		
		return boardDaoI.updateCommentGroupOrder(commentsList);
		
	}

	@Override
	public BoardComments selectOneBoardComment(int parent_comment_no) {
		
		return boardDaoI.selectOneBoardComment(parent_comment_no);
	}

	@Override
	public int updateCommentGroupOrder(BoardComments bc) {
		
		return boardDaoI.updateCommentGroupOrder(bc);
	}
}
