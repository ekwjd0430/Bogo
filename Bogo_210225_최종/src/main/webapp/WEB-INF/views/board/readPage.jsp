<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML>
<html>
<link href="${path}/resources/css/common/common.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/boardmanu/manu_readpage.css" rel="stylesheet" type="text/css"/>
<head>
<jsp:include page="../logo/logo.jsp" /><!-- 파비콘 -->
<title>Bogo - 게시판</title>
</head>
<body>
<jsp:include page="../include/header.jsp" /><!-- 헤더menu_listPage.css -->
<main id="home">
	
	<h3>&nbsp;&nbsp;&nbsp;${board.title}</h3>
	<table class="readtable">
		<tr>
			<td>제목</td>
			<td><c:out value="${board.title}"/></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><c:out value="${board.writer}"/></td>
		</tr>
		
		<tr>
			<td>내용</td>
			<td>
				<pre style="font-size:13px; resize:none; height:200px;">
					<%-- <c:out value="${board.content}"/> --%>
					${board.content}
				</pre>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<div>
					<ul class="uploadList"></ul>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="border:0px;">
				<c:if test="${!empty userInfo}">
					<c:if test="${userInfo.uno eq board.uno}">
						<!-- 작성 게시자와 로그인한 사용자가 같을때 -->
						<input type="button" id="modifyBtn" value="MODIFY" class="styleBtn"/>
						<input type="button" id="removeBtn" value="REMOVE" class="styleBtn"/>
					</c:if>
					<!-- 로그인 완료한 사용자 -->
					<input type="button" id="replyBtn" value="REPLY" class="styleBtn"/>
				</c:if>
				<!-- 전체 사용자 -->
				<input type="button" id="listBtn" value="LIST" class="styleBtn"/>
			</td>		
		</tr>
	</table>
	<form id="readForm">
		<input type="hidden" name="bno" value="${board.bno}"/>
		<input type="hidden" name="page" value="${cri.page}"/>
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
		<input type="hidden" name="searchType" value="${cri.searchType}"/>
		<input type="hidden" name="keyword" value="${cri.keyword}"/>
		<input type="hidden" name="csrf_token" value="${csrf_token}"/>
	</form>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}";</script>
	<script src="${pageContext.request.contextPath}/resources/js/file.js"></script>
	
	<%@ include file="/WEB-INF/views/comment/comment.jsp" %>
	
	<script>
		var obj = $("#readForm");
		
		$("#listBtn").click(function(){
			obj.attr("action","listReply").submit();
		});
		
		$("#replyBtn").click(function(){
			obj.attr("action","replyRegister").submit();
		});
		
		$("#modifyBtn").click(function(){
			obj.attr("action","modifyPage").submit();
		});
		
		$("#removeBtn").click(function(){
			if(confirm("정말로 진짜로 삭제하시겠습니까? :( ")){
				var arr = [];
				$(".uploadList li").each(function(){
					arr.push($(this).attr("data-src"));
				});
				console.log("-----------------------");
				console.log(arr);
				
				if(arr.length > 0){
					$.post(contextPath+"/deleteAllFiles",{files:arr},function(result){
						alert(result);
					});
				}
				
				obj.attr("action","remove");
				obj.attr("method","post");
				obj.submit();	
			}else{
				alert("삭제요청이 취소되었습니다.");
			}
		});
			
		var bno = ${board.bno};
		
		$.getJSON("getAttach/"+bno,function(data){
			console.log("확인");
			console.log(data);
			var target = $(".uploadList");
			if(data.length <= 0){
				target.closest("tr").remove();
			}else{
				$(data).each(function(){
					var fileInfo = getFileInfo(this);
					console.log(fileInfo);
					
					var html =  "<li data-src='"+fileInfo.fullName+"'>";
						html += "<img src='"+fileInfo.imgSrc+"'/>";
						html += "<div>";
						html += "<a href='"+fileInfo.getLink+"' download='"+fileInfo.fileName+"'>";
						html += fileInfo.fileName;
						html += "</a>";
						html += "</div>";
						html += "</li>";
					$(target).append(html);
				});
			}
		});
	</script>
	
</main>
<jsp:include page="../include/footer.jsp" /><!--푸터 -->	
</body>
</html>