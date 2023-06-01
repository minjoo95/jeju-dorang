package com.kosta.dorang.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.dorang.dto.Board;

@Repository
public class BoardDAO implements BoardDAOI {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Board> selectBoardList() {
		return sqlSession.selectList("BoardMapper.selectBoardList");
	}

	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("BoardMapper.insertBoard", board);
	}

	@Override
	public Board selectOneBoard(int no) {
		return sqlSession.selectOne("BoardMapper.selectOneBoard", no);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.update("BoardMapper.updateBoard", board);
	}

	@Override
	public int deleteBoard(int no) {
		return sqlSession.delete("BoardMapper.deleteBoard", no);
	}
	
	
}
