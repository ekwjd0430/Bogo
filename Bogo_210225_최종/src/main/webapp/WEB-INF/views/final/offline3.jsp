<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html>
<link href="${path}/resources/css/common/common.css" rel="stylesheet" type="text/css"/> 
<!-- <link href="resources/css/include/header.css" rel="stylesheet" type="text/css"/>  -->
<!--  <link href="resources/css/include/section.css" rel="stylesheet" type="text/css"/>--> 
<!-- <link href="resources/css/main/jq.rolling.css" rel="stylesheet" type="text/css"/>  -->
<!-- <link href="resources/css/main/home.css" rel="stylesheet" type="text/css"/>  -->
<!-- <link href="resources/css/include/footer.css" rel="stylesheet" type="text/css"/>  -->

<head>
<jsp:include page="../logo/logo.jsp" /><!-- 파비콘 -->
    <title>Bogo</title>
</head>


<body>
	<jsp:include page="../include/header.jsp" /><!-- 헤더 -->
	 <jsp:include page="../include/offlinesection.jsp" /><!-- 메뉴바 -->
 	<jsp:include page="../homemanu/manu_offline3.jsp" /><!-- 공지사항 메인 -->
 	
	<jsp:include page="../include/footer.jsp" /><!-- 푸터 -->
</body>
</html>

