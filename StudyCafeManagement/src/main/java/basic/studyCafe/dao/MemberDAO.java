package basic.studyCafe.dao;

import basic.studyCafe.vo.MemberVO;

public interface MemberDAO {

	public int getLoginMember(MemberVO member);
	public void insertMemberVO(MemberVO member);
	public int getMemberId(MemberVO member);
	public MemberVO getFindIdMember(MemberVO member);
	public int getMemberPassword(MemberVO member);
	public MemberVO getFindPasswordMember(MemberVO member);
	public MemberVO getMemberVO(MemberVO member);
	public int getUniqueId(MemberVO member);
	

}
