<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML>
<html>
<link href="${path}/resources/css/common/common.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/boardmanu/manu_modifypage.css" rel="stylesheet" type="text/css"/>
<head>
<jsp:include page="../logo/logo.jsp" /><!-- 파비콘 -->
<title>Bogo - 게시판 글쓰기</title>
</head>
<body>
<jsp:include page="../include/header.jsp" /><!-- 헤더menu_listPage.css -->
<main class="home">
	<h2>수정 - ${board.title}</h2>
	<hr/>
	<!-- /board/register -->
	<form id="modifyForm" action="modifyPage" method="post">
		<table>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" value="${board.title}" class="modify_text" required/>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="writer" value="${userInfo.uname}" class="modify_text" readonly/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" cols="50" rows="30" class="modify_textarea">${board.content}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="button" id="modifyBtn" value="수정완료"/>
				</td>
			</tr> 
		</table>
		<input type="hidden" name="bno" value="${board.bno}"/>
		<input type="hidden" name="page" value="${cri.page}"/>
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
		<input type="hidden" name="searchType" value="${cri.searchType}"/>
		<input type="hidden" name="keyword" value="${cri.keyword}"/>
		
		<br/>
		<div>
			<h3>파일을 올리면 첨부됩니다.</h3>
			<div class="fileDrop">
			
			</div>		
		</div>
		<div class="uploadList">
		
		</div>
		
	</form>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}";</script>
	<script src="${pageContext.request.contextPath}/resources/js/file.js"></script>
	<script>
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
					html += "</a>&nbsp;&nbsp;&nbsp;";
					html += "<a href='"+fileInfo.fullName+"' class='delBtn'>[삭제]</a>";
					html += "</div>";
					html += "</li>";
				$(target).append(html);
			});
		}
	});
	
	$(".fileDrop").on("dragEnter dragover", function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		// 1024 * 1024 1Mb *10 = 10Mb
		var maxSize = 10485760;
		
		var formData = new FormData();
		
		for(var i=0; i < files.length; i++){
			if(files[i].size > maxSize){
				alert("업로드 할 수 없는 파일이 포함되어있습니다. size : " + files[i].size);
				return;
			}
			formData.append("file",files[i]);
		}
		
		$.ajax({
			type : "POST",
			data : formData,
			dataType : "json",
			url : contextPath+"/uploadFile",
			contentType : false,
			processData : false,
			success : function(data){
				console.log(data);
				
				for(var i=0; i<data.length; i++){
					var fileInfo = getFileInfo(data[i]);
					console.log(fileInfo);
					var html = "<li>";
						html+= "<img src='"+fileInfo.imgSrc+"'/>"
						html+= "<div>";
						html+= fileInfo.fileName;
						html+= "&nbsp;&nbsp;&nbsp;<a href='"+fileInfo.fullName+"' class='delBtn'>[삭제]</a>";
						html+= "</div>";
						html+= "</li>";
					$(".uploadList").append(html);
				}
			},
			error : function(res){
				alert(res.responseText);
			}
		});
	});
	
	var arr = [];
	
	$(".uploadList").on("click",".delBtn",function(event){
		event.preventDefault();
		
		var fileLink = $(this).attr("href");
		
		arr.push(fileLink);
		
		$(this).closest("li").remove();
		
	});
	
	$("#modifyBtn").click(function(){
		var str = "";
		
		var fileList = $(".uploadList .delBtn");
		
		$(fileList).each(function(index){
			var obj = $(this);
			str +="<input type='hidden' name='file["+index+"]' value='"+obj.attr("href")+"' />";
		});
		
		$("#modifyForm").append(str);
		
		$.post(contextPath+"/deleteAllFiles",{files:arr},function(result){
			alert(result);
		});
		
		$("#modifyForm").submit();
	});
	
	
	</script>
	</main>
</body>
</html>














