package www.bogo.user.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import net.koreate.util.SearchCriteria;
import www.bogo.board.service.BoardService;

@Controller
@RequestMapping("/final")
public class FinalController {
		
	
	//강의목록
	@GetMapping("/lecturelist")
	public String lecturelist() {
		return "final/lecturelist";
	}
	// header - offline
	@GetMapping("/offline")
	public String offline() {
		return "final/offline";
	}
	
//	 강의 controller
	
	@GetMapping("/lecture_c")
	public String lecture_c() {
		return "final/lecture_c";
	}
	@GetMapping("/lecture_c_shap")
	public String lecture_c_shap() {
		return "final/lecture_c_shap";
	}
	@GetMapping("/lecture_java")
	public String lecture_java() {
		return "final/lecture_java";
	}
	@GetMapping("/lecture_cpp")//c++
	public String lecture_cpp() {
		return "final/lecture_cpp";
	}
	@GetMapping("/lecture_making")
	public String lecture_making() {
		return "final/lecture_making";
	}
	
	//footer - 채용안내
	@GetMapping("/recruit")
	public String recruit() {
	    return "final/recruit";
	}
	
	// offline
	@GetMapping("/offline1")
	public String offline1() {
		return "final/offline1";
	}
	
	// offline
	@GetMapping("/offline2")
	public String offline2() {
	return "final/offline2";
	}
	// offline
	@GetMapping("/offline3")
	public String offline3() {
		return "final/offline3";
	}
	// offline
	@GetMapping("/offline4")
	public String offline4() {
		return "final/offline4";
	}


	//header- 공지사항
	@GetMapping("/notice")
	public String notice() {
		return "final/notice";
	}

	//footer - 보고소개 
	@GetMapping("/bogoinform")
	public String bogoinform() {
		return "final/bogoinform";
	}
	//footer - 자주하는 질문
	@GetMapping("/alwaysQnA")
	public String alwaysQnA(){
		return "final/alwaysQnA";
	}
	//footer -이용약관
	@GetMapping("/sell")
	public String sell() {
		return "final/sell";
	}
	//footer -개인 정보 약관
	@GetMapping("/personalpolicy")
	public String personalpolicy() {
		return "final/personalpolicy";
	}
	//footer - 문의 하기
	@GetMapping("/question")
	public String question(){
		return "final/question";
	}
	
	//footer - 개발자에게 이메일 보내기
	@GetMapping("/email_send")
	public String email_send() {
		return "final/email_send";
	}
}
