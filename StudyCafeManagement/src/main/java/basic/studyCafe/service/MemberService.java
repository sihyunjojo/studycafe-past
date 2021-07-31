package basic.studyCafe.service;

import javax.servlet.http.HttpSession;
import basic.studyCafe.vo.MemberVO;

public interface MemberService {
	public int checkMember(MemberVO member, HttpSession session);
	public MemberVO viewMember(MemberVO member);
	public void joinMember(MemberVO member);
	public int checkMemberId(MemberVO member);
	public MemberVO getFindIdMember(MemberVO member);
	public int checkMemberPassword(MemberVO member);
	public MemberVO getFindPasswordMember(MemberVO member);
	public void logoutMember(HttpSession session);
	public int checkUniqueId(MemberVO member);

}
