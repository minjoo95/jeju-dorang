package com.kosta.dorang.dto;

import java.sql.Date;

public class Mate {
     private int mate_code;
     private int user_code;
     private String kakao_id;
     private String title;
     private String content;
     private String type;
     private String direction;
     private String number;
     private String age;
     private String gender;
     private String tags;
     private String daterange; 
     private String frist_ask; 
     private String second_ask; 
     private String third_ask; 
     private String createdAt; //데이터베이스에도 스트링?
     private int count;
     private String status;
     private String image;
     private int join_count;
     
	public Mate() {
	
	}
	public int getMate_code() {
		return mate_code;
	}
	public void setMate_code(int mate_code) {
		this.mate_code = mate_code;
	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public String getKakao_id() {
		return kakao_id;
	}
	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getDaterange() {
		return daterange;
	}
	public void setDaterange(String daterange) {
		this.daterange = daterange;
	}
	public String getFrist_ask() {
		return frist_ask;
	}
	public void setFrist_ask(String frist_ask) {
		this.frist_ask = frist_ask;
	}
	public String getSecond_ask() {
		return second_ask;
	}
	public void setSecond_ask(String second_ask) {
		this.second_ask = second_ask;
	}
	public String getThird_ask() {
		return third_ask;
	}
	public void setThird_ask(String third_ask) {
		this.third_ask = third_ask;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getJoin_count() {
		return join_count;
	}
	public void setJoin_count(int join_count) {
		this.join_count = join_count;
	}
	
	
	
     
     
}
