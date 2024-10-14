package www.bogo.user.service;


import www.bogo.user.vo.LoginDTO;
import www.bogo.user.vo.UserVO;

public interface UserService {
	
	// 회원가입
	void signUp(UserVO vo)throws Exception;
	
	// 로그인
	UserVO signIn(LoginDTO dto) throws Exception;
	
	// 아이디 정보로 사용자 정보 확인
	UserVO getUserById(String uid)throws Exception;
	
	// 유저 정보 수정 .
	int modify(UserVO vo) throws Exception;

}