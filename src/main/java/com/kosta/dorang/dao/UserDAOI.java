package com.kosta.dorang.dao;

import java.util.HashMap;

import com.kosta.dorang.dto.User;

public interface UserDAOI {
	public User selectUser(Long user_code) throws Exception;
	public void insertUser(HashMap<String, Object> userInfo) throws Exception;
	public void updateUserProfileInfo(HashMap<String, Object> userInfo) throws Exception;
	
	public void updateUserPic(HashMap<String, Object> userInfo) throws Exception;
	public void updateUserAge(HashMap<String, Object> userInfo) throws Exception;
	public void updateUserGender(HashMap<String, Object> userInfo) throws Exception;
	
	public void updateUserProfile(User user) throws Exception;
	public void deleteNicknameLocal(HashMap<String, Object> userInfo) throws Exception;
	
	public void deletePicLocal(HashMap<String, Object> userInfo) throws Exception;
}