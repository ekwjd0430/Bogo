package www.bogo.user.dao;

import org.apache.ibatis.annotations.Insert;

import www.bogo.user.vo.MemberVO;

public interface MemberDAO {

	// 회원가입
	@Insert("INSERT INTO MemberVO(id,name,pw,email,tel,signup_date,modify_date) "
			+ "VALUES(#{id},#{name},#{pw},#{email},#{tel},#{signup_date},#{modify_date}) ")
	public void register(MemberVO vo) throws Exception;
}
