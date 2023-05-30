package com.kosta.dorang.dto;

public class UserPicLocal {
	private Long user_code; // User랑 forign key 연결
	private String uploadPath; // 실제 파일이 업로드된 경로
	private String fileName; // 파일 이름
}
