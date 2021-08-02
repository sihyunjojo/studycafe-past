package basic.studyCafe.service;

import java.util.List;

import basic.studyCafe.vo.BoardVO;
import basic.studyCafe.vo.Criteria;

public interface BoardService {
	public List<BoardVO> getBoardList(Criteria cri) throws Exception; // ��ü �Խ�Ŭ ���(����¡)
	public int getBoardListCount() throws Exception;

	public BoardVO getBoardDetail(int board_number); // �Խñ� ��
	public void registArticle(BoardVO board); // �Խñ� ���
	public void removeBoard(int board_number); // �Խñ� ����
	public void modifyBoard(BoardVO board); // �Խñ� ����
	
	public List<BoardVO> getTitleSearchList(BoardVO searchBoard);
	
	public List<BoardVO> getIdSearchBoardList(BoardVO searchBoard);
	
	public void increaseCount(int board_number); // ��ȸ�� ����

}
