package www.bogo.user.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String name;
	private String pw;
	private String email;
	private String tel;
	private Date signup_date; //회원가입날짜
	private Date modify_date; //최근수정 날짜
	
}
