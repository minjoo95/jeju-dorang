package com.kosta.dorang.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kosta.dorang.dto.Mate;

@Repository
public class MateDAO implements MateDAOI {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public void insertMate(Mate m) throws Exception {
		 sqlSession.insert("MateMapper.insertMate",m);
	}

	@Override
	public Mate detailMate(int mate_code) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void upateMate(Mate m) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMate(Mate m) {
		// TODO Auto-generated method stub
		
	}
  
}
