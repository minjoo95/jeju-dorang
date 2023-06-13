package com.kosta.dorang.service;

import java.util.List;
import java.util.Map;

import com.kosta.dorang.dto.Bookmark;
import com.kosta.dorang.dto.Trip;
import com.kosta.dorang.dto.TripCriteria;

public interface TripServiceI {	
	public List<Map<String, Trip>> getPlaceList(TripCriteria cri) throws Exception;	//목록 조회
	public Trip getPlace(Integer trip_id) throws Exception;	//단일 조회
	public List<Map<String, Trip>> getPlaceListByTheme(TripCriteria cri) throws Exception; //카테고리별 조회
	public List<Map<String, Trip>> getPlaceListBySearch(TripCriteria cri) throws Exception; //검색 조회 
	
	public Integer isMyBookmark(Bookmark bookmark) throws Exception; //북마크 여부 확인 : 0, 1
	public Boolean setBookmark(Bookmark bookmark) throws Exception;  //북마크 처리
	public Boolean cancelBookmark(Bookmark bookmark) throws Exception; //북마크 해제
	
	public Integer countTotalItem() throws Exception;	//전체 아이템 수 
	public Integer countTotalItemByTheme(String category) throws Exception; //카테고리 아이템 수 
	public Integer countTotalSearchItem (String keyword) throws Exception;	//검색 결과 수
}
