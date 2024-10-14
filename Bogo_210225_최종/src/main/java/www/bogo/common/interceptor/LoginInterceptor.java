package www.bogo.common.interceptor;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import www.bogo.common.session.MySessionEventListener;
import www.bogo.user.dao.BanIPDAO;
import www.bogo.user.vo.BanIPVO;
import www.bogo.user.vo.LoginDTO;
import www.bogo.user.vo.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Inject
	BanIPDAO dao;
	
	/*
	@Inject
	MySessionEventListener listener;
	*/
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("userInfo") != null) {
			session.removeAttribute("userInfo");
		}
		
		String ip = getIP(request);
		System.out.println("request IP : " + ip);
		
		BanIPVO banVO = dao.getBanIPVO(ip);
		if(banVO != null && banVO.getCnt() >= 5) {
			System.out.println("ban ip");
			long saveTime = getTime(banVO.getBandate());
			if(saveTime > 0) {
				RequestDispatcher rd = request.getRequestDispatcher("/user/signIn");
				request.setAttribute("message", "일정 시간동안 로그인 할 수 없습니다.");
				request.setAttribute("time",saveTime);
				rd.forward(request, response);
				return false;
			}else {
				System.out.println("제한시간 초기화");
				dao.removeBanIP(ip);
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler,
			ModelAndView mav) throws Exception {
		
		LoginDTO dto = (LoginDTO)mav.getModel().get("loginDTO");
		UserVO vo = (UserVO)mav.getModel().get("userInfo");
		
		System.out.println("LoginInterceptor : " + dto);
		System.out.println("LoginInterceptor : " + vo);
		
		String ip = getIP(request);
		
		BanIPVO banIP = dao.getBanIPVO(ip);

		if(vo != null) {
			
			HttpSession session = request.getSession();
			
			/*
			 * 중복 로그인 처리
			 */
			boolean result 
			= MySessionEventListener
			 .expireDuplicatedSession(dto.getUid(), session.getId());
			if(result) {
				System.out.println("중복 제거");
			}else {
				System.out.println("첫 로그인");
			}
			
			session.setAttribute("userInfo", vo);
			
			if(dto.isUserCookie()) {
				Cookie cookie = new Cookie("signInCookie",vo.getUid());
				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 24 * 15);
				response.addCookie(cookie);
			}
			if(banIP != null) {
				System.out.println("로그인 성공 ban ip 삭제");
				dao.removeBanIP(ip);
			}
		}else {
			
			int count = 5;
			
			if(banIP == null) {
				System.out.println("최초 실패");
				dao.signInFail(ip);
				count = count - 1;
			}else {
				System.out.println("중복 실패 : " + banIP);
				dao.updateBanIPCnt(ip);
				count = count-(banIP.getCnt()+1);
			}
			String message = "";
			
			if(count > 0) {
				message = "회원 정보가 일치하지 않습니다. 뒤로 가기 해주세요"
						+ "남은 시도 횟수: "+count;
			}else {
				message = "너무 많은 시도... 30분동안 IP가 차단됩니다.";
			}
			mav.getModel().remove("userInfo");
			mav.getModel().remove("loginDTO");
			mav.addObject("message",message);
			mav.setViewName("/user/signIn");
		}
	}

	public String getIP(HttpServletRequest request) {
		String ip = request.getHeader("X-forwarded-for");
		System.out.println("X-forwarded-for : " + ip);
		if(ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
			System.out.println("Proxy-Client-IP : " + ip);
		}
		if(ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP");
			System.out.println("WL-Proxy-Client-IP : " + ip);
		}
		if(ip == null) {
			ip = request.getHeader("HTTP-X-FORWARDED-FOR");
			System.out.println("HTTP-X-FORWARDED-FOR : " + ip);
		}
		if(ip == null){
			ip = request.getRemoteAddr();
			System.out.println("REMOTE ip : " + ip);
		}
		return ip;
	}
	
	public long getTime(Date bandate) {
		int limit = 1*1*1;//1000*60*30;
		return limit-(System.currentTimeMillis() - bandate.getTime());
	}
	
	
	
}
