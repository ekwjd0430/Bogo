package www.bogo.user.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import www.bogo.user.vo.LoginDTO;
import www.bogo.user.vo.UserVO;

public interface UserDAO {
	
	// 회원 추가 
	@Insert("INSERT INTO tbl_user(uid,upw,uname,uemail,utell) VALUES(#{uid},#{upw},#{uname},#{uemail},#{utell})")
	void signUp(UserVO vo)throws Exception;
	//로그인
	@Select("SELECT * FROM tbl_user WHERE uid = #{uid} AND upw = #{upw}")
	UserVO signIn(LoginDTO dto)throws Exception;
	//아이디값 가져오기
	@Select("SELECT * FROM tbl_user WHERE uid = #{uid}")
	UserVO getUserById(String uid)throws Exception;
	
	
	//회원 정보 수정 
	@Update("UPDATE tbl_user SET "
			+ " uname = #{uname} ,"
			+ " upw = #{upw} , "
			+ " uemail = #{uemail} , "
			+ " utell = #{utell} "
			+ " WHERE uid= #{uid} "
			)
	int modify(UserVO vo)throws Exception;																																						

}



