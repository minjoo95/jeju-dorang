package com.kosta.dorang.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.dorang.dto.Trip;

@Repository
public class MainDAO implements MainDAOI {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Trip> selectBestTripList() throws Exception {
		return sqlSession.selectList("MainMapper.selectBestTripList");
	}

}
