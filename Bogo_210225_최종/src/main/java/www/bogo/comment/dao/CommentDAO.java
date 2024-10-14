package www.bogo.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import net.koreate.util.Criteria;
import www.bogo.comment.vo.CommentVO;

public interface CommentDAO {
	
	// 댓글 삽입
	@Insert("INSERT INTO tbl_comment(bno, cText, cAuth, uno ) "
			+ "VALUES(#{bno},#{ctext},#{cauth},#{uno})")
	void addComment(CommentVO vo)throws Exception;
	
	// 해당 게시물의 전체 댓글 개수
	@Select("SELECT count(*) FROM tbl_comment WHERE bno = #{bno}")
	int totalCount(int bno) throws Exception;

	// 해당 게시물의 페이징 처리된 리스트 항목
	@Select("SELECT * FROM tbl_comment WHERE bno = #{bno} ORDER BY cno DESC "
			+ " limit #{cri.pageStart}, #{cri.perPageNum}")
	List<CommentVO> listPage(@Param("bno") int bno, @Param("cri") Criteria cri);

	// 댓글 수정
	@Update("UPDATE tbl_comment SET "
			+ " cText = #{ctext} ,"
			+ " updatedate = now() "
			+ " WHERE cno = #{cno}")
	void modifyComment(CommentVO vo)throws Exception;

	// 단일 댓글 삭제
	@Delete("DELETE FROM tbl_comment WHERE cno = #{cno}")
	void removeComment(int cno) throws Exception;

	// 게시물 삭제 시 해당 글의 댓글 전체삭제
	@Delete("DELETE FROM tbl_comment WHERE bno = #{bno}")
	void deleteComment(int bno) throws Exception;
	
}




