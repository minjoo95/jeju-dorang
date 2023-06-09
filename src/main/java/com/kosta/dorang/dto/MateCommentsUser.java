package com.kosta.dorang.dto;

public class MateCommentsUser extends MateComments{
	
	private String user_nickname;
	private String user_pic;
	
	public MateCommentsUser() {
		// TODO Auto-generated constructor stub
	}

	public MateCommentsUser(String user_nickname, String user_pic) {
		super();
		this.user_nickname = user_nickname;
		this.user_pic=user_pic;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_pic() {
		return user_pic;
	}

	public void setUser_pic(String user_pic) {
		this.user_pic = user_pic;
	}
	
	

}
