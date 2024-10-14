package www.bogo.common.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * 파일 처리 
 */
public class FileUtils {
	
	String uploadPath;
	
	private static FileUtils utils;
	
	private FileUtils() {};
	
	private FileUtils(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	public static FileUtils getInstance(String uploadPath) {
		if(utils  == null) {
			utils = new FileUtils(uploadPath);
		}
		return utils;
	}
	
	public List<String> uploadFile(MultipartFile[] files) throws IOException{
		List<String> fileList = new ArrayList<>();
		for(MultipartFile file : files) {
			try {
				String fileName = uploadFile(file);
				fileList.add(fileName);
			}catch( Exception e) {
				e.printStackTrace();
				throw new IOException("업로드 할 수 없는 파일이 포함되어 있습니다.");
			}
		}
		return fileList;
	}
	
	public String uploadFile(MultipartFile file) throws IOException{
		String uploadFolder = getFolder();
		System.out.println("uploadFolder : " + uploadFolder);
		String originalName = file.getOriginalFilename();
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString().replace("-", "")+"_"+originalName;
		
		File uploadFileFolder = new File(uploadPath,uploadFolder);
		if(!uploadFileFolder.exists()) {
			uploadFileFolder.mkdirs();
		}
		
		File upload = new File(uploadPath+File.separator+uploadFolder,savedName);
		
		byte[] bytes = file.getBytes();
		
		FileCopyUtils.copy(bytes, upload);
		
		
		return makeFileUploadName(uploadFolder,savedName);
	}
	
	public String makeFileUploadName(
			String uploadFolder,
			String savedName) throws IOException {
		
		String ext = savedName.substring(savedName.lastIndexOf(".")+1);
		
		String uploadName 
			= uploadPath+File.separator+uploadFolder+File.separator+savedName;	
		
		if(MediaUtils.getMediaType(ext) != null) {
			System.out.println("IMAGE FILE");
			
			File file = new File(uploadPath+File.separator+uploadFolder,savedName);
			BufferedImage originImage =	ImageIO.read(file);
			
			BufferedImage sourceImage = Scalr.resize(
					originImage, 
					Scalr.Method.AUTOMATIC,
					Scalr.Mode.FIT_TO_HEIGHT, 100);
			uploadName
			= uploadPath+File.separator+uploadFolder+File.separator+"s_"+savedName;
			file = new File(uploadName);
			ImageIO.write(sourceImage, ext, file);
		}
		uploadName = uploadName.substring(uploadPath.length())
					.replace(File.separatorChar,'/');	
		return uploadName;
	}
	
	
	public String getFolder() {
		//  2021/02/10
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(new Date());
		System.out.println(str);
		return str.replace("-", File.separator);
	}
	
	public String deleteFile(String fileName){
		String ext = fileName.substring(fileName.lastIndexOf(".")+1);
		if(MediaUtils.getMediaType(ext) != null) {
			String name = fileName.replace("s_","");
			new File(uploadPath+(name).replace('/', File.separatorChar)).delete();
		}
		new File(uploadPath+(fileName).replace('/', File.separatorChar)).delete();
		return "DELETED";
	}
	

	public String deleteAllFiles(List<String> files)throws Exception{
		for(String file : files) {
			deleteFile(file);
		}
		return "DELETED";
	}
	
	public void removeList(List<String> list, String path)throws Exception{
		System.out.println("removeList path : " + path);
		String realPath = path.replace('/', File.separatorChar);
		System.out.println("realPath : " + realPath);
		System.out.println(uploadPath);
		File file = new File(uploadPath,realPath);
		System.out.println(file.getPath());
		System.out.println(file.getAbsolutePath());
		System.out.println(file.listFiles());
		
		List<String> removeList = new ArrayList<>();
		
		if(file.exists()) {
			System.out.println("폴더 존재");
			List<File> files = Arrays.asList(file.listFiles());
			for(File f : files) {
				System.out.println(f.getName());
				String removeFilePath = path+f.getName();
				String thumnail = path+"s_"+f.getName();
				
				if(!list.contains(removeFilePath) && !list.contains(thumnail)) {
					removeList.add(removeFilePath);
				}
			}
			
			System.out.println(removeList);
			
			if(!removeList.isEmpty()) {
				System.out.println(deleteAllFiles(removeList));
			}
		}else {
			System.out.println("폴더 없음");
		}
		
		
	}
	
}





