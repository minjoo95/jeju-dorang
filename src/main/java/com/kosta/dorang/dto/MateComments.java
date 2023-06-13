package com.kosta.dorang.dto;

import java.util.Date;

public class MateComments {
	private int comment_code;
	private int mate_code;
	private long user_code;
	private String content;
	private Date createAt;
	private Date updateAt;
	private int mate_reply_depth;
	private int mate_reply_group_code;
	
	public MateComments() {
		// TODO Auto-generated constructor stub
	}
  
	public MateComments(int comment_code, int mate_code, long user_code, String content, Date createAt,
			Date updateAt, int mate_reply_depth,int mate_reply_group_code) {

		this.comment_code = comment_code;
		this.mate_code = mate_code;
		this.user_code = user_code;
		this.content = content;
		this.createAt = createAt;
		this.updateAt = updateAt;
		this.mate_reply_depth=mate_reply_depth;
		this.mate_reply_group_code=mate_reply_group_code;

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


	public Long getUser_code() {
		return user_code;
	}

	public void setUser_code(Long user_code) {
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

	public int getMate_reply_depth() {
		return mate_reply_depth;
	}

	public void setMate_reply_depth(int mate_reply_depth) {
		this.mate_reply_depth = mate_reply_depth;
	}

	public int getMate_reply_group_code() {
		return mate_reply_group_code;
	}

	public void setMate_reply_group_code(int mate_reply_group_code) {
		this.mate_reply_group_code = mate_reply_group_code;
	}
	
}
