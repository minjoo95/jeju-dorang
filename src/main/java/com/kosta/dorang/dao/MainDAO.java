package com.kosta.dorang.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateUser;
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
	public List<MateUser> selectHotMateList() throws Exception {
		return sqlSession.selectList("MainMapper.selectHotMateList");
	}

	@Override
	public List<MateUser> selectMyMateList(long user_code) throws Exception {
		return sqlSession.selectList("MainMapper.selectMyMateList",user_code);
	}
}
