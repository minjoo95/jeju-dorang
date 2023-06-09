package com.kosta.dorang.dto;

import java.sql.Timestamp;

public class BoardCommentsWithNickname extends BoardComments {
	
	private String user_nickname;

	public BoardCommentsWithNickname() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardCommentsWithNickname(int comment_no, long user_code, int board_id, String comment_content,
			Timestamp comment_reg_date, int parent_comment_no, int comment_group_order, int comment_depth) {
		super(comment_no, user_code, board_id, comment_content, comment_reg_date, parent_comment_no, comment_group_order,
				comment_depth);
		// TODO Auto-generated constructor stub
	}

	public BoardCommentsWithNickname(String user_nickname) {
		super();
		this.user_nickname = user_nickname;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	@Override
	public String toString() {
		return "BoardCommentsWithNickname [user_nickname=" + user_nickname + ", getComment_no()=" + getComment_no()
				+ ", getUser_code()=" + getUser_code() + ", getBoard_id()=" + getBoard_id() + ", getComment_content()="
				+ getComment_content() + ", getComment_reg_date()=" + getComment_reg_date()
				+ ", getParent_comment_no()=" + getParent_comment_no() + ", getComment_group_order()="
				+ getComment_group_order() + ", getComment_depth()=" + getComment_depth() + ", toString()="
				+ super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
	

}
