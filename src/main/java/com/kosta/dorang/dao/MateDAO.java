package com.kosta.dorang.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kosta.dorang.dto.Mate;
import com.kosta.dorang.dto.MateApply;
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
	public int totalCount() {
		return sqlSession.selectOne("MateMapper.totalCount");
	}

	@Override
	public void mateCount(int mate_code) throws Exception {
		sqlSession.update("MateMapper.mateCount",mate_code);
		
	}

	@Override
	public List<Mate> getmyMateWriteList(Long user_code, MateCriteria cri) throws Exception {
			Map<String, Object> mylist = new HashMap<>();
			mylist.put("user_code", user_code);
			mylist.put("pageStart", cri.getPageStart());
			mylist.put("perPageNum", cri.getPerPageNum());
			return sqlSession.selectList("MateMapper.getmyMateWriteList",mylist);
		
	}
	
	
	

	
	

}
