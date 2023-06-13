package com.kosta.dorang.dao;

import java.util.List;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateUser;
import com.kosta.dorang.dto.Notice;
import com.kosta.dorang.dto.NoticeUser;
import com.kosta.dorang.dto.Trip;

public interface MainDAOI {

	public List<Trip> selectBestTripList() throws Exception;

	public List<MateUser> selectHotMateList() throws Exception;

	public List<MateUser> selectMyMateList(long user_code) throws Exception;
	
	public List<NoticeUser> selectNoticeByUserCode(long user_code, int lastNtcCode) throws Exception; //응심이꺼

	public void deleteNoticeByNtcCode(int ntc_code) throws Exception;

}
