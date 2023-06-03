package com.kosta.dorang.dto;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class User {
	private Long user_code;
	private String user_id;
	private String user_nickname;
	private String user_nickname_local;
	private String user_pic;
	private String user_age_range;
	private String user_gender;
	private String user_tag;
	private MultipartFile user_pic_local;
	private String user_pic_local_changed_name;
	
	public User() {}	
	public User(Long user_code, String user_id, String user_nickname, String user_nickname_local, String user_pic,
			String user_age_range, String user_gender, String user_tag, MultipartFile user_pic_local,
			String user_pic_local_changed_name) {
		super();
		this.user_code = user_code;
		this.user_id = user_id;
		this.user_nickname = user_nickname;
		this.user_nickname_local = user_nickname_local;
		this.user_pic = user_pic;
		this.user_age_range = user_age_range;
		this.user_gender = user_gender;
		this.user_tag = user_tag;
		this.user_pic_local = user_pic_local;
		this.user_pic_local_changed_name = user_pic_local_changed_name;
	}
	
	public User(Long user_code, String user_id, String user_nickname, String user_pic, String user_gender) {
		super();
		this.user_code = user_code;
		this.user_id = user_id;
		this.user_nickname = user_nickname;
		this.user_pic = user_pic;
		this.user_gender = user_gender;
	}
	
	public Long getUser_code() {
		return user_code;
	}
	public void setUser_code(Long user_code) {
		this.user_code = user_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_nickname_local() {
		return user_nickname_local;
	}
	public void setUser_nickname_local(String user_nickname_local) {
		this.user_nickname_local = user_nickname_local;
	}
	public String getUser_pic() {
		return user_pic;
	}
	public void setUser_pic(String user_pic) {
		this.user_pic = user_pic;
	}
	public String getUser_age_range() {
		return user_age_range;
	}
	public void setUser_age_range(String user_age_range) {
		this.user_age_range = user_age_range;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_tag() {
		return user_tag;
	}
	public void setUser_tag(String user_tag) {
		this.user_tag = user_tag;
	}
	public MultipartFile getUser_pic_local() {
		return user_pic_local;
	}
	public void setUser_pic_local(MultipartFile user_pic_local) {
		this.user_pic_local = user_pic_local;
	}
	public String getUser_pic_local_changed_name() {
		return user_pic_local_changed_name;
	}
	public void setUser_pic_local_changed_name(String user_pic_local_changed_name) {
		this.user_pic_local_changed_name = user_pic_local_changed_name;
	}
	
}