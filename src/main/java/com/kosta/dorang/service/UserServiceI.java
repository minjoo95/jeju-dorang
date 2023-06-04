package com.kosta.dorang.service;

import java.util.HashMap;
import java.util.Map;

import com.kosta.dorang.dto.User;

public interface UserServiceI {
	String getAccess_Token(String code) throws Throwable;
	String getAccess_TokenRe(String code) throws Throwable;
	public User getUserInfo(String access_token) throws Exception;
	public void getLogout(String access_token);
	
	public User updateUserLocalProfile(User user) throws Exception;
	public void deleteNicknameLocal(HashMap<String, Object> userInfo) throws Exception;
	
}