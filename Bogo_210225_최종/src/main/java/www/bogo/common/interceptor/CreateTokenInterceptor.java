package www.bogo.common.interceptor;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CreateTokenInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String token = UUID.randomUUID().toString();
		System.out.println("상세보기 페이지 요청 : " + token);		
		session.setAttribute("csrf_token", token);
		return true;
	}
	
	

}
