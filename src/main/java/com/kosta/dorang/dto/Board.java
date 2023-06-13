 package com.kosta.dorang.dto;

import java.sql.Timestamp;

public class Board {
	
	private int board_id; //글 등록 번호
	private long user_code; //아이디 식별코드
	private String board_category; //분류
	private String board_title; //제목
	private String board_content; //내용(글+그림)
	private Timestamp board_reg_date; //작성일자
	private int board_like; //추천수
	
	
	public Board() {
	}

	public Board(int board_id, long user_code, String board_category, String board_title, String board_content,
			Timestamp board_reg_date, int board_like) {
		super();
		this.board_id = board_id;
		this.user_code = user_code;
		this.board_category = board_category;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_reg_date = board_reg_date;
		this.board_like = board_like;
	}
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public long getUser_code() {
		return user_code;
	}
	public void setUser_code(long user_code) {
		this.user_code = user_code;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Timestamp getBoard_reg_date() {
		return board_reg_date;
	}
	public void setBoard_reg_date(Timestamp board_reg_date) {
		this.board_reg_date = board_reg_date;
	}
	public int getBoard_like() {
		return board_like;
	}
	public void setBoard_like(int board_like) {
		this.board_like = board_like;
	}

	@Override
	public String toString() {
		return "Board [board_id=" + board_id + ", user_code=" + user_code + ", board_category=" + board_category
				+ ", board_title=" + board_title + ", board_content=" + board_content + ", board_reg_date="
				+ board_reg_date + ", board_like=" + board_like + "]";
	}
	
	

}
