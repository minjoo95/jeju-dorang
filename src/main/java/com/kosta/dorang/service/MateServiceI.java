package com.kosta.dorang.service;

import java.util.List;

import com.kosta.dorang.dto.Mate;

public interface MateServiceI {
   public void insertMate(Mate m) throws Exception; 
   public List<Mate> getMateListViewSort() throws Exception;
  public Mate selectMate(int mate_code) throws Exception; 
   
}
