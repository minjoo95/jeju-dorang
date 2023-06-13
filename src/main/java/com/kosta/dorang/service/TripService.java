package com.kosta.dorang.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.dorang.dao.TripDAO;
import com.kosta.dorang.dto.Bookmark;
import com.kosta.dorang.dto.Trip;
import com.kosta.dorang.dto.TripCriteria;

@Service
public class TripService implements TripServiceI {
	
	@Autowired
	TripDAO dao;

	@Override
	public List<Map<String, Trip>> getPlaceList(TripCriteria cri) throws Exception {
		return dao.getPlaceList(cri);
	}

	@Override
	public Trip getPlace(Integer trip_id) throws Exception {
		return dao.getPlace(trip_id);
	}

	@Override
	public List<Map<String, Trip>> getPlaceListByTheme(TripCriteria cri) throws Exception {
		return dao.getPlaceListByTheme(cri);
	}
	
	
	@Override
	public List<Map<String, Trip>> getPlaceListBySearch(TripCriteria cri) throws Exception {
		return dao.getPlaceListBySearch(cri);
	}

	@Override
	public Integer isMyBookmark(Bookmark bookmark) throws Exception {
		return dao.isMyBookmark(bookmark); //0 or 1
	}

	@Override
	public Boolean setBookmark(Bookmark bookmark) throws Exception {
		return dao.setBookmark(bookmark); 
	}

	@Override
	public Boolean cancelBookmark(Bookmark bookmark) throws Exception {
		return dao.cancelBookmark(bookmark);
	}

	@Override
	public Integer countTotalItem() throws Exception {
		return dao.countTotalItem();
	}

	@Override
	public Integer countTotalItemByTheme(String category) throws Exception {
		return dao.countTotalItemByTheme(category);
	}

	@Override
	public Integer countTotalSearchItem(String keyword) throws Exception {
		return dao.countTotalSearchItem(keyword);
	}

	

	
	

}
