<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML>
<html>
<link href="${path}/resources/css/common/common.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/boardmanu/manu_listPage.css" rel="stylesheet" type="text/css"/>
<head>
<jsp:include page="../logo/logo.jsp" /><!-- 파비콘 -->
<title>Bogo - 게시판</title>
</head>
<body>
<jsp:include page="../include/header.jsp" /><!-- 헤더manu_listPage.css -->

<main class="board-manu">
	<div class="board-div">	
		<h1>게시판</h1>
	<div class="bored-search">
		
		<select name="searchType">
			<option value="n">------------------</option>
			<option value="t">제목</option>
			<option value="c">내용</option>
			<option value="w">작성자</option>
			<option value="tc">제목 &amp;&amp; 내용</option>
			<option value="cw">내용 &amp;&amp; 작성자</option>
			<option value="tcw">제목 &amp;&amp; 내용 &amp;&amp; 작성자</option>
		</select>
		<input type="text" name="keyword" id="keyword"/>
		<input type="button" id="searchBtn" value="SEARCH"/>
		
		<c:if test="${!empty userInfo}">
			<a href="register">작성하기</a>
		</c:if>
	</div>
	
	
	
	<br/>
	<table class="Tboard">
		<tr>
			<th>번호</th><!-- BNO -->
			<th>제목</th><!-- TITLE -->
			<th>작성자</th><!-- WRITER -->
			<th>작성날짜</th><!-- UPDATEDATE -->
			<th>읽은사람</th><!-- VIEWCNT -->
		</tr>
		<!-- 게시글 목록 ${list} -->
		<!-- 목록 출력 -->
		<c:choose>
			<c:when test="${!empty list}">
				<c:forEach var="board" items="${list}">
					<c:choose>
						<c:when test="${board.showboard eq 'Y'}">
							<tr>
								<td>${board.bno}</td>
								<td>
									<a href="readPage${pm.makeQuery(cri.page)}&bno=${board.bno}" class="board-list">
										<c:if test="${board.depth != 0}">
										<c:forEach var="i" begin="1" end="${board.depth}">
											&nbsp;&nbsp;&nbsp;&nbsp;
										</c:forEach>
										└> <!-- ㅂ + 한자 + 6 -->
										</c:if>
										<c:out value="${board.title}"/>
									</a>
								</td>
								<td><c:out value="${board.writer}"/></td>
								<td><f:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.updatedate}"/></td>
								<td>${board.viewcnt}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td></td>
								<td>삭제된 게시물 입니다.</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">등록된 게시물이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
		<!-- paging block -->
		<div class="paging-list">
		<c:if test="${pm.prev}" >
			<a href="listReply${pm.makeQuery(pm.startPage-1)}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
			<a href="listReply${pm.makeQuery(i)}">${i}</a>
		</c:forEach>
		<c:if test="${pm.next}">
			<a href="listReply${pm.makeQuery(pm.endPage+1)}">다음</a>
		</c:if>
		</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$("#searchBtn").click(function(){
			var searchType = $("select option:selected").val();	
			var keyword = $("#keyword").val();
			location.href="listReply?searchType="+searchType+"&keyword="+keyword;
		});
	</script>
	</div>
</main>
	
<jsp:include page="../include/footer.jsp" /><!-- 헤더 -->	
	
</body>
</html>






