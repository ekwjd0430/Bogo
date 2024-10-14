<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/main/home.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/manu/manu_myinfo.css" rel="stylesheet" type="text/css"/>

  <!-- 보고 소개 페이지 -->
  <c:choose>
	<c:when test="${!empty sessionScope.userInfo}">
	  <main id="home">
  		<p>나의 정보</p>
      </main>	
  
    </c:when>
    		<c:otherwise>
    			<main id="home">
			  		<p>회원만 이용가능한 페이지 입니다.</p>			      
			    </main>	
			</c:otherwise>
    </c:choose>