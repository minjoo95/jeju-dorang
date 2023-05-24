package com.kosta.dorang.dto;

public class Bookmark {
	private Integer user_code;
	private Integer trip_id;
	
	public Bookmark() {
	}

	public Bookmark(Integer user_code, Integer trip_id) {
		this.user_code = user_code;
		this.trip_id = trip_id;
	}

	public Integer getUser_code() {
		return user_code;
	}

	public Integer getTrip_id() {
		return trip_id;
	}
	
}
