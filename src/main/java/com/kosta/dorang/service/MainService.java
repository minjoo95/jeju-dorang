package com.kosta.dorang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.dorang.dao.MainDAOI;
import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateUser;
import com.kosta.dorang.dto.Notice;
import com.kosta.dorang.dto.NoticeUser;
import com.kosta.dorang.dto.Trip;
import com.kosta.dorang.dto.User;

@Service
public class MainService implements MainServiceI {

	@Autowired
	private MainDAOI mainDaoI;
	@Override
	public List<Trip> selectBestTripList() throws Exception {
		return mainDaoI.selectBestTripList();
	}
	@Override
	public List<MateUser> selectHotMateList() throws Exception {
		return mainDaoI.selectHotMateList();
	}
	@Override
	public List<MateUser> selectMyMateList(long user_code) throws Exception {
		return mainDaoI.selectMyMateList(user_code);
	}
	//알림 select
	@Override
	public List<NoticeUser> selectNoticeByUserCode(long user_code, int lastNtcCode) throws Exception {
		return mainDaoI.selectNoticeByUserCode(user_code,lastNtcCode);
	}
	@Override
	public void deleteNoticeByNtcCode(int ntc_code) throws Exception {
		mainDaoI.deleteNoticeByNtcCode(ntc_code);
		
	}
}
