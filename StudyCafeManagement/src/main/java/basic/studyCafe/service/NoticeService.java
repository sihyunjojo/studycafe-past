package basic.studyCafe.service;

import java.util.List;

import basic.studyCafe.vo.Criteria;
import basic.studyCafe.vo.NoticeVO;

public interface NoticeService {

	public List<NoticeVO> getNoticeList(Criteria cri) throws Exception;
	public int getNoticeListCount() throws Exception;
	public NoticeVO getNoticeDetail(int notice_number);
	public void increaseCount(int notice_number);
	public void registArticle(NoticeVO notice);
	public void modifyNotice(NoticeVO notice);
	public void removeNotice(int notice_number);
	public List<NoticeVO> getTitleSearchList(NoticeVO searchNotice);
	public List<NoticeVO> getIdSearchNoticeList(NoticeVO searchNotice);


}
