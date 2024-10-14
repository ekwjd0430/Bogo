<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="path" value = "${pageContext.request.contextPath}" />
<link href="${path}/resources/css/common/common.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/include/header.css" rel="stylesheet" type="text/css"/>   
<script>
	//login 보이기
	function loginBtn(){
		document.getElementById("login-form").style.display ='block';
		document.getElementById("login-background").style.display ='block';
	}
	function logincloseBtn(){
		document.getElementById("login-form").style.display = 'none';
		document.getElementById("login-background").style.display ='none';
	}
	
</script>
<header>
           <div id="logo">
                <a href="${path}/">
                <img src="${path}/resources/img/logo/BogoLogo2.png" width="100%" height="100%">
            	</a>
            </div>
            <div id="head_1">
            <ul id="nav">
                <li><a href="${path}/final/lecturelist">강의목록</a>
                    <ul>
                        <li id="sub-manu"><a href="${path}/final/lecture_c">c언어</a></li>
                        <li id="sub-manu"><a href="${path}/final/lecture_cpp">c++ 언어</a></li>
                        <li id="sub-manu"><a href="${path}/final/lecture_c_shap">C #</a></li>
                        <li id="sub-manu"><a href="${path}/final/lecture_java">java</a></li>
                    </ul>
                </li>
                <li>
                    <a href="${path}/final/offline">오프라인</a>
                    <ul>
                       <!--  <li id="sub-manu">Bogo 소개<a href="#"></a></li> -->
                    </ul>
                </li>
                <li>
                    <a href="board/listReply">게시판</a>
                    <ul>
                        <!-- <li id="sub-manu">게시판<a href="#">3-1</a></li> -->
                    </ul>
                </li>
                
                <li>
                    <a href="${path}/final/notice">공지사항</a>
                    <ul>
                       <!--  <li id="sub-manu"><a href="#">공지사항</a></li> -->
                    </ul>
                </li>
                
                
            </ul>
            
            
            
   <c:choose>
		<c:when test="${!empty sessionScope.userInfo}">
			<label><a href="user/signOut">signOut</a></label>
			<label><a href="user/userInfo" style="color:blue;">${userInfo.uname} 님</a></label>
		</c:when>
	<c:otherwise>
		
           		 <label><a href="${path}/user/signUp">회원가입</a></label>
                <%-- <label><a href="${css_path}/user/login">로그인</a></label> --%>
                <label>
               	<!--  <form></form> -->
                <a onclick="loginBtn()">로그인</a>
                </label>
	</c:otherwise>
</c:choose>
            
            
            
            
                
                
                
        </div>
    </header>
	<jsp:include page="../user/signIn.jsp" /><!-- 푸터 -->

    