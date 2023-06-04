package com.kosta.dorang.dto;

import org.springframework.stereotype.Repository;

@Repository
public class User {
	// 필수값(not null)
	private Long user_code;
	private String user_id;
	private String user_nickname_kakao;
	
	// 최종 닉네임, 최종 프사
	private String user_pic;
	private String user_nickname;
	
	// 추가선택동의(null)
	private String user_pic_kakao;
	private String user_age_range;
	private String user_gender;
	
	// 로컬 추가 (닉네임은 로컬이 우선) (null)
	private String user_nickname_local;
	private String user_tag;
	
	// 로컬 프사 추가 (로컬이 우선) (null)
	private String user_pic_local;

	public User() {}
	public User(Long user_code, String user_id, String user_nickname_kakao, String user_pic, String user_nickname,
			String user_pic_kakao, String user_age_range, String user_gender, 
			String user_nickname_local, String user_tag, String user_pic_local) {
		super();
		this.user_code = user_code;
		this.user_id = user_id;
		this.user_nickname_kakao = user_nickname_kakao;
		this.user_pic = user_pic;
		this.user_nickname = user_nickname;
		this.user_pic_kakao = user_pic_kakao;
		this.user_age_range = user_age_range;
		this.user_gender = user_gender;
		this.user_nickname_local = user_nickname_local;
		this.user_tag = user_tag;
		this.user_pic_local = user_pic_local;
	}
	
	//처음 로그인, 동의항목 수정, 로그인할 때 업데이트
	public User(Long user_code, String user_id, String user_nickname_kakao, String user_pic, String user_nickname,
			String user_pic_kakao, String user_age_range, String user_gender) {
		super();
		this.user_code = user_code;
		this.user_id = user_id;
		this.user_nickname_kakao = user_nickname_kakao;
		this.user_pic = user_pic;
		this.user_nickname = user_nickname;
		this.user_pic_kakao = user_pic_kakao;
		this.user_age_range = user_age_range;
		this.user_gender = user_gender;
	}
	
	// 마이페이지 수정
	public User(Long user_code, String user_pic, String user_nickname, String user_nickname_local, 
			String user_tag, String user_pic_local) {
		super();
		this.user_code = user_code;
		this.user_pic = user_pic;
		this.user_nickname = user_nickname;
		this.user_nickname_local = user_nickname_local;
		this.user_tag = user_tag;
		this.user_pic_local = user_pic_local;
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
	public String getUser_nickname_kakao() {
		return user_nickname_kakao;
	}
	public void setUser_nickname_kakao(String user_nickname_kakao) {
		this.user_nickname_kakao = user_nickname_kakao;
	}
	public String getUser_pic() {
		return user_pic;
	}
	public void setUser_pic(String user_pic) {
		this.user_pic = user_pic;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_pic_kakao() {
		return user_pic_kakao;
	}
	public void setUser_pic_kakao(String user_pic_kakao) {
		this.user_pic_kakao = user_pic_kakao;
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
	public String getUser_nickname_local() {
		return user_nickname_local;
	}
	public void setUser_nickname_local(String user_nickname_local) {
		this.user_nickname_local = user_nickname_local;
	}
	public String getUser_tag() {
		return user_tag;
	}
	public void setUser_tag(String user_tag) {
		this.user_tag = user_tag;
	}
	public String getUser_pic_local() {
		return user_pic_local;
	}
	public void setUser_pic_local(String user_pic_local) {
		this.user_pic_local = user_pic_local;
	}

	
}