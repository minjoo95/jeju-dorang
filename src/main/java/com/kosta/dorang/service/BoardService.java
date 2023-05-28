package com.kosta.dorang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.dorang.dao.BoardDAOI;
import com.kosta.dorang.dto.Board;

@Service
public class BoardService implements BoardServiceI {

	@Autowired
	private BoardDAOI boardDaoI; //BoardDAOI로?

	@Override
	public List<Board> selectBoardList() {
		
		return boardDaoI.selectBoardList();
	}

}
