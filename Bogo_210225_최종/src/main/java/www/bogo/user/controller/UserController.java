package www.bogo.user.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.util.SearchCriteria;
import www.bogo.board.vo.BoardVO;
import www.bogo.user.service.UserService;
import www.bogo.user.vo.LoginDTO;
import www.bogo.user.vo.UserVO;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Inject
	UserService us;
	
	
	@RequestMapping("/signIn")
	public String signIn() {
		return "user/signIn";
	}
	
	@RequestMapping("/signUp")
	public String signUp() {
		return "user/signUp";
	}
	@RequestMapping("/userInfo")
	public String userInfo() {
		 return "user/userInfo";
	}
	
	
	@PostMapping("/signInPost")
	public ModelAndView signInPost(
			ModelAndView mav,
			LoginDTO dto) throws Exception{
		// 로그인 처리
		UserVO vo = us.signIn(dto);
		mav.addObject("userInfo",vo);
		mav.addObject("loginDTO",dto);
		System.out.println("controller : " + mav.getModel().get("userInfo"));
		System.out.println("controller : " + mav.getModel().get("loginDTO"));
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	@PostMapping("/signUpPost")
	public String signUpPost(
			UserVO vo,
			RedirectAttributes rttr) throws Exception{
		// 회원 가입 처리
		us.signUp(vo);
		rttr.addFlashAttribute("message","회원가입 성공");
		return "redirect:/";
	}
	
	@GetMapping("/signOut")
	public String signOut(
			HttpSession session,
			HttpServletResponse response,
			@SessionAttribute(name="userInfo",required = false) UserVO vo,
			@CookieValue(name="signInCookie", required = false)Cookie signInCookie
			) throws Exception{
			System.out.println(vo);
			if(vo != null) {
				//session.removeAttribute("userInfo");
				session.invalidate();
			}
			
			if(signInCookie != null) {
				System.out.println("cookie name : "+signInCookie.getName());
				System.out.println("cookie value : "+signInCookie.getValue());
				signInCookie.setPath("/");
				signInCookie.setMaxAge(0);
				response.addCookie(signInCookie);
			}
		
		return "redirect:/";
	}
	@GetMapping("/ModifyMember")
	public String ModifyMember(UserVO vo,Model model) throws Exception{
		
		model.addAttribute("userInfo",us.modify(vo));
		
		
		return "user/ModifyMember";
	}
	
	//업데이터
	@PostMapping("/ModifyMember")
	public String ModifyMemberPost(UserVO vo, RedirectAttributes rttr) throws Exception{
		
		
		us.modify(vo);
		System.out.println("값이 ??");
		return "redirect:/user/signOut";
	}
	
}







