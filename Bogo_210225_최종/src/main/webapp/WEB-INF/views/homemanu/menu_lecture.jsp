<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/main/main.css" rel="stylesheet" type="text/css"/>

  <!-- manu1 페이지 -->
  <main id="home">
        <div id="all-contents">
           <div id="contents">
				<a href="${path}/final/lecture_c"><img src="../resources/img/lecture/c_img.png"/></a>
            </div>
             <div id="contents">
				<a href="${path}/final/lecture_cpp"><img src="../resources/img/lecture/cpp_img.png"/></a>
            </div>
            <div id="contents">
            	<a href="${path}/final/lecture_c_shap"><img src="../resources/img/lecture/c_shap.png"/></a>
            </div>
            <div id="contents">
				<a href="${path}/final/lecture_java"><img src="../resources/img/lecture/java.png"/></a>
            </div>

            <div id="contents">
            </div>
            
            <div id="contents">
            </div>
        </div>
    </main>