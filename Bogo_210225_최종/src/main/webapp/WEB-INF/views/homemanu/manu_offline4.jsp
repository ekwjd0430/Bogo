<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/main/main.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/manu/manu_offline.css" rel="stylesheet" type="text/css"/>
  <!-- 오프라인 페이지 -->
  <main id="home">

      
<!--
	* 카카오맵 - 약도서비스
	* 한 페이지 내에 약도를 2개 이상 넣을 경우에는
	* 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.
-->
<!-- 1. 약도 노드 -->
<div id="kakao-map-api">
<div id="daumRoughmapContainer1613371868464" class="root_daum_roughmap root_daum_roughmap_landing"></div>
</div>
<!-- 2. 설치 스크립트 -->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1613371868464",
		"key" : "24fby",
		"mapWidth" : "640",
		"mapHeight" : "360"
	}).render();
</script>
      
      
    </main>