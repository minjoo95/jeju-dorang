package com.kosta.dorang.dto;

import java.util.Date;

public class Notice {
	
	private int ntc_code;
	private long user_code;
	private int ntc_cat;
	private Date ntc_date;
	private String ntc_content;
	private int mate_application_code;
	private String mateApply_result;
	private int comment_no;  //후기 댓글
	private int comment_code;  //동행 댓글
	private boolean is_deleted; //default 0
	private boolean is_confirm;  //default 0
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int ntc_code, long user_code, int ntc_cat, Date ntc_date, String ntc_content,
			int mate_application_code, String mateApply_result, int comment_no, int comment_code, boolean is_deleted,
			boolean is_confirm) {
		this.ntc_code = ntc_code;
		this.user_code = user_code;
		this.ntc_cat = ntc_cat;
		this.ntc_date = ntc_date;
		this.ntc_content = ntc_content;
		this.mate_application_code = mate_application_code;
		this.mateApply_result = mateApply_result;
		this.comment_no = comment_no;
		this.comment_code = comment_code;
		this.is_deleted = is_deleted;
		this.is_confirm = is_confirm;
	}

	public int getNtc_code() {
		return ntc_code;
	}

	public void setNtc_code(int ntc_code) {
		this.ntc_code = ntc_code;
	}

	public long getUser_code() {
		return user_code;
	}

	public void setUser_code(long user_code) {
		this.user_code = user_code;
	}

	public int getNtc_cat() {
		return ntc_cat;
	}

	public void setNtc_cat(int ntc_cat) {
		this.ntc_cat = ntc_cat;
	}

	public Date getNtc_date() {
		return ntc_date;
	}

	public void setNtc_date(Date ntc_date) {
		this.ntc_date = ntc_date;
	}

	public String getNtc_content() {
		return ntc_content;
	}

	public void setNtc_content(String ntc_content) {
		this.ntc_content = ntc_content;
	}

	public int getMate_application_code() {
		return mate_application_code;
	}

	public void setMate_application_code(int mate_application_code) {
		this.mate_application_code = mate_application_code;
	}

	public String getMateApply_result() {
		return mateApply_result;
	}

	public void setMateApply_result(String mateApply_result) {
		this.mateApply_result = mateApply_result;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getComment_code() {
		return comment_code;
	}

	public void setComment_code(int comment_code) {
		this.comment_code = comment_code;
	}

	public boolean isIs_deleted() {
		return is_deleted;
	}

	public void setIs_deleted(boolean is_deleted) {
		this.is_deleted = is_deleted;
	}

	public boolean isIs_confirm() {
		return is_confirm;
	}

	public void setIs_confirm(boolean is_confirm) {
		this.is_confirm = is_confirm;
	}
	
	
}
