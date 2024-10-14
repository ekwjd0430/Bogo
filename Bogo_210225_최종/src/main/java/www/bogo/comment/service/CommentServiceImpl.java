package www.bogo.comment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.util.Criteria;
import net.koreate.util.PageMaker;
import www.bogo.comment.dao.CommentDAO;
import www.bogo.comment.vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	CommentDAO dao;
	
	@Override
	public void addComment(CommentVO vo) throws Exception {
		dao.addComment(vo);
	}

	@Override
	public void modComment(CommentVO vo) throws Exception {
		dao.modifyComment(vo);
	}

	@Override
	public void removeComment(int cno) throws Exception {
		dao.removeComment(cno);
	}

	@Override
	public Map<String, Object> listPage(int bno, int page) throws Exception {
		
		Criteria cri = new Criteria();
		cri.setPage(page);
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		// 게시물 전체 개수
		int totalCount = dao.totalCount(bno);
		pm.setTotalCount(totalCount);
		
		List<CommentVO> list = dao.listPage(bno,cri);
		
		Map<String,Object> map = new HashMap<>();
		map.put("pm", pm);
		map.put("list", list);
		return map;
	}

}








