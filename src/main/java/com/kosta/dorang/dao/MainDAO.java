package com.kosta.dorang.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateUser;
import com.kosta.dorang.dto.Notice;
import com.kosta.dorang.dto.NoticeUser;
import com.kosta.dorang.dto.Trip;

@Repository
public class MainDAO implements MainDAOI {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Trip> selectBestTripList() throws Exception {
		return sqlSession.selectList("MainMapper.selectBestTripList");
	}

	@Override
	public List<MateUser> selectHotMateList() throws Exception {
		return sqlSession.selectList("MainMapper.selectHotMateList");
	}

	@Override
	public List<MateUser> selectMyMateList(long user_code) throws Exception {
		return sqlSession.selectList("MainMapper.selectMyMateList",user_code);
	}
	
	@Override
	public List<NoticeUser> selectNoticeByUserCode(long user_code, int lastNtcCode) throws Exception {
		Map<String, Object> noticeList = new HashMap<>();
		noticeList.put("user_code", user_code);
		noticeList.put("lastNtcCode", lastNtcCode);
		return sqlSession.selectList("MainMapper.selectNoticeByUserCode", noticeList);
	}

	@Override
	public void deleteNoticeByNtcCode(int ntc_code) throws Exception {
		sqlSession.update("MainMapper.deleteNoticeByNtcCode", ntc_code);
		
	}
}
