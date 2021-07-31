package basic.studyCafe.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import basic.studyCafe.dao.MemberDAO;
import basic.studyCafe.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int checkMember(MemberVO member, HttpSession session) {
		// TODO Auto-generated method stub
		if (memberDAO.getLoginMember(member) == 1) {
			MemberVO member2 = viewMember(member);

			session.setAttribute("user_id", member2.getUser_id());
			session.setAttribute("user_name", member2.getUser_name());
		}

		return memberDAO.getLoginMember(member);
	}

	@Override
	public MemberVO viewMember(MemberVO member) {
		// TODO Auto-generated method stub
		return memberDAO.getMemberVO(member);
	}

	@Override
	public void logoutMember(HttpSession session) {
		// TODO Auto-generated method stub
		session.invalidate();
	}

	@Override
	public void joinMember(MemberVO member) {
		// TODO Auto-generated method stub
		memberDAO.insertMemberVO(member);

	}

	@Override
	public int checkMemberId(MemberVO member) {
		// TODO Auto-generated method stub
		return memberDAO.getMemberId(member);
	}

	@Override
	public MemberVO getFindIdMember(MemberVO member) {
		// TODO Auto-generated method stub
		return memberDAO.getFindIdMember(member);
	}

	@Override
	public int checkMemberPassword(MemberVO member) {
		// TODO Auto-generated method stub
		return memberDAO.getMemberPassword(member);
	}

	@Override
	public MemberVO getFindPasswordMember(MemberVO member) {
		// TODO Auto-generated method stub
		return memberDAO.getFindPasswordMember(member);
	}

	@Override
	public int checkUniqueId(MemberVO member) {
		// TODO Auto-generated method stub
		return memberDAO.getUniqueId(member);
	}
}
