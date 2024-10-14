package www.bogo.common.session;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import www.bogo.user.vo.UserVO;

/*
 * javax.servlet.http.HttpSessionListener
 * Session 생성과  삭제(destroy) 감지 후 정보 제공
 * 
 * HttpSessionAttributeListener
 * session의 속성값(attribute)의 변경 감지 후 정보 제공
 */
//@Component
public class MySessionEventListener 
						implements HttpSessionListener, 
						HttpSessionAttributeListener{
	
	private static MySessionEventListener listener = null;
	
	public static Hashtable<String,Object> sessionRepository;
	
	public MySessionEventListener() {
		System.out.println("MySessionEventListener() 생성");
		if(sessionRepository == null) {
			sessionRepository = new Hashtable<>();
		}
		listener = this;
	}
	
	public static MySessionEventListener getInstance(){
		System.out.println("getInstance 호출");
		if(listener == null) {
			listener = new MySessionEventListener();
		}
		return listener;
	}
	
	public static boolean expireDuplicatedSession(String uid, String sessionid) {
		boolean result = false;
		
		System.out.println("Active Session Count : "+sessionRepository.size());
		
		Enumeration<Object> enumeration = sessionRepository.elements();
		System.out.printf("session id : %s , uid : %s %n",sessionid,uid);
		while(enumeration.hasMoreElements()) {
			HttpSession session = (HttpSession)enumeration.nextElement();
			UserVO user = (UserVO)session.getAttribute("userInfo");
			if(user != null && user.getUid().equals(uid)) {
				if(!session.getId().equals(sessionid)) {
					session.invalidate();
					return true;
				}
			}
		}
		return result;
	}
	
	
	
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		System.out.println("attributeAdded 호출");
		System.out.printf("SESSION ID : %s %n", event.getSession().getId());
		System.out.printf("attribute add name : %s  attr : %s %n", event.getName(), event.getValue());
		
		if(event.getName().equals("userInfo")) {
			HttpSession session = event.getSession();
			synchronized (sessionRepository) {
				System.out.println("session regist : " + session.getId());
				sessionRepository.put(session.getId(),session);
			}
		}
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.printf("생성 SESSION ID %s %n",se.getSession().getId());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		String id = se.getSession().getId();
		System.out.printf("삭제 SESSION ID %s %n",id);
		System.out.println("sessionRepository remove : " + id);
		sessionRepository.remove(id);
	}
}




