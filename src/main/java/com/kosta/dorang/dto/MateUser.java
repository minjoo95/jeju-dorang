package com.kosta.dorang.dto;

public class MateUser extends Mate{
	
	private String user_nickname;
	
	public MateUser() {
		// TODO Auto-generated constructor stub
	}

	public MateUser(String user_nickname) {
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
