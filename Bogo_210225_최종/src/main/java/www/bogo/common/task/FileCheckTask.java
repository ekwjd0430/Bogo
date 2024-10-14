package www.bogo.common.task;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import www.bogo.common.dao.TaskTestDAO;
import www.bogo.common.util.FileUtils;

@Component
public class FileCheckTask {
	
	@Inject
	TaskTestDAO dao;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@Inject
	ServletContext context;
	
	/*
	 * 초(seconds) 0 ~ 59
	 * 분(minutes) 0 ~ 59
	 * 시(hours)   0 ~ 23
	 * 일(Day-of-month) 1 ~ 31
	 * 달(Month) 1 ~ 12(JAN ~ DEC)
	 * 요일(Day - of - week) 1 ~ 7 SUN ~ SAT
	 * 년도(years)(optional) 1970 ~ 2099
	 */
	/*
	@Scheduled(cron="* * * * * * ")
	public void testEvery() throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		String now = sdf.format(new Date());
		System.out.println("cron=\"* * * * * *\" now : " + now);
	}
	*/
	
	// 매분 0초
	/*
	@Scheduled(cron="0 * * * * *")
	public void testMinute() throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		String now = sdf.format(new Date());
		System.out.println("cron=\"0 * * * * *\" now : " + now);
	}
	*/
	
	// 매일 09:30:00 에 실행
	@Scheduled(cron="0 30 9 * * *")
	public void testSecond() throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		String now = sdf.format(new Date());
		List<String> fileList = dao.getTrashAttach();
		System.out.println("fileList : " + fileList);
		String path = dao.getPath();
		System.out.println("path : " + path);
		uploadPath = context.getRealPath(File.separator+uploadPath);
		FileUtils.getInstance(uploadPath).removeList(fileList,path);
		System.out.println("cron=\"0 30 9 * * *\" now : " + now);
	}
	
}









