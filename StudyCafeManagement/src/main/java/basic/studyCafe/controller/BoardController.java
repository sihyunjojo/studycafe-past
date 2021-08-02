package basic.studyCafe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import basic.studyCafe.service.BoardService;
import basic.studyCafe.vo.BoardVO; 
import basic.studyCafe.vo.Criteria;
import basic.studyCafe.vo.PageMaker;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping("/BoardList")
	public String viewBoardList(Model model, Criteria cri) throws Exception {
		model.addAttribute("boardList", boardService.getBoardList(cri));
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.getBoardListCount());
		
		model.addAttribute("pageMaker", pageMaker);
		return "board/BoardList";
	}

	@RequestMapping("/BoardDetail")
	public String showBoardDetail(@RequestParam int board_number, 
			@ModelAttribute("cri") Criteria cri, @RequestParam String user_id, @RequestParam String writer, 
			Model model) throws Exception {
		String path = "";
		BoardVO board = boardService.getBoardDetail(board_number);
		boardService.increaseCount(board_number);
		model.addAttribute("board", board);
		
		if(user_id.equals(writer) || user_id.equals("admin")) {
			path = "board/BoardDetail";
		}
		else{
			path = "board/BoardReadOnlyDetail";
		}

		return path;
	}
	
	@RequestMapping(value = "/BoardInsert", method = RequestMethod.GET)
	public String boardWriteForm(@ModelAttribute("cri") Criteria cri, Model model) {
		return "/board/BoardWriteForm";
	}

	@RequestMapping(value = "/BoardInsert", method = RequestMethod.POST)
	public String registBoard(@RequestParam("user_id") String user_id, BoardVO board) {

		board.setUser_id(user_id);
		boardService.registArticle(board);

		return "redirect:/board/BoardList";
	}

	@RequestMapping(value = "/BoardUpdate", method = RequestMethod.GET)
	public String boardUpdateForm(@RequestParam int board_number, @ModelAttribute("cri") Criteria cri, Model model) {
				
		BoardVO board = boardService.getBoardDetail(board_number);
		model.addAttribute("board", board);
		return "board/BoardUpdateForm";
	}

	@RequestMapping(value = "/BoardUpdate", method = RequestMethod.POST)
	public String updateBoard(BoardVO board, @ModelAttribute("cri") Criteria cri, Model model) {
		boardService.modifyBoard(board);
		return "redirect:/board/BoardList?page=" + cri.getPage() + "&perPageNum=" + cri.getPerPageNum();
	}

	@RequestMapping("/BoardDelete")
	public String removeBoard(@RequestParam int board_number, @ModelAttribute("cri") Criteria cri, Model model) {
		boardService.removeBoard(board_number);
		return "redirect:/board/BoardList?page=" + cri.getPage() + "&perPageNum=" + cri.getPerPageNum();	}

	@RequestMapping(value = "/BoardSearch", method = RequestMethod.POST)
	public String viewBoardSearchList(@RequestParam(defaultValue = "board_title") String search_option,
			@RequestParam("keyword") String keyword, BoardVO searchBoard, @ModelAttribute("cri") Criteria cri, Model model) {

		List<BoardVO> boardSearchList;
		if (search_option.equals("board_title")) {
			searchBoard.setBoard_title(keyword);
			boardSearchList = boardService.getTitleSearchList(searchBoard);
		} else {
			searchBoard.setUser_id(keyword);
			boardSearchList = boardService.getIdSearchBoardList(searchBoard);
		}

		model.addAttribute("boardSearchList", boardSearchList);	

		return "board/BoardSearchList";
	}
	


}
