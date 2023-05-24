package com.kosta.dorang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.dorang.dao.MainDAOI;
import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.Trip;

@Service
public class MainService implements MainServiceI {

	@Autowired
	private MainDAOI mainDaoI;
	@Override
	public List<Trip> selectBestTripList() throws Exception {
		return mainDaoI.selectBestTripList();
	}
	@Override
	public List<Mate> selectHotMateList() throws Exception {
		return mainDaoI.selectHotMateList();
	}
	@Override
	public List<Mate> selectMyMateList(String kakao_id) throws Exception {
		return mainDaoI.selectMyMateList(kakao_id);
	}



}
