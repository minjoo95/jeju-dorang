package com.kosta.dorang.dao;

import java.util.List;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateApply;
import com.kosta.dorang.dto.MateComments;
import com.kosta.dorang.dto.MateCommentsUser;
import com.kosta.dorang.dto.MateCriteria;
import com.kosta.dorang.dto.Notice;

public interface MateDAOI {
	public void insertMate(Mate m) throws Exception; //등록
	public List<Mate> getMateListViewSort(MateCriteria cri) throws Exception;//목록
	public Mate selectMate(int mate_code)throws Exception; //조회
	public void updateMate(Mate m)throws Exception;//수정
	public void deleteMate(int mate_code)throws Exception;//삭제
	public int insertApplyMate(MateApply mp)throws Exception; //신청
	public MateApply selectApplyMate(int mate_code,Long user_code) throws Exception; 
	public List<MateCommentsUser> selectMateReplyListByMateCode(int mate_code) throws Exception; //응심이꺼
	public int insertMateReply(MateComments mateComments); //응심이꺼
	public int totalCount();
	public void mateCount(int mate_code) throws Exception;
	List<Mate> getmyMateWriteList(Long user_code,MateCriteria cri) throws Exception;
	public void deleteMateReply(int comment_code) throws Exception; //응심이거
	public MateCommentsUser selectOneMateReply(int comment_code) throws Exception; //응심이꺼
	public void updateMateReply(MateComments mateComments) throws Exception; //응심이꺼
	public void insertMateReplyNotice(long mateWriter,String noticeContent, int comment_code) throws Exception; //응심이꺼
	public void insertMateApplyNotice(long mate_writer, String mateApplyContent, int mate_Application_code) throws Exception;

}
