<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/include/section.css" rel="stylesheet" type="text/css"/>
   <section id="manubar">
      		<ul>
      		<c:choose>
				<c:when test="${!empty sessionScope.userInfo}">
					<li><a href="#">장바구니</a></li>
					<li><a href="#">나의 강의 목록</a></li>
					<li><a href="user/userInfo">개인 회원정보수정</a></li>
				</c:when>
				<c:otherwise>
			</c:otherwise>
		</c:choose>
		</ul>
    </section>