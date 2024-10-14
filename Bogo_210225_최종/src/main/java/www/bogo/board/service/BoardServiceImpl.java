package www.bogo.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.util.PageMaker;
import net.koreate.util.SearchCriteria;
import www.bogo.board.dao.BoardDAO;
import www.bogo.board.vo.BoardVO;
import www.bogo.comment.dao.CommentDAO;


//게시판 서비스 제공..
@Service

public class BoardServiceImpl implements BoardService{
	
	@Inject
	BoardDAO dao;
	
	@Inject
	CommentDAO cDao;
	
	
	@Override
	@Transactional
	public void regist(BoardVO board) throws Exception {
		// 원본글 삽입 
		dao.regist(board);
		// origin update
		dao.updateOrigin();
		
		List<String> file = board.getFile();
		if(file == null) {
			return;
		}
		for(String fullName : file) {
			// table 삽입
			dao.addAttach(fullName);
		}
	}

	
// page 페이징용 criteria 
	
	@Override
	public List<BoardVO> listReplyCriteria(SearchCriteria cri) throws Exception {
		List<BoardVO> list = dao.listCriteria(cri);
		return list;
	}
	

// page 정보 제공 pageMaker	
	@Override
	public PageMaker getPageMaker(SearchCriteria cri) throws Exception {
		int totalCount = dao.listReplyCount(cri);
		PageMaker pm = new PageMaker(cri,totalCount);
		return pm;
	}

	
// Map 형태의 게시판 값 가져오기 list	
	@Override
	public Map<String, Object> getListModel(SearchCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("list", listReplyCriteria(cri));
		map.put("pm", getPageMaker(cri));
		return map;
	}
	
//댓글 읽기
	
	@Override
	public BoardVO readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}
//댓글 갱신하기
	
	@Override
	public void updateCnt(int bno) throws Exception {
		dao.updateCnt(bno);
		
	}

//게시판 댓글 정보
	
	@Override
	@Transactional
	public void replyRegister(BoardVO vo) throws Exception {
		
		dao.updateReply(vo);
		
		vo.setDepth(vo.getDepth()+1);
		vo.setSeq(vo.getSeq()+1);
		System.out.println("등록될 답변글 정보 : " + vo);
		
		dao.replyRegist(vo);
		
	}
// 게시판 수정.
	
	@Override
	public void modify(BoardVO vo) throws Exception {
		dao.modify(vo);
		
		dao.removeAttach(vo.getBno());
		
		List<String> fileList = vo.getFile();
		if(fileList == null || fileList.isEmpty()) {
			return;
		}
		
		for(String fullName : fileList) {
			dao.replaceAttach(vo.getBno(),fullName);	
		}
	}

// 게시판 삭제 관련.
	
	@Override
	@Transactional
	public void remove(int bno) throws Exception {
		// 첨부파일 삭제
		dao.removeAttach(bno);
		
		// 댓글 삭제
		cDao.deleteComment(bno);
		
		// 게시물 삭제 showboard = 'N'
		dao.remove(bno);
	}

//게시판 번호 리스트값 가져오기	
	
	@Override
	public List<String> getAttach(int bno) throws Exception {
		return dao.getAttach(bno);
	}

}
