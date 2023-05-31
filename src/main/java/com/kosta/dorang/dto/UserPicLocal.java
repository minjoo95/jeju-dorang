package com.kosta.dorang.dto;

public class UserPicLocal {
	private Long user_code; // User랑 forign key 연결
	private String pic_name_origin;
	private String pic_name_storage;
	private Long pic_size;
	public Long getUser_code() {
		return user_code;
	}
	
	public UserPicLocal(Long user_code, String pic_name_origin, String pic_name_storage, Long pic_size) {
		super();
		this.user_code = user_code;
		this.pic_name_origin = pic_name_origin;
		this.pic_name_storage = pic_name_storage;
		this.pic_size = pic_size;
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
	public String getPic_name_storage() {
		return pic_name_storage;
	}
	public void setPic_name_storage(String pic_name_storage) {
		this.pic_name_storage = pic_name_storage;
	}
	public Long getPic_size() {
		return pic_size;
	}
	public void setPic_size(Long pic_size) {
		this.pic_size = pic_size;
	}
}
