package com.kosta.dorang.dao;

import java.util.List;

import com.kosta.dorang.dto.Trip;

public interface MainDAOI {

	List<Trip> selectBestTripList() throws Exception;

}
