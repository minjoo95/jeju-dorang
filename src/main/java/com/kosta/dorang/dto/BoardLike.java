package com.kosta.dorang.dto;

public class BoardLike {

	private int board_id;
	private long user_code;
	
	public BoardLike() {
	}
	
	public BoardLike(int board_id, long user_code) {
		this.board_id = board_id;
		this.user_code = user_code;
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

	@Override
	public String toString() {
		return "BoardLike [board_id=" + board_id + ", user_code=" + user_code + "]";
	}
	
	
}
