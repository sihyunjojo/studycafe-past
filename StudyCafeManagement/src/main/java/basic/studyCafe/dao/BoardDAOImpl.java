package basic.studyCafe.dao;


import java.util.ArrayList;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import basic.studyCafe.mybatis.BoardMapper;
import basic.studyCafe.mybatis.MemberMapper;
import basic.studyCafe.vo.BoardVO;
import basic.studyCafe.vo.Criteria;


@Repository
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardVO> selectBoardList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		List<BoardVO> boardList = boardMapper.selectBoardList(cri);
		return boardList;
	}
	

	
	@Override
	public int selectBoardOne() throws Exception {
		// TODO Auto-generated method stub
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		return boardMapper.selectBoardOne();
	}


	@Override
	public BoardVO selectBoard(int board_number) {
		// TODO Auto-generated method stub
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO board = boardMapper.selectBoard(board_number);
		return board;
	}
	
	@Override
	public void insertArticle(BoardVO board) {
		// TODO Auto-generated method stub
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.insertArticle(board);
	}

	@Override
	public void deleteBoard(int board_number) {
		// TODO Auto-generated method stub
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.deleteBoard(board_number);		
	}

	@Override
	public void updateBoard(BoardVO board) {
		// TODO Auto-generated method stub
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.updateBoard(board);
	}

	@Override
	public List<BoardVO> selectTitleSearchList(BoardVO searchBoard) {
		// TODO Auto-generated method stub
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		List<BoardVO> boardSearchList = boardMapper.selectTitleSearchList(searchBoard);
		return boardSearchList;
	}

	@Override
	public List<BoardVO> selectIdSearchList(BoardVO searchBoard) {
		// TODO Auto-generated method stub
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		List<BoardVO> boardSearchList = boardMapper.selectIdSearchList(searchBoard);
		return boardSearchList;
	}

	@Override
	public void updateCount(int board_number) {
		// TODO Auto-generated method stub
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.updateCount(board_number);
	}
	
	/*
	 * @Override public List<BoardVO> listSearch(SearchCriteria pageVO) throws
	 * Exception { // TODO Auto-generated method stub BoardMapper boardMapper =
	 * sqlSession.getMapper(BoardMapper.class); return
	 * boardMapper.selectList(pageVO); }
	 * 
	 * @Override public int listSearchCount(SearchCriteria pageVO) throws Exception
	 * { // TODO Auto-generated method stub BoardMapper boardMapper =
	 * sqlSession.getMapper(BoardMapper.class); return
	 * boardMapper.selectOne(pageVO); }
	 */


	
}

