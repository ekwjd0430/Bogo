package www.bogo.user.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import www.bogo.user.vo.MemberVO;

@Repository//dao에필요한 자바빈 머시기
public class MemberDAOImpl implements MemberDAO {

	@Inject SqlSession sql;
	
	
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("memberMapper.register", vo);
	}

}
