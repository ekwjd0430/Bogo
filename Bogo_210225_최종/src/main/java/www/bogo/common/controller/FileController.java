package www.bogo.common.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import www.bogo.common.util.FileUtils;

@RestController
public class FileController {
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@Autowired
	ServletContext context;
	
	@PostConstruct
	public void initController() {
		uploadPath = context.getRealPath(File.separator+uploadPath);
		File file = new File(uploadPath);
		if(!file.exists()) {
			file.mkdirs();
		}
	}
	
	@PostMapping("uploadFile")
	public ResponseEntity<Object> uploadFile(
			@RequestParam("file") MultipartFile[] file){
		ResponseEntity<Object> entity = null;
		for(MultipartFile f : file) {
			System.out.println(f.getOriginalFilename());
		}
		try {
			FileUtils utils = FileUtils.getInstance(uploadPath);
			List<String> fileList = utils.uploadFile(file);
			entity = new ResponseEntity<>(fileList, HttpStatus.CREATED);
		} catch (IOException e) {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type","text/plain;charset=utf-8");
			entity = new ResponseEntity<>(
					e.getMessage(),
					header,
					HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PostMapping("deleteFile")
	public ResponseEntity<String> deleteFile(
			String fileName
			)throws IOException{
		ResponseEntity<String> entity = null;
		String result = FileUtils.getInstance(fileName).deleteFile(fileName);
		entity = new ResponseEntity<>(result,HttpStatus.OK);
		return entity;
	}
	
	
	@PostMapping("deleteAllFiles")
	public ResponseEntity<String> deleteAllFiles(
			@RequestParam("files[]") List<String> files
			)throws Exception{
		ResponseEntity<String> entity = null;
		
		System.out.println("deleteAllFiles : "+files);
		entity = new ResponseEntity<>(
				FileUtils.getInstance(uploadPath).deleteAllFiles(files),
				HttpStatus.OK);
		return entity;
	}
	
	
	
	
}
