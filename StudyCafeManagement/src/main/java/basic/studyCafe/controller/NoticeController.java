package basic.studyCafe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import basic.studyCafe.service.NoticeService;
import basic.studyCafe.vo.Criteria;
import basic.studyCafe.vo.NoticeVO;
import basic.studyCafe.vo.PageMaker;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@RequestMapping("/NoticeList")
	public String viewNoticeList(@RequestParam String user_id, Model model, Criteria cri) throws Exception {
		String path = "";
		model.addAttribute("noticeList", noticeService.getNoticeList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticeService.getNoticeListCount());
		model.addAttribute("pageMaker", pageMaker);

		if (user_id.equals("admin")) {
			path = "notice/NoticeList";
		} else {
			path = "notice/UserNoticeList";
		}

		return path;
	}

	@RequestMapping("/NoticeDetail")
	public String showNoticeDetail(@RequestParam int notice_number, @RequestParam String user_id, @ModelAttribute("cri") Criteria cri, 
			Model model) {
		String path = "";
		NoticeVO notice = noticeService.getNoticeDetail(notice_number);
		noticeService.increaseCount(notice_number);
		model.addAttribute("notice", notice);

		if (user_id.equals("admin")) {
			path = "notice/NoticeDetail";
		} else {
			path = "notice/UserNoticeDetail";
		}
		return path;
	}

	@RequestMapping(value = "/NoticeInsert", method = RequestMethod.GET)
	public String NoticeWriteForm(@ModelAttribute("cri") Criteria cri, 
			Model model) {
		return "/notice/NoticeWriteForm";
	}

	@RequestMapping(value = "/NoticeInsert", method = RequestMethod.POST)
	public String registNotice(@RequestParam("user_id") String user_id, NoticeVO notice) {

		notice.setUser_id(user_id);
		noticeService.registArticle(notice);

		return "redirect:/notice/NoticeList?user_id=" + user_id;
	}

	@RequestMapping(value = "/NoticeUpdate", method = RequestMethod.GET)
	public String NoticeUpdateForm(@RequestParam int notice_number, @ModelAttribute("cri") Criteria cri, 
			Model model) {
		NoticeVO notice = noticeService.getNoticeDetail(notice_number);

		model.addAttribute("notice", notice);

		return "notice/NoticeUpdateForm";
	}

	@RequestMapping(value = "/NoticeUpdate", method = RequestMethod.POST)
	public String updateNotice(NoticeVO notice, @RequestParam String user_id, @ModelAttribute("cri") Criteria cri, 
			Model model) {
		noticeService.modifyNotice(notice);
		
		return "redirect:/notice/NoticeList?user_id=" + user_id + "&page=" + cri.getPage() + "&perPageNum=" + cri.getPerPageNum();

	}

	@RequestMapping("/NoticeDelete")
	public String removeNotice(@RequestParam int notice_number, @RequestParam String user_id, @ModelAttribute("cri") Criteria cri, 
			Model model) {
		noticeService.removeNotice(notice_number);
		return "redirect:/notice/NoticeList?user_id=" + user_id + "&page=" + cri.getPage() + "&perPageNum=" + cri.getPerPageNum();
	}

	@RequestMapping(value = "/NoticeSearch", method = RequestMethod.POST)
	public String viewNoticeSearchList(@RequestParam(defaultValue = "notice_title") String search_option,
			@RequestParam("keyword") String keyword, NoticeVO searchNotice, @RequestParam String user_id, @ModelAttribute("cri") Criteria cri, 
			Model model) {
		String path = "";
		
		List<NoticeVO> noticeSearchList;
		if (search_option.equals("notice_title")) {
			searchNotice.setNotice_title(keyword);
			noticeSearchList = noticeService.getTitleSearchList(searchNotice);
		} else {
			searchNotice.setUser_id(keyword);
			noticeSearchList = noticeService.getIdSearchNoticeList(searchNotice);
		}

		model.addAttribute("noticeSearchList", noticeSearchList);

		if (user_id.equals("admin")) {
			path = "notice/NoticeSearchList";
		} else {
			path = "notice/UserNoticeSearchList";
		}

		return path;
	}

}
