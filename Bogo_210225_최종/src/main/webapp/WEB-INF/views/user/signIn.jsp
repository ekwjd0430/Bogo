<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/user/login.css" rel="stylesheet" type="text/css"/>   

 		<div id="login-background"></div>
    	<div id="login-form">
      		<div>
      			<input type="button" value="X" id="exit-btn" onclick="logincloseBtn()">
      		</div>
	    	<form action="user/signInPost" method="post">
	      		<img src="${path}/resources/img/logo/BogoLogo.png"/>
	      		<input type="text" name="uid" placeholder="USER ID"
					required class="text-field" >
	      		<input type="password"  name="upw" class="text-field" placeholder="비밀번호">
	      		<input type="submit" value="SignIn" id="submit-btn">
	      		<br/>
	      		<label> 
	      			<input type="checkbox" name="userCookie" /> 로그인 정보 저장
				</label>
	        	<hr/>
	        	
	    	</form>
	      	<div class="diflogin-form">
	       		<input type="submit" value="Google 로그인" id="another-btn" >
	       		<input type="submit" value="GITHUB 로그인" id="another-btn">
	       		<input type="submit" value="NAVER 로그인" id="another-btn">
	      	</div> 
	    	<div id="links">
	      		<a href="#">비밀번호를 잊어버리셨나요?</a>
	        </div>
     	</div>
        <script>
		var message = '${message}';
		if(message != null && message != ''){
			alert(message);
		}
	   </script>