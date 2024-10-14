<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/main/main.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/manu/manu_lecturelist.css" rel="stylesheet" type="text/css"/>
  <!-- c언어 페이지 -->
    <main id="home">
        <div class="lecture_contents">
            <img src="${path}/resources/img/lecture/cshap_img.png" class="lecturelist_img" />
        </div>
            <div class="lecture_div">
            	<h3>C# 언어의 설명</h3>
                <p><br/><br/>000년 7월에 개최되었던 Professional Developers Conference(PDC)에서[1] .NET 프로젝트와 함께 발표된 객체 지향 프로그래밍 언어.
                	 한국어로 쓸 때는 '씨샵', '씨 샤프', '씨샵'등 으로 쓴다. 마이크로소프트에서 개발되었으며, 1983년에 등장한 C++와 1995년에 등장한 Java에서 강한 영향을 받았다. 
                	확장자는 .cs다.
                <br/><br/>
                <a href="https://docs.microsoft.com/ko-kr/dotnet/csharp/">☞  c# 사이트</a>
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