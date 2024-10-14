package www.bogo.comment.controller;

import javax.inject.Inject;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import www.bogo.comment.service.CommentService;
import www.bogo.comment.vo.CommentVO;



@RestController
@RequestMapping("/comments")
public class CommentController {
	
	@Inject
	CommentService cs;
	
	// contextPath+"/comments/add"
	@PostMapping("/add")
	public ResponseEntity<String> addComment(
			@RequestBody CommentVO vo
			)throws Exception{
		ResponseEntity<String> entity = null;
		System.out.println(vo);
		try {
			cs.addComment(vo);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 게시물 리스트
	@GetMapping("/{bno}/{page}")
	public ResponseEntity<Object> listPage(
			@PathVariable("bno") int bno,
			@PathVariable("page") int page){
		ResponseEntity<Object> entity = null;
		try {
			entity = new ResponseEntity<>(
							cs.listPage(bno, page),
							HttpStatus.OK
						); 
		} catch (Exception e) {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", "text/plain;charset=utf-8");
			entity = new ResponseEntity<>(
					e.getMessage(),
					header,
					HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return entity;
	}
	
	@PatchMapping(value="/mod", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> modComment(
			@RequestBody CommentVO vo){
		ResponseEntity<String> entity = null;
		try {
			cs.modComment(vo);
			entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@DeleteMapping(value="/remove/{cno}",produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> delete(
			@PathVariable("cno") int cno
			){
		ResponseEntity<String> entity = null;
		
		try {
			cs.removeComment(cno);
			entity = new ResponseEntity<>("삭제 완료",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	

}









