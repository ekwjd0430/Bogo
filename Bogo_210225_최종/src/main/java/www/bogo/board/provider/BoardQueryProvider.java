package www.bogo.board.provider;

import org.apache.ibatis.jdbc.SQL;

import net.koreate.util.SearchCriteria;



	

// 게시판 정보 제공용 프로바이더 
    public class BoardQueryProvider {
	
	     public String searchSelectSQL(SearchCriteria cri) {
	    	 
		    System.out.println("searchSelectSQL 호출");
		/*
		//  Test 
		SQL sql = new SQL();
		//sql.SELECT("title,content,writer")
		sql.SELECT("*");
		sql.FROM("re_tbl_board");
		sql.WHERE("title LIKE CONCAT('%','','%')");
		sql.OR();
		sql.WHERE("content LIKE CONCAT('%','','%')");
		sql.ORDER_BY("bno DESC");
		sql.LIMIT(cri.getPageStart()+","+cri.getPerPageNum());
		String query = sql.toString(); 
		System.out.println(query);
		*/
		    
// 		    
  SQL sql = new SQL() {
			{
				SELECT("*");
				FROM("re_tbl_board");
				
				setSearchWhere(cri, this);
				
				ORDER_BY("origin DESC, seq ASC");  //seq 답변글 아랫 정렬
				
				LIMIT(cri.getPageStart()+","+cri.getPerPageNum());
			}
		};
		
		
		String query = sql.toString();
		System.out.println(query);
		return query;
	}
	     
	
// 조회수 계산 .	
	public String searchListCount(SearchCriteria cri) {
		/*
		SQL sql1 = new SQL();
		sql1.SELECT("count(*)");
		sql1.FROM("re_tbl_board");
		setSearchWhere(cri, sql1);
		String query = sql1.toString();
		*/
		
		return new SQL() {
			{
				SELECT("count(*)");
				FROM("re_tbl_board");
				setSearchWhere(cri, this);
			}
		}.toString();
	}
	
//게시판 검색을 위해 검색바 정렬.	
	public void setSearchWhere(SearchCriteria cri, SQL sql) {
		if(cri.getSearchType() != null) {
			String titleQuery = "title LIKE CONCAT('%','"+cri.getKeyword()+"','%')";
			String contentQuery = "content LIKE CONCAT('%','"+cri.getKeyword()+"','%')";
			String writerQuery = "writer LIKE CONCAT('%','"+cri.getKeyword()+"','%')";
			
			switch(cri.getSearchType()) {
				case "t" :
					sql.WHERE(titleQuery);
					break;
				case "c" :
					sql.WHERE(contentQuery);
					break;
				case "w" :
					sql.WHERE(writerQuery);
					break;
				case "tc" :
					sql.WHERE(titleQuery).OR().WHERE(contentQuery);
					break;
				case "cw" :
					sql.WHERE(writerQuery).OR().WHERE(contentQuery);
					break;
				case "tcw" :
					sql.WHERE(titleQuery).OR().WHERE(writerQuery).OR().WHERE(contentQuery);
					break;
			}
			
			
		}
	}
	

}






