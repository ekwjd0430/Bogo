<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML>
<html>
<link href="${path}/resources/css/common/common.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/boardmanu/manu_reply.css" rel="stylesheet" type="text/css"/>
<head>
<jsp:include page="../logo/logo.jsp" /><!-- 파비콘 -->
<title>Bogo - 게시판(원글 수정)</title>
</head>
<body>
<jsp:include page="../include/header.jsp" /><!-- 헤더menu_listPage.css -->
<main id="home">

	<form action="replyRegister" method="post">
		<h3>reply</h3>
		<table  class="replytable">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" class="reply_text" required/>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="writer" value="${userInfo.uname}" class="reply_text" readonly/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" cols="50" rows="30" class="reply_textarea" >
					</textarea>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="submit" value="작성완료" class="styleBtn"/>
				</td>
			</tr> 
		</table>
		<input type="hidden" name="uno" value="${userInfo.uno}"/>
		<!-- 원본글 정보 -->
		<input type="hidden" name="origin" value="${board.origin}"/>
		<input type="hidden" name="depth" value="${board.depth}"/>
		<input type="hidden" name="seq" value="${board.seq}"/>
		<!-- 검색 페이지 리스트 정보 -->
		<input type="hidden" name="page" value="${cri.page}"/>
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
		<input type="hidden" name="searchType" value="${cri.searchType}"/>
		<input type="hidden" name="keyword" value="${cri.keyword}"/>
	</form>

</main>
<jsp:include page="../include/footer.jsp" /><!--푸터 -->	
</body>
</html>