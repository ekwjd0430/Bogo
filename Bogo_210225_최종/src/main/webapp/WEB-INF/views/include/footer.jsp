<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="path" value = "${pageContext.request.contextPath}" />
<link href="${path}/resources/css/include/footer.css" rel="stylesheet" type="text/css"/> 
<footer id="footer-design">
        <div id="ft-div1">
            <div id="ft-Bogo">
                <h4 id="ft-title">Bogo</h4>
                <ul>
                    <li><a href="${path}/final/bogoinform">Bogo 소개</a></li>
                    <li><a href="${path}/final/recruit">채용안내</a></li><!-- 이력서 폼:사람인  -->
                    <%-- <li><a href="${path}/final/question">문의하기</a></li> --%>

                </ul>
            </div>
            <div id="ft-info">
                <h4 id="ft-title">고객센터</h4>
                <ul>
                    <li><a href="${path}/final/alwaysQnA">자주묻는 질문</a></li>
                   <!--  <li><a href="#">수료증 확인</a></li> -->
                    <li><a href="${path}/final/sell">이용약관</a></li>
                    <li><a href="${path}/final/personalpolicy">개인정보 취급방침</a></li>

                </ul>
            </div>
            <div id="ft-community">
                <h4 id="ft-title">개발자</h4>
                <ul>
                    <li><a href="${path}/final/email_send">개발자 이메일</a></li>
                    <li><a href="https://kylie-dajung.tistory.com/">개발자 사이트</a></li>
                </ul>
            </div>
            <div id="ft-mypage">
                <h4 id="ft-title">My page</h4>
                <ul>
                    <li><a href="${path}/memberfinal/myinfo">나의 정보</a></li>
                </ul>
            </div>
        </div>
        <div id="ft-div2">
            <p><a href="#">Bogo</a> | 개인정보취급방침 | 이용약관
            <p>
            <p>Bogo 사업자 정보
            <br/>Bogo | 대표자 : Bogo | 사업자번호:000-00-00000 사업자정보확인 | 개인정보보호 책임자 : Bogo |
            <br/>통신판매업 : 2021-부산충남대로-001
            <br/>주소 : 부산시 동래구 충남대로 100동호 | 이메일:@naver.com
            <br/>COPYRIGHT © Bogo, ALL RIGHTS RESERVED.</p>
        </div>
    </footer>
</body>

</html>
