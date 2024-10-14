package www.bogo.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import www.bogo.user.dao.MemberDAO;
import www.bogo.user.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}

}
