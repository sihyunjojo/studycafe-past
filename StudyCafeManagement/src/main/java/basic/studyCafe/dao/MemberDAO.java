package basic.studyCafe.dao;

import java.util.ArrayList;
import basic.studyCafe.vo.Member;
import basic.studyCafe.vo.MemberVO;

public interface MemberDAO {
	public ArrayList<Member> getMembers();
	public void insertMember(Member member);
	public void updateMember(Member member);
	public void deleteMember(int id);
	public Member selectUpdateMember(int id);
	public int getLoginMember(MemberVO member);
}