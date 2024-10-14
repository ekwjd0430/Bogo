package www.bogo.common.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface TaskTestDAO {
	
	@Select("SELECT fullName FROM tbl_attach "
			+ "WHERE DATE_FORMAT(regdate,'%Y-%m-%d') "
			+ " = "
			+ " DATE_FORMAT(date_sub(now(), interval 1 day) , '%Y-%m-%d')")
	List<String> getTrashAttach() throws Exception;
	
	@Select("SELECT DATE_FORMAT(date_sub(now() , interval 1 day), '/%Y/%m/%d/')")
	String getPath()throws Exception;

}
