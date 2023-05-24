package com.kosta.dorang.dto;

import java.sql.Timestamp;

public class BoardComments {
	
	private int comment_no; //댓글번호
	private int user_id; //아이디 식별코드
	private int board_id; //글 등록 번호
	private String comment_content; //댓글 내용
	private Timestamp comment_reg_date; //작성 일자
	private int parent_comment_no; //부모(대댓글)댓글번호
	private int comment_group_order; //대댓글 순서 식별
	private int comment_depth; //대댓글 길이
	

	public BoardComments() {
	}
	
	public BoardComments(int comment_no, int user_id, int board_id, String comment_content, Timestamp comment_reg_date,
			int parent_comment_no, int comment_group_order, int comment_depth) {

		this.comment_no = comment_no;
		this.user_id = user_id;
		this.board_id = board_id;
		this.comment_content = comment_content;
		this.comment_reg_date = comment_reg_date;
		this.parent_comment_no = parent_comment_no;
		this.comment_group_order = comment_group_order;
		this.comment_depth = comment_depth;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Timestamp getComment_reg_date() {
		return comment_reg_date;
	}

	public void setComment_reg_date(Timestamp comment_reg_date) {
		this.comment_reg_date = comment_reg_date;
	}

	public int getParent_comment_no() {
		return parent_comment_no;
	}

	public void setParent_comment_no(int parent_comment_no) {
		this.parent_comment_no = parent_comment_no;
	}

	public int getComment_group_order() {
		return comment_group_order;
	}

	public void setComment_group_order(int comment_group_order) {
		this.comment_group_order = comment_group_order;
	}

	public int getComment_depth() {
		return comment_depth;
	}

	public void setComment_depth(int comment_depth) {
		this.comment_depth = comment_depth;
	}
	
	

}
