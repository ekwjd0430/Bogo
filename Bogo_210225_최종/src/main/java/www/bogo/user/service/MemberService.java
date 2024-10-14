package www.bogo.user.service;

import www.bogo.user.vo.MemberVO;

public interface MemberService {
	
	//회원가입
	public void register(MemberVO vo) throws Exception;
}
