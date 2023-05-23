package com.kosta.dorang.service;

import java.util.List;

import com.kosta.dorang.dto.Trip;

public interface TripServiceI {
	public List<Trip> getPlaceList() throws Exception;		//목록 조회
	public Trip getPlace(String trip_id) throws Exception;	//단일 조회
	public List<Trip> getPlaceListByTheme(String category) throws Exception; //카테고리별 조회
}
