package www.bogo.common.controller;

import java.sql.SQLException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ControllerAdviceException {
	
	@ExceptionHandler(Exception.class)
	private ModelAndView errorModelAndView(Exception e) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/error_common");
		mav.addObject("exception",e);
		System.out.println(e.getMessage());
		return mav;
	}
	
	
	@ExceptionHandler(NullPointerException.class)
	private ModelAndView nullExceptionHandler(Exception e) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/error_common");
		mav.addObject("exception",e);
		System.out.println(e.getMessage());
		return mav;
	}
	
	@ExceptionHandler(SQLException.class)
	private ModelAndView sqlExceptionHandler(Exception e) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/error_common");
		mav.addObject("exception",e);
		System.out.println(e.getMessage());
		return mav;
	}
	
	
}
