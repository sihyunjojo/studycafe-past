package basic.studyCafe.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import basic.studyCafe.service.BoardService;
import basic.studyCafe.vo.BoardVO;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService boardService;


	@RequestMapping("/BoardList")
	public ModelAndView viewBoardList() {
		ModelAndView mav = new ModelAndView();
		List<BoardVO> boardList = boardService.getBoardList();
		mav.setViewName("board/BoardList");
		mav.addObject("boardList", boardList);
		return mav;
	}

	@RequestMapping("/BoardDetail")
	public ModelAndView showBoardDetail(@RequestParam int board_number, @RequestParam String user_id, @RequestParam String writer) {
		ModelAndView mav = new ModelAndView();
		BoardVO board = boardService.getBoardDetail(board_number);
		boardService.increaseCount(board_number);
		mav.addObject("board", board);
		
		if(user_id.equals(writer) || user_id.equals("admin")) {
			mav.setViewName("board/BoardDetail");
		}
		else{
			mav.setViewName("board/BoardReadOnlyDetail");
		}

		return mav;
	}
	@RequestMapping(value = "/BoardInsert", method = RequestMethod.GET)
	public String boardWriteForm() {
		return "/board/BoardWriteForm";
	}

	@RequestMapping(value = "/BoardInsert", method = RequestMethod.POST)
	public String registBoard(@RequestParam("user_id") String user_id, BoardVO board) {

		board.setUser_id(user_id);
		boardService.registArticle(board);

		return "redirect:/board/BoardList";
	}

	@RequestMapping(value = "/BoardUpdate", method = RequestMethod.GET)
	public ModelAndView boardUpdateForm(@RequestParam int board_number) {
		ModelAndView mav = new ModelAndView();
		BoardVO board = boardService.getBoardDetail(board_number);

		mav.setViewName("board/BoardUpdateForm");
		mav.addObject("board", board);

		return mav;
	}

	@RequestMapping(value = "/BoardUpdate", method = RequestMethod.POST)
	public String updateBoard(BoardVO board) {
		boardService.modifyBoard(board);
		return "redirect:/board/BoardList";
	}

	@RequestMapping("/BoardDelete")
	public String removeBoard(@RequestParam int board_number) {
		boardService.removeBoard(board_number);
		return "redirect:/board/BoardList";
	}

	@RequestMapping(value = "/BoardSearch", method = RequestMethod.POST)
	public ModelAndView viewBoardSearchList(@RequestParam(defaultValue = "board_title") String search_option,
			@RequestParam("keyword") String keyword, BoardVO searchBoard) {
		ModelAndView mav = new ModelAndView();

		List<BoardVO> boardSearchList;
		if (search_option.equals("board_title")) {
			searchBoard.setBoard_title(keyword);
			boardSearchList = boardService.getTitleSearchList(searchBoard);
		} else {
			searchBoard.setUser_id(keyword);
			boardSearchList = boardService.getIdSearchBoardList(searchBoard);
		}

		mav.setViewName("board/BoardSearchList");
		mav.addObject("boardSearchList", boardSearchList);	

		return mav;
	}
	


}
