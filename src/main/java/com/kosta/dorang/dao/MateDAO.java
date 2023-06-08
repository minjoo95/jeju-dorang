package com.kosta.dorang.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateApply;
import com.kosta.dorang.dto.MateComments;
import com.kosta.dorang.dto.MateCommentsUser;
import com.kosta.dorang.dto.MateCriteria;


@Repository
public class MateDAO implements MateDAOI {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertMate(Mate m) throws Exception {
		sqlSession.insert("MateMapper.insertMate", m);
	}
	
	@Override
	public Mate selectMate(int mate_code) throws Exception {
		return sqlSession.selectOne("MateMapper.selectMate",mate_code);
	}
	

	@Override
	public void updateMate(Mate m) {
		
		sqlSession.update("MateMapper.updateMate",m);

	}

	@Override
	public void deleteMate(int mate_code) {
		sqlSession.delete("MateMapper.deleteMate",mate_code);

	}

	@Override
	public List<Mate> getMateListViewSort(MateCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("MateMapper.getMateListViewSort",cri);
	}

	
	
	/*동행신청*/
	
	@Override
	public void insertApplyMate(MateApply mp) throws Exception {
		sqlSession.insert("MateMapper.insertApplyMate",mp);
		
	}

	@Override
	public MateApply selectApplyMate(int mate_code, Long user_code) throws Exception {
		  Map<String, Object> applyMap = new HashMap<>();
		  applyMap.put("mate_code", mate_code);
		  applyMap.put("user_code", user_code);
		  return sqlSession.selectOne("MateMapper.selectApplyMate", applyMap);
	}
  
	@Override
	public MateApply selectApplyMateByMateCode(int mate_code) throws Exception {
		 return sqlSession.selectOne("MateMapper.selectApplyMateByMateCode", mate_code);
	}
	
	
	@Override
	public void deleteApplyMate(int mate_code) throws Exception {
		sqlSession.delete("MateMapper.deleteApplyMate",mate_code);
	}
	
	
	@Override
	public int totalCount() {
		return sqlSession.selectOne("MateMapper.totalCount");
	}
	@Override
	public int totalmyCount(Long user_code, MateCriteria cri) {
		 Map<String, Object> totalmyCountMap = new HashMap<>();
		 totalmyCountMap.put("user_code", user_code);
		 totalmyCountMap.put("sortBy", cri.getSortBy());
		 return sqlSession.selectOne("MateMapper.totalmyCount",totalmyCountMap);
	}


	@Override
	public void mateCount(int mate_code) throws Exception {
		sqlSession.update("MateMapper.mateCount",mate_code);
		
	}

	@Override
	public List<Mate> getmyMateListViewSort(Long user_code, MateCriteria cri) throws Exception {
			Map<String, Object> mylist = new HashMap<>();
			mylist.put("user_code", user_code);
			mylist.put("pageStart", cri.getPageStart());
			mylist.put("perPageNum", cri.getPerPageNum());
			mylist.put("sortBy", cri.getSortBy());
			return sqlSession.selectList("MateMapper.getmyMateListViewSort",mylist);
	}

	@Override
	public List<MateComments> selectMateCommListByMateCode(int mate_code) throws Exception {
		return sqlSession.selectList("MateMapper.selectMateCommListByMateCode",mate_code);
	}
	
	@Override
	public void deleteMateCommListByMateCode(int mate_code) throws Exception {
		sqlSession.delete("MateMapper.deleteMateCommListByMateCode",mate_code);
	}
	
  //응심이 
	@Override
	public List<MateCommentsUser> selectMateReplyListByMateCode(int mate_code) throws Exception {
		return sqlSession.selectList("MateMapper.selectMateReplyListByMateCode",mate_code);
	}

	@Override
	public void insertMateReply(MateComments mateComments) {
		sqlSession.insert("MateMapper.insertMateReply",mateComments);
	}

	@Override
	public void deleteMateReply(int comment_code) throws Exception {
		sqlSession.delete("MateMapper.deleteMateReply",comment_code);
		
	}

	@Override
	public MateCommentsUser selectOneMateReply(int comment_code) throws Exception {
		return sqlSession.selectOne("MateMapper.selectOneMateReply",comment_code);
	}

	@Override
	public void updateMateReply(MateComments mateComments) throws Exception {
		sqlSession.update("MateMapper.updateMateReply",mateComments);
	}



}
