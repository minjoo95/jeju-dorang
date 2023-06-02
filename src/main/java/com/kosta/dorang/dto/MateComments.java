package com.kosta.dorang.dto;

import java.util.Date;

public class MateComments {
	private int comment_code;
	private int mate_code;
	private String user_code;
	private String content;
	private Date createAt;
	private Date updateAt;
	
	public MateComments() {
		// TODO Auto-generated constructor stub
	}

	public MateComments(int comment_code, int mate_code, String user_code, String content, Date createAt,
			Date updateAt) {
		this.comment_code = comment_code;
		this.mate_code = mate_code;
		this.user_code = user_code;
		this.content = content;
		this.createAt = createAt;
		this.updateAt = updateAt;
	}

	public int getComment_code() {
		return comment_code;
	}

	public void setComment_code(int comment_code) {
		this.comment_code = comment_code;
	}

	public int getMate_code() {
		return mate_code;
	}

	public void setMate_code(int mate_code) {
		this.mate_code = mate_code;
	}

	public String getUser_code() {
		return user_code;
	}

	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public Date getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(Date updateAt) {
		this.updateAt = updateAt;
	}
	
	
	
}
