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
import com.kosta.dorang.dto.MateJoinMateApply;
import com.kosta.dorang.dto.Notice;


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
		return sqlSession.selectList("MateMapper.getMateListViewSort",cri);
	}

	
	
	/*동행신청*/
	
	@Override
	public int insertApplyMate(MateApply mp) throws Exception {
		int insertCheck=sqlSession.insert("MateMapper.insertApplyMate",mp);
		return insertCheck;
		
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
	@Override
	public List<String> selectApplyMateResult(Long user_code) throws Exception {
		 return sqlSession.selectList("MateMapper.selectApplyMateResult",user_code);
	}
	
	
  //응심이 
	@Override
	public List<MateCommentsUser> selectMateReplyListByMateCode(int mate_code) throws Exception {
		return sqlSession.selectList("MateMapper.selectMateReplyListByMateCode",mate_code);
	}

	@Override
	public int insertMateReply(MateComments mateComments) {
		int insertCheck=0;
		try {
			insertCheck = sqlSession.insert("MateMapper.insertMateReply",mateComments);
			System.out.println("DAO insertCheck : "+insertCheck);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertCheck;
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


	@Override
	public void insertMateReplyNotice(long mateWriter,String noticeContent, int comment_code) throws Exception {
		Map<String, Object> mateReplyNotice = new HashMap<>();
		mateReplyNotice.put("mateWriter", mateWriter);
		mateReplyNotice.put("noticeContent", noticeContent);
		mateReplyNotice.put("comment_code", comment_code);
		sqlSession.insert("MateMapper.insertMateReplyNotice", mateReplyNotice);
	}

	@Override
	public void insertMateApplyNotice(long mate_writer, String mateApplyContent, int mate_Application_code,String result) throws Exception {
		Map<String, Object> mateApplyNotice = new HashMap<>();
		mateApplyNotice.put("mate_writer", mate_writer);
		mateApplyNotice.put("mateApplyContent", mateApplyContent);
		mateApplyNotice.put("mate_Application_code", mate_Application_code);
		mateApplyNotice.put("result", result);
		sqlSession.insert("MateMapper.insertMateApplyNotice",mateApplyNotice);
		
	}

	@Override
	public int updateWithMateApplyAccept(int mate_application_code) throws Exception {
		int updateCheck=sqlSession.update("MateMapper.updateWithMateApplyAccept",mate_application_code);
		return updateCheck;
	}

	@Override
	public MateJoinMateApply selectMateApplyByMateApplyCode(int mate_application_code) throws Exception {
		return sqlSession.selectOne("MateMapper.selectMateApplyByMateApplyCode",mate_application_code);
	}

	@Override
	public void insertWithMateApplyAccept(long user_code, String content, int mate_application_code,String result) throws Exception {
		Map<String, Object> insertWithMateApplyAcceptNotice = new HashMap<>();
		insertWithMateApplyAcceptNotice.put("user_code", user_code);
		insertWithMateApplyAcceptNotice.put("content", content);
		insertWithMateApplyAcceptNotice.put("mate_application_code", mate_application_code);
		insertWithMateApplyAcceptNotice.put("result", result);
		sqlSession.insert("MateMapper.insertWithMateApplyAcceptNotice",insertWithMateApplyAcceptNotice);
		
	}

	@Override
	public void updateNoticeBymateApplicationCode(int mate_application_code) throws Exception {
		sqlSession.update("MateMapper.updateNoticeBymateApplicationCode",mate_application_code);
		
	}

	@Override
	public int updateWithMateApplyRefuse(int mate_application_code) throws Exception {
		int updateCheck=sqlSession.update("MateMapper.updateWithMateApplyRefuse",mate_application_code);
		return updateCheck;
	}

	@Override
	public void insertWithMateApplyRefuse(long user_code, String content, int mate_application_code,String result) throws Exception {
		Map<String, Object> insertWithMateApplyRefuseNotice = new HashMap<>();
		insertWithMateApplyRefuseNotice.put("user_code", user_code);
		insertWithMateApplyRefuseNotice.put("content", content);
		insertWithMateApplyRefuseNotice.put("mate_application_code", mate_application_code);
		insertWithMateApplyRefuseNotice.put("result", result);
		sqlSession.insert("MateMapper.insertWithMateApplyRefuseNotice",insertWithMateApplyRefuseNotice);
		
	}

	@Override
	public void updateMateWithJoinCount(int mate_code) throws Exception {
		sqlSession.update("MateMapper.updateMateWithJoinCount",mate_code);
		
	}

}
