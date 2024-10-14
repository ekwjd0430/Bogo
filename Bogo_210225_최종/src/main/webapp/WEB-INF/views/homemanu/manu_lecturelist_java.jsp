<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/main/main.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/manu/manu_lecturelist.css" rel="stylesheet" type="text/css"/>
  <!-- c언어 페이지 -->
    <main id="home">
        <div class="lecture_contents">
            <img src="${path}/resources/img/lecture/java.png" class="lecturelist_img" />
        </div>
            <div class="lecture_div">
            	<h3>JAVA 언어의 설명</h3>
                <p><br/><br/>
                	썬 마이크로시스템즈에서 1995년에 개발한 객체 지향 프로그래밍 언어. 창시자는 제임스 고슬링이다. 
                	2010년에 오라클이 썬 마이크로시스템즈을 인수하면서 Java의 저작권을 소유하였다. 
                	현재는 OpenJDK는 GPL2이나 오라클이 배포하는 Oracle JDK는 상업라이선스로 오라클이 돈독 올랐는지 2019년 1월부터 유료화정책을 강화하고 있다. 
                	Java EE는 이클립스 재단의 소유이다. Java 언어는 J2SE 1.4부터는 Java Community Process (JCP)에서 개발을 주도하고 있다.
					C#과 문법적 성향이 굉장히 비슷하며, 그에 비해 2019년 Q3에서 가장 많이 이용하는 언어로 뽑혔다. JavaScript와는 다르다.
                <br/><br/>
                <a href="https://www.java.com/ko/">☞  java 사이트</a>
                </p>
                
            </div>
     	<div class="lecturelist_table_div">
        	<h3>강의목록</h3>
        	 	<table class="lecturelist_table">
	            <tr>
	                <th>No</th>
	                <td>강의명</td>
	                <td></td>
	            </tr>
	            <tr>
	                <th>1강</th>
	                <td>c언어의 탄생</td>
	            <c:choose>
					<c:when test="${!empty sessionScope.userInfo}">
	      					<td class="uploadBtn"><input type="button" value="upload" width="100%" height="100%"/></td>
	            	</c:when>
					<c:otherwise>
							<td class="downloadBtn"><input type="button" value="download" width="100%" height="100%"/></td>
					</c:otherwise>
				</c:choose>
	            </tr>
	            <tr>
	            	<th>2</th>
	                <td>프로그램과 C 언어</td>
			        <c:choose>
						<c:when test="${!empty sessionScope.userInfo}">
			      			<td class="uploadBtn"><input type="button" value="upload" width="100%" height="100%"/></td>
			            </c:when>
						<c:otherwise>
							<td class="downloadBtn"><input type="button" value="download" width="100%" height="100%"/></td>
						</c:otherwise>
					</c:choose>
	            </tr>
	            <tr>
	            	<th>3</th>
	                <td>컴파일과 컴파일러 사용법</td>
	                    <c:choose>
							<c:when test="${!empty sessionScope.userInfo}">
			      					<td class="uploadBtn"><input type="button" value="upload" width="100%" height="100%"/></td>
			            	</c:when>
							<c:otherwise>
									<td class="downloadBtn"><input type="button" value="download" width="100%" height="100%"/></td>
							</c:otherwise>
						</c:choose>
	                
	            </tr>
	            <tr>
	                <th>4</th>
	                <td>C 프로그램의 구조와 데이터 출력 방법</td>
	                    <c:choose>
							<c:when test="${!empty sessionScope.userInfo}">
			      					<td class="uploadBtn"><input type="button" value="upload" width="100%" height="100%"/></td>
			            	</c:when>
							<c:otherwise>
									<td class="downloadBtn"><input type="button" value="download" width="100%" height="100%"/></td>
							</c:otherwise>
						</c:choose>
	                
	            </tr>
	            <tr>
	            	<th>5</th>
	                <td>상수와 데이터 표현 방법</td>
	                    <c:choose>
							<c:when test="${!empty sessionScope.userInfo}">
			      					<td class="uploadBtn"><input type="button" value="upload" width="100%" height="100%"/></td>
			            	</c:when>
							<c:otherwise>
									<td class="downloadBtn"><input type="button" value="download" width="100%" height="100%"/></td>
							</c:otherwise>
						</c:choose>
	                
	            </tr>
	
	            <tr>
					<th>6</th>
	                <td>변수</td>
	                    <c:choose>
							<c:when test="${!empty sessionScope.userInfo}">
			      					<td class="uploadBtn"><input type="button" value="upload" width="100%" height="100%"/></td>
			            	</c:when>
							<c:otherwise>
									<td class="downloadBtn"><input type="button" value="download" width="100%" height="100%"/></td>
							</c:otherwise>
						</c:choose>
	                
	            </tr>
	            <tr>
					<th>7</th>
	                <td>데이터 입력</td>
	                    <c:choose>
							<c:when test="${!empty sessionScope.userInfo}">
			      					<td class="uploadBtn"><input type="button" value="upload" width="100%" height="100%"/></td>
			            	</c:when>
							<c:otherwise>
									<td class="downloadBtn"><input type="button" value="download" width="100%" height="100%"/></td>
							</c:otherwise>
						</c:choose>
	                
	            </tr>
	            <tr>
					<th>8</th>
	                <td>1</td>
	                <c:choose>
						<c:when test="${!empty sessionScope.userInfo}">
			      				<td class="uploadBtn"><input type="button" value="upload" width="100%" height="100%"/></td>
			            </c:when>
						<c:otherwise>
								<td class="downloadBtn"><input type="button" value="download" width="100%" height="100%"/></td>
						</c:otherwise>
					</c:choose>
	            </tr>
	            <tr>
					<th>9</th>
	                <td>산술 연산자, 관계 연산자, 논리 연산자</td>
	                <c:choose>
						<c:when test="${!empty sessionScope.userInfo}">
			      				<td class="uploadBtn"><input type="button" value="upload" width="100%" height="100%"/></td>
			            </c:when>
						<c:otherwise>
								<td class="downloadBtn"><input type="button" value="download" width="100%" height="100%"/></td>
						</c:otherwise>
					</c:choose>
	            </tr>
	            <tr>
					<th>10</th>
	                <td>선택문(if, switch - case)</td>
	                 <c:choose>
						<c:when test="${!empty sessionScope.userInfo}">
			      			<td class="uploadBtn"><input type="button" value="upload" width="100%" height="100%"/></td>
			            </c:when>
						<c:otherwise>
							<td class="downloadBtn"><input type="button" value="download" width="100%" height="100%"/></td>
						</c:otherwise>
					</c:choose>
	            </tr>
	        </table>
        </div>
    </main>