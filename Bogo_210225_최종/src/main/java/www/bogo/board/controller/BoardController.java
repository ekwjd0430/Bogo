package www.bogo.board.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.util.SearchCriteria;
import www.bogo.board.service.BoardService;
import www.bogo.board.vo.BoardVO;


//게시판 컨트롤러 


@Controller
@RequestMapping("/board")
public class BoardController {
	
	
	
// 게시판 boardService
	@Inject
	BoardService bs;
	
	
// 게시판 등록
	@GetMapping("/register")
	public String register() {
		return "board/register";
	}
	
//게시판 등록
    @PostMapping("/register")
	public String register(
			BoardVO vo) throws Exception{
		// 삽입 처리
		bs.regist(vo);
		return "redirect:/board/listReply";
	}


// list page 로 반환 시켜주는 list reply
	
    @GetMapping("/listReply")
    public String listReply(
			@ModelAttribute("cri") SearchCriteria cri, //searchCriteria
			Model model) throws Exception{
		
		Map<String,Object> models = bs.getListModel(cri);
		model.addAllAttributes(models);
		
		return "board/listPage"; //listPage 로 반환.
	}

// 게시판 상세 정보 보기. (읽기)


   @GetMapping("/readPage")
	 public String readPage(
			SearchCriteria cri, //searchCriteria 페이지 값  pageMaker .
			int bno,
			RedirectAttributes rttr) throws Exception{
		bs.updateCnt(bno);
		
		rttr.addAttribute("bno",bno);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/board/read";
	}
   
   
// 게시판 상세 정보 보기 (읽기) 
	
	@GetMapping("/read")
	public String readPage(
			@ModelAttribute("cri") SearchCriteria cri,//searchCriteria 페이지 값  pageMaker .
			int bno,
			Model model)throws Exception{
		model.addAttribute("board",bs.readReply(bno));
		return "board/readPage";
	}
	
	
	
// 게시판 답글 달기 
	
	
	@GetMapping("/replyRegister")
	public String replyRegister(
			int bno,
			@ModelAttribute("cri") SearchCriteria cri,//searchCriteria 페이지 값  pageMaker .
			Model model) throws Exception{
		model.addAttribute("board",bs.readReply(bno));
		return "board/replyRegister";
	}
	
	
// 게시판 답글 달기 	
	
	@PostMapping("/replyRegister")
	public String replyRegister(
			BoardVO vo,
			@ModelAttribute("cri") SearchCriteria cri,
			Model model,
			RedirectAttributes rttr) throws Exception{
		
// 답글 작성 완료
		System.out.println(vo);
		System.out.println(cri);
		bs.replyRegister(vo);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/board/listReply";
	}
	
	

// 게시글 수정
	      @GetMapping("/modifyPage")
	         public String modifyPage(
			 int bno,
		  @ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception{
		
		model.addAttribute("board",bs.readReply(bno));
		
		return"board/modifyPage";
	}
	      
	      
// 게시글 수정 	      
	
			@PostMapping("/modifyPage")
			public String modifyPage(
					BoardVO vo,
					@ModelAttribute("cri") SearchCriteria cri,
					RedirectAttributes rttr
					)throws Exception{
				
				
//  수정
		bs.modify(vo);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addAttribute("bno",vo.getBno());
		return "redirect:/board/read";
	}
	
			
			
// 게시글 삭제			
	@PostMapping("/remove")
	public String remove(
			int bno,
			@ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rttr
			)throws Exception{
		
// 삭제 처리
		bs.remove(bno);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/board/listReply";
	}
	
// 게시물 번호에 따라 리스트 첨부파일 목록 가져오기  

	@GetMapping("getAttach/{bno}")
	@ResponseBody
	public List<String> getAttach(
			@PathVariable("bno") int bno
			) throws Exception{
		System.out.println(bno);
		return bs.getAttach(bno);
	}
	
	
	
}
















