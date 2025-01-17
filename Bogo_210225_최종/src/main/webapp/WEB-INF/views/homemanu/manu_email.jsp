<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%-- <link href="${path}/resources/css/main/home.css" rel="stylesheet" type="text/css"/> --%>
<link href="${path}/resources/css/manu/manu_email.css" rel="stylesheet" type="text/css"/>
<!-- 개발자에게 이메일 보내기 페이지 -->
<main id="home">
	<div id="email_page">
	<!-- 	<p>개발자 이메일 보내기 페이지</p> -->
		
		<!-- <a href="final/email_send">이메일 발송</a> -->
		
		<h2>개발자에게 이메일 보내기</h2><br/>
		<p style="color:red;margin-left:120px;"> * 아래의 칸을 모두 작성하지 않으면 개발자에게 이메일 발송이되지 않을 수 있습니다.</p>
		<form id="mail-container" method="post" action="send.do"> 
		<!-- post방식으로 자료를 컨트롤러로 보냄 -->
		
			<div id="mail-tbl">
				<div id="btn-container">
					<input id="mail-btn" type="submit" value="보내기">
				</div>
				<div class="mail-input-div">
					<input class="mail-input" type="text" name="senderName" placeholder="보내는 사람"/>
				</div>
				<div class="mail-input-div" style="display:none;">
					<input class="mail-input" type="email" name="senderMail" placeholder="보내는 사람 이메일"/><!-- 보내는 사람이 root-context에 지정 되어있음 -->
				</div>
				<div class="mail-input-div" style="display:none;"><!-- 받는 사람이 개발자 -->
					<input class="mail-input" type="email" name="receiveMail"  value="ineti0430@gmail.com" placeholder="받는 사람"/>
				</div>
				<div class="mail-input-div">
					<input class="mail-input" type="text" name="subject" placeholder="보내는 사람 이메일"/>
				</div>
				<div class="mail-txtarea-div">
					<textarea class="mail-txtarea" rows="15" cols="80" name="message" placeholder="내용을 입력하세요"></textarea>
				</div>
			</div>
			<%-- <span style="color:red;">${message}</span> --%>
		</form>
	</div>
</main>