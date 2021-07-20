package basic.studyCafe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/seat/*")
public class SeatController {


	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage() throws Exception {

		return "seat/list";
	}


	@RequestMapping(value = "/register")
	public String registPOST() throws Exception {

		return "seat/register";
	}
	
	@RequestMapping(value = "/reserve", method = RequestMethod.POST)
	public String Reserve() {
		
		return "";
	}

	

}
