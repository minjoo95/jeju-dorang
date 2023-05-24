package com.kosta.dorang.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.Trip;

@Repository
public class MainDAO implements MainDAOI {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Trip> selectBestTripList() throws Exception {
		return sqlSession.selectList("MainMapper.selectBestTripList");
	}

	@Override
	public List<Mate> selectHotMateList() throws Exception {
		return sqlSession.selectList("MainMapper.selectHotMateList");
	}

	@Override
	public List<Mate> selectMyMateList(String kakao_id) throws Exception {
		return sqlSession.selectList("MainMapper.selectMyMateList",kakao_id);
	}

}
