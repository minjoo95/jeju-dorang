package com.kosta.dorang.dao;

import java.util.List;

import com.kosta.dorang.dto.Bookmark;
import com.kosta.dorang.dto.Trip;

public interface TripDAOI {
	//trip table 
	public List<Trip> getPlaceList() throws Exception;		//목록 조회
	public Trip getPlace(Integer trip_id) throws Exception;	//단일 조회
	public List<Trip> getPlaceListByTheme(String category) throws Exception; //카테고리별 조회
	
	//bookmark table
	public Integer isMyBookmark(Bookmark bookmark) throws Exception; //북마크 여부 확인 : 0, 1
	public Boolean setBookmark(Bookmark bookmark) throws Exception;  //북마크 처리
	public Boolean cancelBookmark(Bookmark bookmark) throws Exception; //북마크 해제
	
}
