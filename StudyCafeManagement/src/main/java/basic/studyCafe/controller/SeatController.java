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
import basic.studyCafe.vo.SeatVO;

@Controller
@RequestMapping("/seat/*")
public class SeatController {

	@Autowired
	private SeatService seatService;

	@RequestMapping(value = "/register")
	public ModelAndView registPOST(@RequestParam(defaultValue = "null") String user_id, 
			HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if (user_id.equals("null")) {
			out.println("<script>alert('경고!! 로그인이 필요합니다');history.back()</script>");
			out.flush();
		} else {
			List<SeatVO> seatList = seatService.getSeatList();
			mav.addObject("seatList", seatList);
			mav.setViewName("seat/register");
		}

		return mav;
	}

	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String reserveSeat(@RequestParam int seatNum, @RequestParam String user_id, SeatVO seat) {

		seat.setSeat_number(seatNum);
		seat.setUser_id(user_id);
		seatService.registSeat(seat);

		return "redirect:/seat/register?user_id=" + user_id;
	}

	@RequestMapping(value = "/return", method = RequestMethod.POST)
	public String returnSeat(@RequestParam int seatNum, SeatVO seat, @RequestParam String user_id) {
		seat.setSeat_number(seatNum);
		seat.setUser_id(user_id);
		seatService.returnSeat(seat);
		return "redirect:/seat/register?user_id=" + user_id;
	}

}
