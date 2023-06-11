package com.kosta.dorang.dto;

public class NoticeUser extends Notice{

	private String user_nickname;
	
	public NoticeUser() {
		// TODO Auto-generated constructor stub
	}

	public NoticeUser(String user_nickname) {
		super();
		this.user_nickname = user_nickname;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	
	
}
