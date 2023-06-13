package com.kosta.dorang.dto;

public class Bookmark {
	private Long user_code;
	private Integer trip_id;
	
	public Bookmark() {
	}

	public Bookmark(Long user_code, Integer trip_id) {
		this.user_code = user_code;
		this.trip_id = trip_id;
	}

	public Long getUser_code() {
		return user_code;
	}

	public Integer getTrip_id() {
		return trip_id;
	}
	
}
