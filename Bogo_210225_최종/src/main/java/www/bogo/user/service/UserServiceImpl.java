package www.bogo.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import www.bogo.user.dao.UserDAO;
import www.bogo.user.vo.LoginDTO;
import www.bogo.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	UserDAO dao;

	@Override
	public void signUp(UserVO vo) throws Exception {
		dao.signUp(vo);
	}

	@Override
	public UserVO signIn(LoginDTO dto) throws Exception {
		return dao.signIn(dto);
	}

	@Override
	public UserVO getUserById(String uid) throws Exception {
		return dao.getUserById(uid);
	}

	@Override
	public int modify(UserVO vo) throws Exception {
		return dao.modify(vo);
	}


}
