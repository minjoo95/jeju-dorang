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
}
