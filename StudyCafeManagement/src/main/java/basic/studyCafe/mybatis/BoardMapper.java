package basic.studyCafe.mybatis;

import java.util.List;

import basic.studyCafe.vo.BoardVO;
import basic.studyCafe.vo.Criteria;

public interface BoardMapper {

	public List<BoardVO> selectBoardList(Criteria cri) throws Exception;
	public int selectBoardOne() throws Exception;

	public BoardVO selectBoard(int board_number);
	public void insertArticle(BoardVO board);
	public void deleteBoard(int board_number);
	public void updateBoard(BoardVO board);
	public List<BoardVO> selectTitleSearchList(BoardVO searchBoard);
	public List<BoardVO> selectIdSearchList(BoardVO searchBoard);
	public void updateCount(int board_number);

	
}
