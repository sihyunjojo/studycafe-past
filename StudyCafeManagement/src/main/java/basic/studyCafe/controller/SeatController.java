package basic.studyCafe.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import basic.studyCafe.service.SeatService;
import basic.studyCafe.vo.BoardVO;
import basic.studyCafe.vo.SeatVO;

@Controller
@RequestMapping("/seat/*")
public class SeatController {

	@Autowired
	private SeatService seatService;

	@RequestMapping(value = "/register")
	public ModelAndView registPOST() throws Exception {
		ModelAndView mav = new ModelAndView();
		List<SeatVO> seatList = seatService.getSeatList();
		mav.setViewName("seat/register");
		mav.addObject("seatList", seatList);
		return mav;
	}

	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String reserveSeat(@RequestParam("seatNum") int seatNum, @RequestParam("user_id") String user_id,
			SeatVO seat) {

		seat.setSeat_number(seatNum);
		seat.setUser_id(user_id);
		seatService.registSeat(seat);

		return "redirect:/seat/register";
	}

	@RequestMapping(value = "/return", method = RequestMethod.POST)
	public String returnSeat(@RequestParam("seatNum") int seatNum, SeatVO seat) {
		seat.setSeat_number(seatNum);
		seatService.returnSeat(seat);
		return "redirect:/seat/register";
	}

	
}
