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
	public void insertMateApplyNotice(long mate_writer, String mateApplyContent, int mate_Application_code)
			throws Exception {
		Map<String, Object> mateApplyNotice = new HashMap<>();
		mateApplyNotice.put("mate_writer", mate_writer);
		mateApplyNotice.put("mateApplyContent", mateApplyContent);
		mateApplyNotice.put("mate_Application_code", mate_Application_code);
		sqlSession.insert("MateMapper.insertMateApplyNotice",mateApplyNotice);
		
	}

	

	
}
