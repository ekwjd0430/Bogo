package www.bogo.comment.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentVO {
	
	private int cno;
	private int bno;
	private String ctext;
	private String cauth;
	private Date regdate;
	private Date updatedate;
	private int uno;

}
