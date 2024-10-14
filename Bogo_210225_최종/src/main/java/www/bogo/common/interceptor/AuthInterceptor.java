package www.bogo.common.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import www.bogo.board.service.BoardService;
import www.bogo.board.vo.BoardVO;
import www.bogo.user.vo.UserVO;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Inject
	BoardService bs;
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("AuthInterceptor prehandle START");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("userInfo");
		String contextPath = request.getContextPath();
		
		if(obj == null) {
			System.out.println("사용자 정보가 없음");
			response.sendRedirect(contextPath+"/user/signIn");
			return false;
		}else {
			if(request.getRequestURI().equals(contextPath+"/board/register")) {
				System.out.println("새글 작성");
				return true;
			}
			
			String num = request.getParameter("bno");
			
			if(num != null && !num.equals("")) {
				int bno = Integer.parseInt(num);
				
				if(request.getRequestURI().equals(contextPath+"/board/replyRegister")) {
					System.out.println("답글 작성");
					return true;
				}
				
				BoardVO vo = bs.readReply(bno);
				UserVO userInfo = (UserVO)obj;
				
				System.out.println("수정 삭제 요청 시");
				if(userInfo.getUno() == vo.getUno()) {
					System.out.println("권한 있는 사용자");
					return true;
				}else {
					response.sendRedirect(contextPath+"/board/read?bno="+bno);
					return false;
				}
			}
		}
		
		
		
		
		
		System.out.println("AuthInterceptor prehandle END");
		return true;
	}
	
	

}
