package com.kosta.dorang.dao;

import java.util.List;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.Trip;

public interface MainDAOI {

	List<Trip> selectBestTripList() throws Exception;

	List<Mate> selectHotMateList() throws Exception;

	List<Mate> selectMyMateList(String kakao_id) throws Exception;

}
