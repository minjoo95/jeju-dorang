package com.kosta.dorang.dto;

public class BoardLike {

	private int board_id;
	private int user_id;
	
	public BoardLike() {
	}
	
	public BoardLike(int board_id, int user_id) {
		this.board_id = board_id;
		this.user_id = user_id;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "BoardLike [board_id=" + board_id + ", user_id=" + user_id + "]";
	}
	
	
}
