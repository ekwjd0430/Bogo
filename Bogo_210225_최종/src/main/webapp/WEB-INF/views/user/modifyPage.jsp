<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyPage.jsp</title>
<style>

</style>
</head>
<body>
	
	<h1><a href="${pageContext.request.contextPath}">HOME</a></h1>
	<h3>회원 정 보 - ${userInfo.uname}</h3>
	<!-- /board/register -->
	<form id="modifyForm" action="modifyPage" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="title" value="${userInfo.uid}" required/>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="writer" value="${userInfo.uname}" />
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="text" name="writer"  value= "${userInfo.upw}"   >
				</td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="button" id="modifyBtn" value="수정완료"/>
				</td>
			</tr> 
		</table>
		</form>
		<input type="hidden" name="bno" value="${board.bno}"/>
		<input type="hidden" name="page" value="${cri.page}"/>
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
		<input type="hidden" name="searchType" value="${cri.searchType}"/>
		<input type="hidden" name="keyword" value="${cri.keyword}"/>
		</body>
</html>

		
		