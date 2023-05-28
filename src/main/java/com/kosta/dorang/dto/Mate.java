package com.kosta.dorang.dto;

import java.sql.Date;

public class Mate {
	private int mate_code;
	private long user_code;
	private String title;
	private String content;
	private String type;
	private String direction;
	private String number;
	private String age;
	private String gender;
	private String daterange;
	private String tags;
	private String first_ask;
	private String second_ask;
	private String third_ask;
	private int count;
	private String image;
	private String status;
	private int join_count;
	private Date createdAt; // 데이터베이스에도 스트링?

	public Mate() {

	}

	public Mate(long user_code, String title, String content, String type, String direction, String number, String age,
			String gender, String daterange, String tags, String status, String image, String first_ask,
			String second_ask, String third_ask, Date createdAt) {
		this.user_code = user_code;
		this.title = title;
		this.content = content;
		this.type = type;
		this.direction = direction;
		this.number = number;
		this.age = age;
		this.gender = gender;
		this.daterange = daterange;
		this.tags = tags;
		this.status = status;
		this.image = image;
		this.first_ask = first_ask;
		this.second_ask = second_ask;
		this.third_ask = third_ask;
		this.createdAt = createdAt;
	}

	public int getMate_code() {
		return mate_code;
	}

	public void setMate_code(int mate_code) {
		this.mate_code = mate_code;
	}

	public long getUser_code() {
		return user_code;
	}

	public void setUser_code(long user_code) {
		this.user_code = user_code;
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

	public String getDaterange() {
		return daterange;
	}

	public void setDaterange(String daterange) {
		this.daterange = daterange;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getFirst_ask() {
		return first_ask;
	}

	public void setFirst_ask(String first_ask) {
		this.first_ask = first_ask;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getJoin_count() {
		return join_count;
	}

	public void setJoin_count(int join_count) {
		this.join_count = join_count;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	@Override
	public String toString() {
		return "Mate [mate_code=" + mate_code + ", user_code=" + user_code + ", title=" + title + ", content=" + content
				+ ", type=" + type + ", direction=" + direction + ", number=" + number + ", age=" + age + ", gender="
				+ gender + ", daterange=" + daterange + ", tags=" + tags + ", first_ask=" + first_ask + ", second_ask="
				+ second_ask + ", third_ask=" + third_ask + ", count=" + count + ", image=" + image + ", status="
				+ status + ", join_count=" + join_count + ", createdAt=" + createdAt + "]";
	}
	
}
