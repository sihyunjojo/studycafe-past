package basic.studyCafe.service;

import java.util.List;

import basic.studyCafe.vo.BoardVO;
import basic.studyCafe.vo.Criteria;

public interface BoardService {
	public List<BoardVO> getBoardList(Criteria cri) throws Exception; // 전체 게시클 목록(페이징)
	public int getBoardListCount() throws Exception;

	public BoardVO getBoardDetail(int board_number); // 게시글 상세
	public void registArticle(BoardVO board); // 게시글 등록
	public void removeBoard(int board_number); // 게시글 삭제
	public void modifyBoard(BoardVO board); // 게시글 수정
	
	public List<BoardVO> getTitleSearchList(BoardVO searchBoard);
	
	public List<BoardVO> getIdSearchBoardList(BoardVO searchBoard);
	
	public void increaseCount(int board_number); // 조회수 증가

}
