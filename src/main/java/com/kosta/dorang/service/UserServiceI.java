package com.kosta.dorang.service;

import com.kosta.dorang.dto.User;

public interface UserServiceI {
	String getAccess_Token(String code) throws Throwable;
	public User getUserInfo(String access_token) throws Exception;
	public void getLogout(String access_token);
}
