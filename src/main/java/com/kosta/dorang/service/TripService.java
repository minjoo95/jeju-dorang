package com.kosta.dorang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.dorang.dao.TripDAO;
import com.kosta.dorang.dto.Bookmark;
import com.kosta.dorang.dto.Trip;

@Service
public class TripService implements TripServiceI {
	
	@Autowired
	TripDAO dao;

	@Override
	public List<Trip> getPlaceList() throws Exception {
		return dao.getPlaceList();
	}

	@Override
	public Trip getPlace(Integer trip_id) throws Exception {
		return dao.getPlace(trip_id);
	}

	@Override
	public List<Trip> getPlaceListByTheme(String category) throws Exception {
		return dao.getPlaceListByTheme(category);
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


	
	

}
