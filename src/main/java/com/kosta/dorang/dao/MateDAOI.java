package com.kosta.dorang.dao;

import java.util.List;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateApply;

public interface MateDAOI {
	public void insertMate(Mate m) throws Exception; //등록
	public List<Mate> getMateListViewSort() throws Exception;//목록
	public Mate selectMate(int mate_code)throws Exception; //조회
	public void updateMate(Mate m)throws Exception;//수정
	public void deleteMate(int mate_code)throws Exception;//삭제
	
	public void insertApplyMate(MateApply mp)throws Exception; //신청
	public MateApply selectApplyMate(int mate_code,Long user_code) throws Exception;
	
	
}
