package basic.studyCafe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import basic.studyCafe.mybatis.BoardMapper;
import basic.studyCafe.mybatis.NoticeMapper;
import basic.studyCafe.vo.BoardVO;
import basic.studyCafe.vo.Criteria;
import basic.studyCafe.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeVO> selectNoticeList(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		List<NoticeVO> noticeList = noticeMapper.selectNoticeList(cri);
		return noticeList;	
		}
	

	@Override
	public int selectNoticeOne() throws Exception {
		// TODO Auto-generated method stub
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		return noticeMapper.selectNoticeOne();
		}
	
	@Override
	public NoticeVO selectNotice(int notice_number) {
		// TODO Auto-generated method stub
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		NoticeVO notice = noticeMapper.selectNotice(notice_number);
		return notice;
	}

	@Override
	public void insertArticle(NoticeVO notice) {
		// TODO Auto-generated method stub
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		noticeMapper.insertArticle(notice);

	}

	@Override
	public void updateNotice(NoticeVO notice) {
		// TODO Auto-generated method stub
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		noticeMapper.updateNotice(notice);

	}

	@Override
	public void deleteNotice(int notice_number) {
		// TODO Auto-generated method stub
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		noticeMapper.deleteNotice(notice_number);		

	}

	@Override
	public List<NoticeVO> selectTitleSearchList(NoticeVO searchNotice) {
		// TODO Auto-generated method stub
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		List<NoticeVO> noticeSearchList = noticeMapper.selectTitleSearchList(searchNotice);
		return noticeSearchList;
	}

	@Override
	public List<NoticeVO> selectIdSearchList(NoticeVO searchNotice) {
		// TODO Auto-generated method stub
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		List<NoticeVO> noticeSearchList = noticeMapper.selectIdSearchList(searchNotice);
		return noticeSearchList;
	}

	@Override
	public void updateCount(int notice_number) {
		// TODO Auto-generated method stub
		NoticeMapper noticeMapper = sqlSession.getMapper(NoticeMapper.class);
		noticeMapper.updateCount(notice_number);

	}

}
