package com.kosta.dorang.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.dorang.dto.Board;
import com.kosta.dorang.dto.BoardComments;
import com.kosta.dorang.dto.BoardCriteria;
import com.kosta.dorang.dto.BoardLike;
import com.kosta.dorang.dto.User;

@Repository
public class BoardDAO implements BoardDAOI {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Board> selectBoardList() {
		return sqlSession.selectList("BoardMapper.selectBoardList");
	}
	
	@Override
	public List<Map<String, Object>> selectBoardPageList(BoardCriteria cri) {	
		return sqlSession.selectList("BoardMapper.selectBoardPageList", cri);
	}

	@Override
	public int countBoardListTotal() {
		return sqlSession.selectOne("BoardMapper.countBoardListTotal");
	}
	
	@Override
	public int countBoardSearchListTotal(String boardSearch) {
		return sqlSession.selectOne("BoardMapper.countBoardSearchListTotal", boardSearch);
	}
	
	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("BoardMapper.insertBoard", board);
	}

	@Override
	public Board selectOneBoard(int no) {
		return sqlSession.selectOne("BoardMapper.selectOneBoard", no);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.update("BoardMapper.updateBoard", board);
	}

	@Override
	public int deleteBoard(int no) {
		return sqlSession.delete("BoardMapper.deleteBoard", no);
	}

	@Override
	public BoardLike selectOneBoardLike(BoardLike boardLike) {
		//System.out.println("selectOneBoardLike : " + boardLike.getBoard_id() + ", " + boardLike.getUser_code());
		return sqlSession.selectOne("BoardMapper.selectOneBoardLike", boardLike);
	}

	@Override
	public int insertBoardLike(BoardLike boardLike) {
		
		return sqlSession.insert("BoardMapper.insertBoardLike", boardLike);
	}

	@Override
	public int updateBoardLike(int no) {
		
		return sqlSession.update("BoardMapper.updateBoardLike", no);
	}

	@Override
	public int insertBoardComments(BoardComments boardComments) {
		
		return sqlSession.insert("BoardMapper.insertBoardComments", boardComments);
	}

	@Override
	public List<BoardComments> selectBoardCommentsList(int no) {
		
		return sqlSession.selectList("BoardMapper.selectBoardCommentsList", no);
	}

	//삭제
	@Override
	public int deleteBoardComment(int commentNo, int boardId) {
		
		return sqlSession.delete("BoardMapper.deleteBoardComment", sqlSession);
	}

	//
	@Override
	public List<Map<String, Object>> selectBoardSearchPageList(BoardCriteria cri) {
		return sqlSession.selectList("BoardMapper.selectBoardSearchPageList", cri);
	}

	@Override
	public User selectUser(long userCode) {
		
		return sqlSession.selectOne("BoardMapper.selectUser", userCode);
	}

	@Override
	public int countBoardUserListTotal(long userCode) {
		
		return sqlSession.selectOne("BoardMapper.countBoardUserListTotal", userCode);
	}

	@Override
	public List<Map<String, Object>> selectBoardUserPageList(BoardCriteria cri) {
		
		return sqlSession.selectList("BoardMapper.selectBoardUserPageList", cri);
	}

	@Override
	public int deleteBoardComment(int commentNo) {
		
		return sqlSession.delete("BoardMapper.deleteBoardComment", commentNo);
		
	}

	@Override
	public void insertBoardReplyNotice(long baordUserCode, String noticeContent, int comment_no) {
		Map<String, Object> boardReplyNotice = new HashMap<>();
		boardReplyNotice.put("baordUserCode", baordUserCode);
		boardReplyNotice.put("noticeContent", noticeContent);
		boardReplyNotice.put("comment_no", comment_no);
		sqlSession.insert("BoardMapper.insertBoardReplyNotice", boardReplyNotice);
		
	}


//	@Override
//	public List<Board> selectBoardPaging() {
//		// TODO Auto-generated method stub
//		return null;
//	}	

	
}
