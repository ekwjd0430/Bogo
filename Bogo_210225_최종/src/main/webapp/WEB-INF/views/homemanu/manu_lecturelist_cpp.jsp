<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/main/main.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/manu/manu_lecturelist.css" rel="stylesheet" type="text/css"/>
  <!-- c언어 페이지 -->
    <main id="home">
        <div class="lecture_contents">
            <img src="${path}/resources/img/lecture/cpp_img.png" class="lecturelist_img" />
        </div>
            <div class="lecture_div">
            	<h3>C++ 언어의 설명</h3>
                <p><br/><br/> C 언어에 객체지향 프로그래밍을 지원하기 위한 내용이 덧붙여진 것이라고 할 수도 있지만, 
                	애초부터 객체지향을 염두에 두고 만들어진 언어와는 다르게, 단지 더 좋은 C 언어로서 수속형 언어로 취급하기도 한다. 초기의 C++은 C 위에 놓인 트랜스레이터로 구현되었다. 
                	즉, C++ 프로그램을 일단 C 프로그램으로 변환하고 나서 C 컴파일러로 컴파일하는 식이었고 따라서 C 언어에 대해 상위 호환성을 갖는 언어였다. </p>
            <br/><br/>
                <a href="https://visualstudio.microsoft.com/ko/vs/features/cplusplus/">☞  c++ 개발도구</a>
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