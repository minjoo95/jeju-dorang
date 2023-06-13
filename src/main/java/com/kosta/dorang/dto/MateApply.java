package com.kosta.dorang.dto;

import java.sql.Date;

public class MateApply {
	private int mateApply_code;
	private int mate_code; 
	private Long user_code;	
    private String frist_answer;
    private String second_answer;
    private String third_answer;
    private String result;
    private Date createdAt;
	public int getMateApply_code() {
		return mateApply_code;
	}
	public MateApply() {
		
	}
	
	public MateApply(int mate_code, Long user_code, String frist_answer, String second_answer, String third_answer, Date createdAt) {
		this.mate_code = mate_code;
		this.user_code = user_code;
		this.frist_answer = frist_answer;
		this.second_answer = second_answer;
		this.third_answer = third_answer;
		this.createdAt = createdAt;
	}
	
	public void setMateApply_code(int mateApply_code) {
		this.mateApply_code = mateApply_code;
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
	public String getFrist_answer() {
		return frist_answer;
	}
	public void setFrist_answer(String frist_answer) {
		this.frist_answer = frist_answer;
	}
	public String getSecond_answer() {
		return second_answer;
	}
	public void setSecond_answer(String second_answer) {
		this.second_answer = second_answer;
	}
	public String getThird_answer() {
		return third_answer;
	}
	public void setThird_answer(String third_answer) {
		this.third_answer = third_answer;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
    
    
    
    
}
