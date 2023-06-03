package com.kosta.dorang.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.dorang.dto.User;

@Repository
public class UserDAO implements UserDAOI {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	@Autowired
	public UserDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertUserAll(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.insert("UserMapper.insertUserAll", userInfo);
	}

	@Override
	public User selectUser(HashMap<String, Object> userInfo) throws Exception {
		return sqlSession.selectOne("UserMapper.selectUser", userInfo.get("user_code"));
	}

	// INSERT	
	@Override
	public void insertUserNothing(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.insert("UserMapper.insertUserNothing", userInfo);		
	}

	@Override
	public void insertUserGender(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.insert("UserMapper.insertUserGender", userInfo);		
	}

	@Override
	public void insertUserAge(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.insert("UserMapper.insertUserAge", userInfo);			
	}

	@Override
	public void insertUserPic(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.insert("UserMapper.insertUserPic", userInfo);			
	}

	@Override
	public void insertUserAgeAndGender(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.insert("UserMapper.insertUserAgeAndGender", userInfo);			
	}

	@Override
	public void insertUserPicAndAge(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.insert("UserMapper.insertUserPicAndAge", userInfo);			
	}

	@Override
	public void insertUserPicAndGender(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.insert("UserMapper.insertUserPicAndGender", userInfo);			
	}

	
	// UPDATE
	@Override
	public void updateUserPic(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.update("UserMapper.updateUserPic", userInfo);
	}

	@Override
	public void updateUserAge(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.update("UserMapper.updateUserAge", userInfo);
	}

	@Override
	public void updateUserGender(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.update("UserMapper.updateUserGender", userInfo);
	}

	
	
	// DLETE
	@Override
	public void deleteUserPicLocal(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.update("UserMapper.deleteUserPicLocal", userInfo);
	}

	
	
}