package www.bogo.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import net.koreate.util.SearchCriteria;
import www.bogo.board.provider.BoardQueryProvider;
import www.bogo.board.vo.BoardVO;

public interface BoardDAO {
	
// 원본글 삽입
	@Insert("INSERT INTO re_tbl_board(title,content,writer,uno) "
			+ "VALUES(#{title}, #{content}, #{writer}, #{uno})")
	void regist(BoardVO vo)throws Exception;
	
// 원본글 origin column 수정
	@Update("UPDATE re_tbl_board SET origin = LAST_INSERT_ID() "
			+ " WHERE bno = LAST_INSERT_ID()")
	void updateOrigin()throws Exception;
	
// 검색 형  답변 게시물  목록
	@SelectProvider(type=BoardQueryProvider.class, method="searchSelectSQL")
	List<BoardVO> listCriteria(SearchCriteria cri)throws Exception;
	
// 검색된 게시물의 전체 개수
	@SelectProvider(type=BoardQueryProvider.class, method="searchListCount")
	int listReplyCount(SearchCriteria cri)throws Exception;
	
// 게시물 상세보기
	@Select("SELECT * FROM re_tbl_board WHERE bno = #{bno}")
	BoardVO readReply(int bno) throws Exception;
	
// 조회수 증가
	@Update("UPDATE re_tbl_board SET viewcnt = viewcnt + 1 WHERE bno = #{bno}")
	void updateCnt(int bno) throws Exception;
	
// 기존 게시물의 정렬값 수정
	@Update(" UPDATE re_tbl_board SET seq = seq + 1 "
			+ "WHERE origin = #{origin} AND seq > #{seq}")
	void updateReply(BoardVO vo)throws Exception;
	
// 답변글 등록
	@Insert("INSERT INTO re_tbl_board(title,content,writer,origin,depth,seq,uno) "
		+ " VALUES(#{title},#{content},#{writer},#{origin},#{depth},#{seq},#{uno})")
	void replyRegist(BoardVO vo) throws Exception;
	
// 게시글 수정
	@Update("UPDATE re_tbl_board SET "
			+ " title = #{title} , "
			+ " content = #{content} , "
			+ " writer = #{writer} , "
			+ " updatedate = now() "
			+ " WHERE bno = #{bno}")
	void modify(BoardVO vo)throws Exception;
	
// 게시글 삭제 showboard = 'N'
	@Update("UPDATE re_tbl_board SET showboard = 'N' WHERE bno = #{bno}")
	void remove(int bno) throws Exception;

// 첨부파일 정보 삽입
	@Insert("INSERT INTO tbl_attach(fullName,bno)"
			+ " VALUES(#{fullName},LAST_INSERT_ID())")
	void addAttach(String fullName);

// 첨부 파일 목록
	@Select("SELECT fullName FROM tbl_attach WHERE bno = #{bno}")
	List<String> getAttach(int bno) throws Exception;

// 첨부파일 목록 삭제
	@Delete("DELETE FROM tbl_attach WHERE bno = #{bno}")
	void removeAttach(int bno)throws Exception;

// 첨부파일 수정
	@Insert("INSERT INTO tbl_attach(bno,fullName) VALUES(#{bno},#{fullName})")
	void replaceAttach(@Param("bno") int bno, @Param("fullName") String fullName) throws Exception;
	

}                                                                                                                                                                                                                                                                                                                       



