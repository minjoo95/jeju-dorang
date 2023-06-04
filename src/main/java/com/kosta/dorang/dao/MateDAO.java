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
	public List<Mate> getMateListViewSort() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("MateMapper.getMateListViewSort");
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
	public List<Mate> selectMateListByUser(long user_code) {
		return sqlSession.selectList("MateMapper.selectMateListByUser",user_code);
	}

	@Override
	public List<MateComments> selectMateReplyListByMateCode(int mate_code) throws Exception {
		return sqlSession.selectList("MateMapper.selectMateReplyListByMateCode",mate_code);
	}

	@Override
	public void insertMateReply(MateComments mateComments) {
		sqlSession.insert("MateMapper.insertMateReply",mateComments);
		
	}

	
}
