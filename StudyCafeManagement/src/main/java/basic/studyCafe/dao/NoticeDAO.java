package basic.studyCafe.dao;

import java.util.List;

import basic.studyCafe.vo.Criteria;
import basic.studyCafe.vo.NoticeVO;

public interface NoticeDAO {

	public List<NoticeVO> selectNoticeList(Criteria cri) throws Exception;
	public int selectNoticeOne() throws Exception;
	public NoticeVO selectNotice(int notice_number);
	public void insertArticle(NoticeVO notice);
	public void updateNotice(NoticeVO notice);
	public void deleteNotice(int notice_number);
	public List<NoticeVO> selectTitleSearchList(NoticeVO searchNotice);
	public List<NoticeVO> selectIdSearchList(NoticeVO searchNotice);
	public void updateCount(int notice_number);

}
