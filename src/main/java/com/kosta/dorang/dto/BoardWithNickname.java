package com.kosta.dorang.dto;

import java.sql.Timestamp;

public class BoardWithNickname extends Board {
	
	private String user_nickname;

	public BoardWithNickname() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardWithNickname(int board_id, long user_code, String board_category, String board_title,
			String board_content, Timestamp board_reg_date, int board_like) {
		super(board_id, user_code, board_category, board_title, board_content, board_reg_date, board_like);
		// TODO Auto-generated constructor stub
	}

	public BoardWithNickname(String user_nickname) {
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
		return "BoardWithNickname [user_nickname=" + user_nickname + "]";
	}
	
}
