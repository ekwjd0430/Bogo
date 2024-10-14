<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/common/common.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/user/signUp.css" rel="stylesheet" type="text/css"/>
<head>
  <jsp:include page="../logo/logo.jsp" /><!-- 파비콘 -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <title>Bogo-회원가입</title>
  <meta charset="utf-8">
</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
	/* 	 	$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
			})  */
		
			$("#siginUpBtn").on("click", function(){
				console.log($("#userpw").val());
				console.log($("#userpwok").val());
		
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#userpw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userpw").focus();
					return false;
				}
				if($("#userpw").val() !== $("#userpwok").val()){
					alert("비밀번호가 일치 하지 않습니다.");
					$("#userpw").focus();
					return false;
				}
				
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				if($("#email").val()==""){
					alert("email을 입력해주세요");
					$("#email").focus();
					return false;
				}
				if($("#tel").val()==""){
					alert("번호를 입력해주세요");
					$("#tel").focus();
					return false;
				}
			
			});
			
				
			
		})
	</script>
<body>
	<jsp:include page="../include/header.jsp" /><!-- 헤더 -->
    <div class="wrap wd668">
        <div class="container">
            <div class="form_txtInput">
            <form action="signUpPost" method="post">
                <h2 class="sub_tit_txt">회원가입</h2><br/>
                <p class="exTxt">회원 가입을 위해 *항목은 입력해야합니다</p>
                 
                <div class="join_form">
                   
                    <table>
                        <colgroup>
                            <col width="30%" />
                            <col width="auto" />
                        </colgroup>
                        
                        <tbody>

                            <tr>
                                <th><span>아이디</span></th>
                                <td><input type="text" placeholder="ID를 입력하세요." id="userId" name="uid" ></td>
                            </tr>
                           
                            <tr>
                                <th><span>비밀번호</span></th>
                                <td><input type="text" placeholder="비밀번호를 입력해주세요." id="userpw" name="upw"></td>
                            </tr>
                            <tr>
                                <th><span>비밀번호 확인</span></th>
                                <td><input type="text" placeholder="비밀번호를 확인하세요" id="userpwok" name="repw" /></td>
                            </tr>
                             <tr>
                                <th><span>이름</span></th>
                                <td><input type="text" placeholder="이름을 입력하세요" id="userName" name="uname" /></td>
                            </tr>
                            <tr>
                                <th><span>휴대폰 번호</span></th>
                                <td><input type="text" placeholder="번호를 입력하세요." id="tel" name="utell" /></td>
                            </tr>
                            <tr class="email">
                                <th><span>이메일</span></th>
                                
                                <td>
                                    <input type="text" class="email" id="email" name="uemail"/><span class="mar10">@</span>
                                    <input type="text" class="email email2" />
                                  <!--   <a href="javascript:;" class="btn_confirm" id="userId">인증번호 발송</a> -->
                                </td>
                            </tr>
                       <!--      <tr>
                                <th><span>인증번호 확인</span></th>
                                <td><input type="text" class="send_number" placeholder="10:00">
                                	<a href="javascript:;" class="btn_confirm">인증번호 발송</a>
                                </td>
                            </tr> -->
                       
                        </tbody>
                    </table>
                   
                    <div class="exform_txt"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span></div>
                </div><!-- join_form E  -->
                <div class="agree_wrap">
                    <div class="checkbox_wrap">
                        <input type="checkbox" id="news_letter" name="news_letter" class="agree_chk">
                        <label for="news_letter">[선택]뉴스레터 수신동의</label>
                    </div>
                    <div class="checkbox_wrap mar27">
                        <input type="checkbox" id="marketing" name="marketing" class="agree_chk">
                        <label for="marketing">[선택]마케팅 목적 개인정보 수집 및 이용에 대한 동의</label>
                        <ul class="explan_txt">
                            <li><span class="red_txt">항목 : 성별, 생년월일</span></li>
                            <li>고객님께서는 위의 개인정보 및 회원정보 수정 등을 통해 추가로 수집하는 개인정보에<br />
                             		   대해 동의하지 않거나 개인정보를 기재하지 않음으로써 거부하실 수 있습니다.<br />
                       				         다만 이때 회원 대상 서비스가 제한될 수 있습니다.
                            </li>
                        </ul>
                        <font color="red">${message}</font><br>
                    </div>
                </div>
                <div class="btn_wrap">
                
                	<!-- <button type="" id="loginBtn"> 취소</button> -->
                    <button type="submit" id="siginUpBtn">회원가입 완료</button>
                </div>
                </form>
            </div> <!-- form_txtInput E -->
        </div><!-- content E-->
    </div> <!-- container E -->
    <jsp:include page="../include/footer.jsp" /><!-- 푸터 -->
</body>
</html>


