<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/main/home.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/manu/manu-alwaysQnA.css" rel="stylesheet" type="text/css"/>
<!-- 자주하는 질문 페이지 -->
<main id="home">
	<div class="QnA-div">
	
	<div class="QnA_table_div">
        	<h1> ▶  자주 하는  질문</h1>
        	<table class="QnA_table">
	            <tr>
	                <th>No</th>
	                <td><h3> 질문 목록</h3></td>
	            </tr>
	            <tr>
	                <th>1</th>
	                <td id="reply-td">
	                	<a onclick="reply('reply1')" >프로그래밍 혼자 독학해도 되나요?</a>
	                </td>
	            </tr>
	            <tr class="reply"  id="reply1">
	                <th>▶</th>
	                <td>
	                	혼자할수 있으나 힘들겁니다.
	                	<input type="button" value="X" onclick="closeBtn('reply1')">
	                	<!-- style="float:right; -->
	                </td>
	            </tr>
	            <tr>
	            	<th>2</th>
	                <td><a onclick="reply('reply2')">개발자 구인은 어디서하면 좋나요?</a></td>
	            </tr>
	            <tr class="reply" id="reply2">
	                <th>▶</th>
	                <td>
	                	사람인이나 링크드인을 이용하세요.
	                	<input type="button" value="X" onclick="closeBtn('reply2')">
	                </td>
	            </tr>
	            <tr>
	            	<th>3</th>
	                <td><a onclick="reply('reply3')">아무리 들어도 잘모르겠습니다.</a></td>
	            </tr>
	            <tr class="reply" id="reply3">
	                <th>▶</th>
	                <td>
	                	모르신다면 저희 강희를 수강해 보시는 건 어떠신가요 ?? 
	                	<input type="button" value="X" onclick="closeBtn('reply3')">
	                </td>
	            </tr>
	            <tr>
	                <th>4</th>
	                <td><a onclick="reply('reply4')">어떤 브라우저를 사용하는게 좋나요?</a></td>
	            </tr>
	            <tr class="reply" id="reply4">
	                <th>▶</th>
	                    
	                <td>
	                    	호완성 검사를 통해 가장 많이 지원되는 브라우저를 이용히세요.	
	                	<input type="button" value="X" onclick="closeBtn('reply4')">
	                </td>
	            </tr>
	            <tr>
	            	<th>5</th>
	                <td><a onclick="reply('reply5')">어떨때 404 에러가 뜨나요?</a></td>
	            </tr>
				<tr class="reply" id="reply5">
	                <th>▶</th>
	                <td>
	                   서버와 통신할 수는 있지만 서버가 요청한 바를 찾을 수 없다는 것을 가리키는 HTTP 표준 응답 코드 입니다.
	                	<input type="button" value="X" onclick="closeBtn('reply5')">
	                </td>
	            </tr>
	            <tr>
					<th>6</th>
	                <td><a onclick="reply('reply6')">어떤언어 부터 배워야 하나요?</a></td>
	            </tr>
	            <tr class="reply" id="reply6">
	                <th>▶</th>
	                 	
	                <td>
	              	  저희 사이트가 제공하는 수업을 통해 배우고자하는 언어를 시작하시는건 어떨까요??
	                	<input type="button" value="X" onclick="closeBtn('reply6')">
	                </td>
	            </tr>
	            <tr>
					<th>7</th>
	                <td><a onclick="reply('reply7')">스프링이 먼가요?</a></td>
	            </tr>
	            <tr class="reply" id="reply7">
	                <th>▶</th>
	                <td>
	                스프링 프레임워크는 자바 진영에서 주로 웹 서버 어플리케이션을 만들기 위해 사용하는 프레임워크입니다.

	                	<input type="button" value="X" onclick="closeBtn('reply7')">
	                </td>
	            </tr>
	            <tr>
					<th>8</th>
	                <td><a onclick="reply('reply8')">전자정부 프레임 워크는 먼가요?</a></td>
	            </tr>
	            <tr class="reply" id="reply8">
	                <th>▶</th>
	                <td>
	                대한민국의 공공부문 정보화 사업 시 플랫폼별 표준화된 개발 프레임워크를 말합니다.
	                
	                	<input type="button" value="X" onclick="closeBtn('reply8')">
	                </td>
	            </tr>
	            <tr>
					<th>9</th>
	                <td><a onclick="reply('reply9')">톰캣 서버를 설치 못하겠습니다.</a></td>
	            </tr>
	            <tr class="reply" id="reply9">
	                <th>▶</th>
	                <td>
	                <a href="http://tomcat.apache.org/">톰켓설치 사이트에서 다운후  순차적으로 실행해주세요.</a>
	                	<input type="button" value="X" onclick="closeBtn('reply9')">
	                </td>
	            </tr>
	            <tr>
					<th>10</th>
	                <td><a onclick="reply('reply10')">ajax 비동기 통신 너무 어렵습니다.</a></td>
	            </tr>
	            <tr class="reply" id="reply10">
	                <th>▶</th>
	                <td>
	                ajax 비동기 통신 강의는 spring 강의에서 자세하게 다루고 있습니다.
	                	<input type="button" value="X" onclick="closeBtn('reply10')">
	                </td>
	            </tr>
	        </table>
        </div>
	</div>
</main>
		<script>
			function closeBtn(id){
				document.getElementById(id).style.display ='none';//고정된  reply
			}
			function reply(id){//클릭시
				document.getElementById(id).style.color ='purple';
				document.getElementById(id).style.display ='table-row';
						
			}	
		</script>
    
