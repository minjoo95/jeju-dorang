package com.kosta.dorang.dao;

import java.util.HashMap;

import com.kosta.dorang.dto.User;

public interface UserDAOI {
	public User selectUser(HashMap<String, Object> userInfo) throws Exception;
	
	public void insertUserAll(HashMap<String, Object> userInfo) throws Exception;
	
	public void insertUserNothing(HashMap<String, Object> userInfo) throws Exception;
	public void insertUserGender(HashMap<String, Object> userInfo) throws Exception;
	public void insertUserAge(HashMap<String, Object> userInfo) throws Exception;
	public void insertUserPic(HashMap<String, Object> userInfo) throws Exception;
	public void insertUserAgeAndGender(HashMap<String, Object> userInfo) throws Exception;
	public void insertUserPicAndAge(HashMap<String, Object> userInfo) throws Exception;
	public void insertUserPicAndGender(HashMap<String, Object> userInfo) throws Exception;
	
	public void updateUser(HashMap<String, Object> userInfo) throws Exception;
}
