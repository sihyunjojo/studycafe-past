package basic.studyCafe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import basic.studyCafe.dao.NoticeDAO;
import basic.studyCafe.vo.Criteria;
import basic.studyCafe.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<NoticeVO> getNoticeList(Criteria cri) throws Exception{
		// TODO Auto-generated method stub
		List<NoticeVO> noticeList = noticeDAO.selectNoticeList(cri);
		return noticeList;
	}

	
	@Override
	public int getNoticeListCount() throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.selectNoticeOne();
	}

	@Override
	public NoticeVO getNoticeDetail(int notice_number) {
		// TODO Auto-generated method stub
		NoticeVO notice = noticeDAO.selectNotice(notice_number);
		return notice;
	}

	@Override
	public void registArticle(NoticeVO notice) {
		// TODO Auto-generated method stub
		noticeDAO.insertArticle(notice);
	}

	@Override
	public void modifyNotice(NoticeVO notice) {
		// TODO Auto-generated method stub
		noticeDAO.updateNotice(notice);
	}

	@Override
	public void removeNotice(int notice_number) {
		// TODO Auto-generated method stub
		noticeDAO.deleteNotice(notice_number);

	}

	@Override
	public List<NoticeVO> getTitleSearchList(NoticeVO searchNotice) {
		// TODO Auto-generated method stub
		List<NoticeVO> noticeSearchList = noticeDAO.selectTitleSearchList(searchNotice);
		return noticeSearchList;
	}

	@Override
	public List<NoticeVO> getIdSearchNoticeList(NoticeVO searchNotice) {
		// TODO Auto-generated method stub
		List<NoticeVO> noticeSearchList = noticeDAO.selectIdSearchList(searchNotice);
		return noticeSearchList;
	}

	@Override
	public void increaseCount(int notice_number) {
		// TODO Auto-generated method stub
		noticeDAO.updateCount(notice_number);
	}

}
