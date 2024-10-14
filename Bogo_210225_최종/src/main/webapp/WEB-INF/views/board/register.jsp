<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML>
<html>
<link href="${path}/resources/css/common/common.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/boardmanu/manu_register.css" rel="stylesheet" type="text/css"/>
<head>
<jsp:include page="../logo/logo.jsp" /><!-- 파비콘 -->
<title>Bogo - 게시판 글쓰기</title>
</head>
<body>
<jsp:include page="../include/header.jsp" /><!-- 헤더menu_listPage.css -->
<main class="home">
	<h1>게시판 글쓰기</h1>
	<hr/>
	<!-- /board/register -->
	<form id="regForm" action="register" method="post">
		<table>
			<tr>
				<td>제목</td>
			</tr>
			<tr>
				<td >
					<input type="text" name="title" class="reg_text" required/>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				
			</tr>
			<tr>
				<td >
					<input type="text" name="writer" value="${userInfo.uname}" class="reg_text"  readonly/>
				</td>
			</tr>
			<tr>
				<td>내용</td>
			</tr>
			<tr>
				<td>
					<textarea name="content" cols="50" rows="30" class="reg_textarea"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan=2 >
					
				</td>
			</tr> 
		</table>
		<input type="hidden" name="uno" value="${userInfo.uno}"/>
		<br/>
		<div>
			<h3>파일을 올리면 첨부됩니다.</h3>
			<div class="fileDrop">
			
			</div>		
		</div>
		<input type="button" id="saveBtn" value="작성완료"/>
		<div class="uploadList">
		
		</div>
		
	</form>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}";</script>
	<script src="${pageContext.request.contextPath}/resources/js/file.js"></script>
	<script>
	
		
	
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
							html+= "<a href='"+fileInfo.getLink+"' target='_blank'>"+fileInfo.fileName+"</a>";
							html+= "</div>";
							html+= "<div>";
							html+= "<a href='"+fileInfo.fullName+"' class='delBtn'>X</a>";
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
		
		$(".uploadList").on("click",".delBtn",function(event){
			event.preventDefault();
			var target = $(this);
			
			$.ajax({
				type : "POST",
				url : contextPath+"/deleteFile",
				data : {
					fileName : target.attr("href")
				},
				success : function(data){
					console.log(data);
					// 가장 가까운 선택자 형태의 조상을 찾음
					target.closest("li").remove();
				}
			});
			
		});
		
		
		$("#saveBtn").click(function(){
			
			var str = "";
			var fileList = $(".uploadList .delBtn");
			
			$(fileList).each(function(index){
				var fullName = $(this).attr("href");
				str += "<input type='hidden' name='file["+index+"]' value='"+fullName+"' /> ";
			});
			
			$("#regForm").append(str);
			$("#regForm").submit();
		});
	</script>
</main>
	
<jsp:include page="../include/footer.jsp" /><!-- 헤더 -->	
	
</body>
</html>












