package com.kosta.dorang.dao;

import java.util.List;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateUser;
import com.kosta.dorang.dto.Trip;

public interface MainDAOI {

	List<Trip> selectBestTripList() throws Exception;

	List<MateUser> selectHotMateList() throws Exception;

	List<MateUser> selectMyMateList(long user_code) throws Exception;
}
