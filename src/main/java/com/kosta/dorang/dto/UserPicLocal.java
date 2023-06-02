package com.kosta.dorang.dto;

public class UserPicLocal {
	private Long user_code; // User랑 forign key 연결
	private String pic_name_origin;
	private String pic_fullPath;

	public UserPicLocal() {}
	public UserPicLocal(Long user_code, String pic_name_origin, String pic_fullPath) {
		super();
		this.user_code = user_code;
		this.pic_name_origin = pic_name_origin;
		this.pic_fullPath = pic_fullPath;
	}
	
	public Long getUser_code() {
		return user_code;
	}
	public void setUser_code(Long user_code) {
		this.user_code = user_code;
	}
	public String getPic_name_origin() {
		return pic_name_origin;
	}
	public void setPic_name_origin(String pic_name_origin) {
		this.pic_name_origin = pic_name_origin;
	}
	public String getPic_fullPath() {
		return pic_fullPath;
	}
	public void setPic_fullPath(String pic_fullPath) {
		this.pic_fullPath = pic_fullPath;
	}

	
}