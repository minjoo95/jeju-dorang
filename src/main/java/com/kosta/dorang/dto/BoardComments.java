package com.kosta.dorang.dto;

import java.sql.Timestamp;

public class BoardComments {
	
	private int comment_no; //댓글번호
	private long user_code; //아이디 식별코드
	private int board_id; //글 등록 번호
	private String comment_content; //댓글 내용
	private Timestamp comment_reg_date; //작성 일자
	private int parent_comment_no; //부모(대댓글)댓글번호
	private int comment_depth; //대댓글 길이
	private int comment_order; //대댓글 순서 식별
	

	public BoardComments() {
	}
	
	public BoardComments(int comment_no, long user_code, int board_id, String comment_content, Timestamp comment_reg_date,
			int parent_comment_no, int comment_order, int comment_depth) {

		this.comment_no = comment_no;
		this.user_code = user_code;
		this.board_id = board_id;
		this.comment_content = comment_content;
		this.comment_reg_date = comment_reg_date;
		this.parent_comment_no = parent_comment_no;
		this.comment_order = comment_order;
		this.comment_depth = comment_depth;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public long getUser_code() {
		return user_code;
	}

	public void setUser_code(long user_code) {
		this.user_code = user_code;
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

	public int getComment_order() {
		return comment_order;
	}

	public void setComment_order(int comment_order) {
		this.comment_order = comment_order;
	}

	public int getComment_depth() {
		return comment_depth;
	}

	public void setComment_depth(int comment_depth) {
		this.comment_depth = comment_depth;
	}

	@Override
	public String toString() {
		return "BoardComments [comment_no=" + comment_no + ", user_code=" + user_code + ", board_id=" + board_id
				+ ", comment_content=" + comment_content + ", comment_reg_date=" + comment_reg_date
				+ ", parent_comment_no=" + parent_comment_no + ", comment_order=" + comment_order
				+ ", comment_depth=" + comment_depth + "]";
	}
	
	

}
