package com.kosta.dorang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.dorang.dao.BoardDAOI;
import com.kosta.dorang.dto.Board;
import com.kosta.dorang.dto.BoardComments;
import com.kosta.dorang.dto.BoardLike;

@Service
public class BoardService implements BoardServiceI {

	@Autowired
	private BoardDAOI boardDaoI; //BoardDAOI로?

	@Override
	public List<Board> selectBoardList() {
		
		return boardDaoI.selectBoardList();
	}

	@Override
	public int insertBoard(Board board) {
		
		return boardDaoI.insertBoard(board);
	}

	@Override
	public Board selectOneBoard(int no) {
		
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

}
