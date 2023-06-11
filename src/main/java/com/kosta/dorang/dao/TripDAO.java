package com.kosta.dorang.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.dorang.dto.Bookmark;
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
	public Trip getPlace(Integer trip_id) throws Exception {
		return sqlSession.selectOne("TripMapper.selectPlace", trip_id);
	}

	@Override
	public List<Trip> getPlaceListByTheme(String category) throws Exception {
		return sqlSession.selectList("TripMapper.selectPlaceListByTheme", category);
	}

	@Override
	public Integer isMyBookmark(Bookmark bookmark) throws Exception {
		Integer result = sqlSession.selectOne("TripMapper.selectIsBookmark", bookmark);
		System.out.println(">>>>> 북마크 수" + result);
		return result;
	}

	@Override
	public Boolean setBookmark(Bookmark bookmark) throws Exception {
		/*
		 * Integer trip_id = bookmark.getTrip_id(); Boolean isBookmark = false;
		 * 
		 * if (bookmarkCount == 0) { //북마크 아님 = 북마크 처리 후 업데이트 쿼리
		 * sqlSession.insert("TripMapper.insertBookmark", bookmark);
		 * sqlSession.update("TripMapper.updateBookmark", trip_id); isBookmark = true;
		 * System.out.println(">>>>> 북마크 완료 : " + trip_id); } else { //이미 북마크 = 북마크 삭제 후
		 * 업데이트 쿼리 sqlSession.delete("TripMapper.deleteBookmark", bookmark);
		 * sqlSession.update("TripMapper.updateBookmark", trip_id); isBookmark = false;
		 * System.out.println(">>>>> 북마크 해체 : " + trip_id); }
		 */
		
		
		//북마크 아님 = 북마크 처리 후 업데이트 쿼리
		Integer trip_id = bookmark.getTrip_id();
		sqlSession.insert("TripMapper.insertBookmark", bookmark);
		sqlSession.update("TripMapper.updateBookmark", trip_id); 
		System.out.println(">>>>> 북마크 완료 : " + trip_id);
		return true;
	}

	@Override
	public Boolean cancelBookmark(Bookmark bookmark) throws Exception {
		//이미 북마크 = 북마크 삭제 후 업데이트 쿼리 
		Integer trip_id = bookmark.getTrip_id();
		sqlSession.delete("TripMapper.deleteBookmark", bookmark);
		sqlSession.update("TripMapper.updateBookmark", trip_id);
		System.out.println(">>>>> 북마크 해체 : " + trip_id); 
		return false;
	}
	
	
	
	


	
	

}
