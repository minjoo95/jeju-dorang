package com.kosta.dorang.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.dorang.dto.Board;
import com.kosta.dorang.dto.BoardComments;
import com.kosta.dorang.dto.BoardLike;

@Repository
public class BoardDAO implements BoardDAOI {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Board> selectBoardList() {
		return sqlSession.selectList("BoardMapper.selectBoardList");
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
	
	


	
	
	
	
}
