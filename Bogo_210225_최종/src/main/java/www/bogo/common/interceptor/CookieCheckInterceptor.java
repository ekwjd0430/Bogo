package www.bogo.common.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import www.bogo.user.service.UserService;
import www.bogo.user.vo.UserVO;

public class CookieCheckInterceptor extends HandlerInterceptorAdapter{
	
	@Inject
	UserService us;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("userInfo") != null) {
			System.out.println("사용자 정보 존재");
			return true;
		}
		// signInCookie
		Cookie cookie = WebUtils.getCookie(request, "signInCookie");
		
		if(cookie != null) {
			// ID
			UserVO uv = us.getUserById(cookie.getValue());
			if(uv != null) {
				session.setAttribute("userInfo", uv);
			}
		}
		return true;
	}
	
}



