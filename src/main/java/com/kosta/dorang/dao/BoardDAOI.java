package com.kosta.dorang.dao;

import java.util.List;

import com.kosta.dorang.dto.Board;

public interface BoardDAOI {

	List<Board> selectBoardList();

	int insertBoard(Board board);

	Board selectOneBoard(int no);

	int updateBoard(Board board);

	int deleteBoard(int no);

}
