package www.bogo.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/memberfinal")
public class MemberController {
	
	@RequestMapping(value="/myinfo", method = RequestMethod.GET)
	public String lecturelist() {
		return "memberfinal/myinfo";
	}
}
