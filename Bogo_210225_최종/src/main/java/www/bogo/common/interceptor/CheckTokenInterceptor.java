package www.bogo.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class CheckTokenInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		System.out.println("인증 토큰 확인");
		
		if(request.getMethod().equals("POST")) {
			HttpSession session = request.getSession();
			String sessionToken = (String)session.getAttribute("csrf_token");
			System.out.println("session token : " + sessionToken);
			String requestToken = request.getParameter("csrf_token");
			System.out.println("request token : " + requestToken);
			
			if(requestToken == null || 
				 requestToken == "" || 
				!requestToken.equals(sessionToken)) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('올바른 접근이 아닙니다.');");
				out.print("history.go(-1);");
				out.print("</script>");
				return false;
			}
		}
		
		return true;
	}
	
	

}
