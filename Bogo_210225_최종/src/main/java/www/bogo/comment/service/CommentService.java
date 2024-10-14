package www.bogo.comment.service;

import java.util.Map;

import www.bogo.comment.vo.CommentVO;

public interface CommentService {
	
	// 댓글 삽입
	void addComment(CommentVO vo)throws Exception;
	
	// 댓글 수정
	void modComment(CommentVO vo)throws Exception;
	
	// 댓글 삭제
	void removeComment(int cno)throws Exception;
	
	// 댓글 리스트
	Map<String,Object> listPage(int bno, int page)throws Exception;
	
}






