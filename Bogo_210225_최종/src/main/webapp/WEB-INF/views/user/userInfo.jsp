<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/common/common.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/user/userinfo.css" rel="stylesheet" type="text/css"/>
<head>
  <jsp:include page="../logo/logo.jsp" /><!-- 파비콘 -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <title> Bogo - 개인정보 수정</title>
  <meta charset="utf-8">
</head>
<body>
	<jsp:include page="../include/header.jsp" /><!-- 헤더 -->
	<main id="home">
	<div class="userinfo">
	<form id="modifyForm" action="ModifyMember" method="post">
                <h2 class="sub_tit_txt">개인 정보 수정 </h2><br/>
                <p class="exTxt" style="color:red;">* id는 수정 할수없습니다.</p>
                 
                <div class="join_form">
                   	<input type="submit" id="modifyBtn" value="수정완료" 
                   	style="float:right;width: 100px;height: 35px; background-color: lightblue;"/>
                    <table>
                        <colgroup>
                            <col width="30%" />
                            <col width="auto" />
                        </colgroup>

                            <tr>
                                <th><span>아이디</span></th>
                                <td><input type="text" name="uid"  value="${userInfo.uid}" readonly/></td>
                            </tr>
                            <tr>
                                <th><span>비밀번호</span></th>
                                <td><input type="text" name="upw"  value="${userInfo.upw}" /></td>
                            </tr>
                             <tr>
                                <th><span>이름</span></th>
                                <td><input type="text" name="uname" value="${userInfo.uname}" /></td>
                            </tr>
                            <tr>
                                <th><span>휴대폰 번호</span></th>
                                <td><input type="text" name="utell" value="${userInfo.utell}" /></td>
                            </tr>
                            <tr>
                                <th><span>이메일</span></th>
                                <td><input type="text" name="uemail" value="${userInfo.uemail}" /></td>
                            </tr>
                    </table>
                </div><!-- join_form E  -->
            </form>
		</div>
	</main>	
	<jsp:include page="../include/footer.jsp" /><!-- 푸터 -->
</body>
</html>
