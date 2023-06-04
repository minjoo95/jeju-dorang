package com.kosta.dorang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.dorang.dao.MateDAO;
import com.kosta.dorang.dao.MateDAOI;
import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateApply;
import com.kosta.dorang.dto.MateComments;
import com.kosta.dorang.dto.MateCriteria;

@Service
public class MateService implements MateServiceI {
	
	@Autowired
	private MateDAOI mateDaoI;

	@Autowired
	private MateDAO mateDAO;
	
	@Override
	public void insertMate(Mate m) throws Exception {
		mateDAO.insertMate(m);
	}

	@Override
	public List<Mate> getMateListViewSort(MateCriteria cri) throws Exception {
		return mateDAO.getMateListViewSort(cri);
	
	}
	
	@Override
	public Mate selectMate(int mate_code) throws Exception {
		
		return mateDAO.selectMate(mate_code);
	}

	@Override
	public void updateMate(Mate m) throws Exception {
		 mateDAO.updateMate(m);
		
	}

	@Override
	public void deleteMate(int mate_code) throws Exception {
		mateDAO.deleteMate(mate_code);
	}

	@Override
	public void insertMateApply(MateApply mp) throws Exception {
		mateDAO.insertApplyMate(mp);
		
	}

	@Override
	public MateApply selectMateApply(int mate_code, Long user_code) throws Exception {
		return mateDAO.selectApplyMate(mate_code, user_code);
	}
  
	@Override
	public int totalCount() throws Exception {
		return mateDAO.totalCount();
	}

	@Override
	public void mateCount(int mate_code) throws Exception {
		 mateDAO.mateCount(mate_code);
	}
	
	@Override
	public List<Mate> getmyMateWriteList(Long user_code,MateCriteria cri) throws Exception {
		return mateDAO.getmyMateWriteList(user_code,cri);
	}

  //응심이 댓글
  @Override
	public List<MateComments> selectMateReplyListByMateCode(int mate_code) throws Exception {
		return mateDaoI.selectMateReplyListByMateCode(mate_code);
	}

	@Override
	public void insertMateReply(MateComments mateComments) {
		mateDaoI.insertMateReply(mateComments);
		
	}
	
}
