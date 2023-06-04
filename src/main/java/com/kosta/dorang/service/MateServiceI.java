package com.kosta.dorang.service;

import java.util.List;

import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateApply;

public interface MateServiceI {
   public void insertMate(Mate m) throws Exception; 
   public List<Mate> getMateListViewSort() throws Exception;
   public Mate selectMate(int mate_code) throws Exception; 
   public void updateMate(Mate m )throws Exception;
   public void deleteMate(int mate_code)throws Exception;
   public void insertMateApply(MateApply mp) throws Exception;
   public MateApply selectMateApply(int mate_code,Long user_code) throws Exception;
}
