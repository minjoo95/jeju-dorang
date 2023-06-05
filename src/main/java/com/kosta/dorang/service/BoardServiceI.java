package com.kosta.dorang.service;

import java.util.List;

import com.kosta.dorang.dto.Board;
import com.kosta.dorang.dto.BoardComments;
import com.kosta.dorang.dto.BoardLike;

public interface BoardServiceI {

	List<Board> selectBoardList();

	int insertBoard(Board board);

	Board selectOneBoard(int no);

	int updateBoard(Board board);

	int deleteBoard(int no);

	BoardLike selectOneBoard(BoardLike boardLike);

	int insertBoardLike(BoardLike boardLike);

	int updateBoardLike(int no);

	int insertBoardComments(BoardComments boardComments);

	List<BoardComments> selectBoardCommentsList(int no);

}
