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
	public User selectUser(Long user_code) throws Exception {
		return sqlSession.selectOne("UserMapper.selectUser", user_code);
	}

	// 처음 로그인
	@Override
	public void insertUser(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.insert("UserMapper.insertUser", userInfo);
	}
	
	// 로그인할 때마다, 동의 항목 추가할 때 정보 업데이트
	@Override
	public void updateUserProfileInfo(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.update("UserMapper.updateUserProfileInfo", userInfo);
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
	
	
	
	// 마이페이지 수정
	@Override
	public void updateUserProfile(User user) throws Exception {
		sqlSession.update("UserMapper.updateUserProfile", user);
	}
	
	
	// DLETE
	@Override
	public void deleteNicknameLocal(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.update("UserMapper.deleteNicknameLocal", userInfo);
	}

	@Override
	public void deletePicLocal(HashMap<String, Object> userInfo) throws Exception {
		sqlSession.update("UserMapper.deletePicLocal", userInfo);
	}


	
	

	
	
}