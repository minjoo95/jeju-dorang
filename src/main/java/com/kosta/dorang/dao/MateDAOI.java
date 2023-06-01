package com.kosta.dorang.dao;

import java.util.List;

import com.kosta.dorang.dto.Mate;

public interface MateDAOI {
	public void insertMate(Mate m) throws Exception; //등록
	public List<Mate> getMateListViewSort() throws Exception;//목록
	public Mate selectMate(int mate_code)throws Exception; //조회
	
	
	public void upateMate(Mate m)throws Exception;//수정
	public void deleteMate(Mate m)throws Exception;//삭제
	
	//public void mateApply(MateApply mp)throws Exception; //신청
	
	
	
}
