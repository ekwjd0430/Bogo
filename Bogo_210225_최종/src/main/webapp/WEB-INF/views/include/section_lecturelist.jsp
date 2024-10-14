<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/include/section.css" rel="stylesheet" type="text/css"/>
   <section id="manubar">
      	<ul>
			<li><a href="${path}/final/lecture_c">c 프로그래밍</a></li>
			<li><a href="${path}/final/lecture_cpp">c++ 프로그래밍</a></li>
			<li><a href="${path}/final/lecture_c_shap">c# 프로그래밍</a></li>
			<li><a href="${path}/final/lecture_java">java 프로그래밍</a></li>
		</ul>
    </section>