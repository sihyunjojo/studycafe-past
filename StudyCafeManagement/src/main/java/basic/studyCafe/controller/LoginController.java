package basic.studyCafe.controller;

import java.io.IOException;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import basic.studyCafe.service.BoardService;
import basic.studyCafe.service.MemberService;
import basic.studyCafe.service.NoticeService;
import basic.studyCafe.vo.Criteria;
import basic.studyCafe.vo.MemberVO;
import basic.studyCafe.vo.PageMaker;

@Controller
@RequestMapping("/common/*")
public class LoginController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value = "/LoginMain", method = RequestMethod.GET)
	public ModelAndView LoginMain(@RequestParam(defaultValue = "null") String page,
			@RequestParam(defaultValue = "null") String perPageNum, @RequestParam(defaultValue = "null") String kind)
			throws Exception {
		ModelAndView mav = new ModelAndView();
		Criteria boardCri = new Criteria();
		Criteria noticeCri = new Criteria();

		if (kind.equals("board")) {
			boardCri.setPage(Integer.parseInt(page));
			boardCri.setPerPageNum(Integer.parseInt(perPageNum));
		} else if (kind.equals("notice")) {
			noticeCri.setPage(Integer.parseInt(page));
			noticeCri.setPerPageNum(Integer.parseInt(perPageNum));
		}

		mav.addObject("boardList", boardService.getBoardList(boardCri));
		mav.addObject("noticeList", noticeService.getNoticeList(noticeCri));

		PageMaker boardPageMaker = new PageMaker();
		PageMaker noticePageMaker = new PageMaker();

		boardPageMaker.setCri(boardCri);
		noticePageMaker.setCri(noticeCri);
		boardPageMaker.setTotalCount(boardService.getBoardListCount());
		noticePageMaker.setTotalCount(noticeService.getNoticeListCount());

		mav.addObject("boardPageMaker", boardPageMaker);
		mav.addObject("noticePageMaker", noticePageMaker);

		mav.setViewName("common/LoginMain");

		return mav;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView Login(@RequestParam("id") String id, @RequestParam("password") String password,
			HttpSession session, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		Criteria boardCri = new Criteria();
		Criteria noticeCri = new Criteria();

		mav.addObject("boardList", boardService.getBoardList(boardCri));
		mav.addObject("noticeList", noticeService.getNoticeList(noticeCri));

		PageMaker boardPageMaker = new PageMaker();
		PageMaker noticePageMaker = new PageMaker();

		boardPageMaker.setCri(boardCri);
		noticePageMaker.setCri(noticeCri);
		boardPageMaker.setTotalCount(boardService.getBoardListCount());
		noticePageMaker.setTotalCount(noticeService.getNoticeListCount());

		mav.addObject("boardPageMaker", boardPageMaker);
		mav.addObject("noticePageMaker", noticePageMaker);

		MemberVO member = new MemberVO();
		member.setUser_id(id);
		member.setUser_password(password);

		int result = memberService.checkMember(member, session);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (result != 1) {
			out.println("<script>alert('경고!! 입력하신 정보가 일치하지 않습니다.');</script>");
			out.flush();
		}

		mav.setViewName("common/LoginMain");

		return mav;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView Logout(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		Criteria boardCri = new Criteria();
		Criteria noticeCri = new Criteria();
		mav.addObject("boardList", boardService.getBoardList(boardCri));
		mav.addObject("noticeList", noticeService.getNoticeList(noticeCri));

		PageMaker boardPageMaker = new PageMaker();
		PageMaker noticePageMaker = new PageMaker();

		boardPageMaker.setCri(boardCri);
		noticePageMaker.setCri(noticeCri);
		boardPageMaker.setTotalCount(boardService.getBoardListCount());
		noticePageMaker.setTotalCount(noticeService.getNoticeListCount());

		mav.addObject("boardPageMaker", boardPageMaker);
		mav.addObject("noticePageMaker", noticePageMaker);

		memberService.logoutMember(session);
		mav.setViewName("common/LoginMain");

		return mav;
	}

	@RequestMapping(value = "/JoinForm", method = RequestMethod.GET)
	public String JoinForm() {
		return "common/JoinForm";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView Join(MemberVO member, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		Criteria boardCri = new Criteria();
		Criteria noticeCri = new Criteria();
		mav.addObject("boardList", boardService.getBoardList(boardCri));
		mav.addObject("noticeList", noticeService.getNoticeList(noticeCri));

		PageMaker boardPageMaker = new PageMaker();
		PageMaker noticePageMaker = new PageMaker();

		boardPageMaker.setCri(boardCri);
		noticePageMaker.setCri(noticeCri);
		boardPageMaker.setTotalCount(boardService.getBoardListCount());
		noticePageMaker.setTotalCount(noticeService.getNoticeListCount());

		mav.addObject("boardPageMaker", boardPageMaker);
		mav.addObject("noticePageMaker", noticePageMaker);

		int duplicationCheck = memberService.checkUniqueId(member);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (duplicationCheck == 1) {
			out.println("<script>alert('경고!! 중복된 아이디입니다.');history.back()</script>");
			out.flush();
		} else if (!(member.getUser_password().equals(member.getUser_checkpw()))) {
			out.println("<script>alert('경고!! 비밀번호를 다시 확인해주세요.');history.back()</script>");
			out.flush();
		} else if (member.getUser_id().equals("null")) {
			out.println("<script>alert('경고!! null은 사용할 수 없습니다.');history.back()</script>");
			out.flush();
		} else {
			memberService.joinMember(member);
			out.println("<script>alert('회원가입이 완료되었습니다.');</script>");
			out.flush();
		}

		mav.setViewName("common/LoginMain");
		return mav;
	}

	@RequestMapping(value = "/findIdForm", method = RequestMethod.GET)
	public String FindId() {
		return "common/FindIdForm";
	}

	@RequestMapping(value = "/findIdForm", method = RequestMethod.POST)
	public ModelAndView CheckId(@RequestParam("user_name") String user_name,
			@RequestParam("user_phone") String user_phone, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		MemberVO member = new MemberVO();

		member.setUser_name(user_name);
		member.setUser_phone(user_phone);

		int result = memberService.checkMemberId(member);
		MemberVO forIdMember = memberService.getFindIdMember(member);
		mav.addObject("forIdMember", forIdMember);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (result == 1) {
			mav.setViewName("common/SuccessFindId");
		} else {
			out.println("<script>alert('경고!! 입력하신 정보가 일치하지 않습니다.');</script>");
			out.flush();
			mav.setViewName("common/FindIdForm");
		}
		return mav;
	}

	@RequestMapping(value = "/findPasswordForm", method = RequestMethod.GET)
	public String FindPassword() {
		return "common/FindPasswordForm";
	}

	@RequestMapping(value = "/findPasswordForm", method = RequestMethod.POST)
	public ModelAndView CheckPassword(@RequestParam("user_name") String user_name,
			@RequestParam("user_id") String user_id, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		MemberVO member = new MemberVO();

		member.setUser_name(user_name);
		member.setUser_id(user_id);

		int result = memberService.checkMemberPassword(member);
		MemberVO forPasswordMember = memberService.getFindPasswordMember(member);
		mav.addObject("forPasswordMember", forPasswordMember);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (result == 1) {
			mav.setViewName("common/SuccessFindPassword");
		} else {
			out.println("<script>alert('경고!! 입력하신 정보가 일치하지 않습니다.');</script>");
			out.flush();
			mav.setViewName("common/FindPasswordForm");
		}
		return mav;

	}

	@RequestMapping(value = "/popUp")
	public String PopUp() {
		return "common/PopUp";
	}

}
