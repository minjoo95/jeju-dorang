package com.kosta.dorang.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.dorang.dto.Trip;

@Repository
public class TripDAO implements TripDAOI {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 전체 목록 가져오기
	 */
	@Override
	public List<Trip> getPlaceList() throws Exception {
		return sqlSession.selectList("TripMapper.selectPlaceList");
	}

	/**
	 * 해당 여행지 가져오기
	 */
	@Override
	public Trip getPlace(String trip_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Trip> getPlaceListByTheme(String category) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
