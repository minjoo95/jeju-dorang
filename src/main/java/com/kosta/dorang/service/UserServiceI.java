package com.kosta.dorang.service;

import java.util.Map;

import com.kosta.dorang.dto.User;
import com.kosta.dorang.dto.UserPicLocal;

public interface UserServiceI {
	String getAccess_Token(String code) throws Throwable;
	public User getUserInfo(String access_token) throws Exception;
	public void getLogout(String access_token);
	
	String getAccess_TokenAddition(String code) throws Throwable;
	public User getUserInfoAddition(String access_token) throws Exception;
	
	public User updateUserProfile(Map<String, Object> param) throws Exception;
	
}
