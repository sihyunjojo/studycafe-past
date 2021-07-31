package basic.studyCafe.mybatis;

import java.util.List;

import basic.studyCafe.vo.Criteria;
import basic.studyCafe.vo.NoticeVO;

public interface NoticeMapper {
	
	public List<NoticeVO> selectNoticeList(Criteria cri) throws Exception;
	public int selectNoticeOne() throws Exception;

	public NoticeVO selectNotice(int Notice_number);
	public void insertArticle(NoticeVO Notice);
	public void deleteNotice(int Notice_number);
	public void updateNotice(NoticeVO Notice);
	public List<NoticeVO> selectTitleSearchList(NoticeVO searchNotice);
	public List<NoticeVO> selectIdSearchList(NoticeVO searchNotice);
	public void updateCount(int Notice_number);
}
