package com.kosta.dorang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.dorang.dao.MainDAOI;
import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateUser;
import com.kosta.dorang.dto.Trip;
import com.kosta.dorang.dto.User;

@Service
public class MainService implements MainServiceI {

	@Autowired
	private MainDAOI mainDaoI;
	@Override
	public List<Trip> selectBestTripList() throws Exception {
		return mainDaoI.selectBestTripList();
	}
	@Override
	public List<MateUser> selectHotMateList() throws Exception {
		return mainDaoI.selectHotMateList();
	}
	@Override
	public List<MateUser> selectMyMateList(long user_code) throws Exception {
		return mainDaoI.selectMyMateList(user_code);
	}
}
