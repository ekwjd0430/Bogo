<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link href="${path}/resources/css/main/home.css" rel="stylesheet" type="text/css"/>
<link href="${path}/resources/css/manu/manu-recruit.css" rel="stylesheet" type="text/css"/>
<!-- 채용안내 페이지 -->
<main id="home">
	<div class="job-div">
		<h1>채용 안내</h1>
		<p><br/><br/>＊ Bogo에 입사하기 위해서는 Bogo의 양식을 사용하여야 입사 지원이 가능합니다.</p>
		<form>
			<table style="text-align:center;">
				<tr>
					<td rowspan="4" width="150px" height="210px">
						<div style="width:100%; height:100%;">
							<div id="container-img">
								증명사진
								<img src=""/>
							</div>
							<div id="container-img-btn">
								<input id="btn-img" type="button" value="upload"/>
								<input type="file" name="file">
							</div>
						</div>
					</td>
					<td><input type="text" name="name" placeholder="이름"></td>
					<td><input type="text" name="birth" placeholder="생년월일"></td>
					<td><input type="text" name="phone" placeholder="연락처"></td>
				</tr>
				<tr>
					<td colspan="3"><input type="text" name="addr" placeholder="주소"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="email" placeholder="E-mail"></td>
				</tr>
				<tr>
					<td><input type="text" name="hobby" placeholder="취미/특기"></td>
				</tr>
				<tr>
					<td class="category-border-right">학적사항</td>
					<td><input type="text" name="univ" placeholder="학교명"></td>
					<td><input type="text" name="major" placeholder="전공"></td>
					<td><input type="text" name="univLoc" placeholder="소재지"></td>
				</tr>
				<tr class="category-border-top">
					<td class="category-border-right">경력사항</td>
					<td><input type="text" name="com" placeholder="직장명"></td>
					<td><input type="text" name="job" placeholder="직무"></td>
					<td><input type="text" name="comLoc" placeholder="소재지"></td>
				</tr>
				<tr class="category-border-top">
					<td rowspan="6" class="category-border-right">자격면허</td>
				</tr>
				<tr>
					<td><input type="text" name="license1" placeholder="자격명"></td>
					<td><input type="text" name="date1" placeholder="취득일"></td>
					<td><input type="text" name="org1" placeholder="발급기관"></td>
				</tr>
				<tr>
					<td><input type="text" name="license2" placeholder="자격명"></td>
					<td><input type="text" name="date2" placeholder="취득일"></td>
					<td><input type="text" name="org2" placeholder="발급기관"></td>
				</tr>
				<tr>
					<td><input type="text" name="license3" placeholder="자격명"></td>
					<td><input type="text" name="date3" placeholder="취득일"></td>
					<td><input type="text" name="org3" placeholder="발급기관"></td>
				</tr>
				<tr>
					<td><input type="text" name="license4" placeholder="자격명"></td>
					<td><input type="text" name="date4" placeholder="취득일"></td>
					<td><input type="text" name="org4" placeholder="발급기관"></td>
				</tr>
				<tr>
					<td><input type="text" name="license5" placeholder="자격명"></td>
					<td><input type="text" name="date5" placeholder="취득일"></td>
					<td><input type="text" name="org6" placeholder="발급기관"></td>
				</tr>
				<tr>
					<td colspan="4">자기소개서</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea id="schoolLife" cols="80" rows="10" name="schoolLife" placeholder="학교생활"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea cols="80" rows="10" name="prosCons" placeholder="성격의 장단점"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea cols="80" rows="10" name="reasonPlan" placeholder="지원동기 및 입사 후 포부"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea cols="80" rows="10" name="exp" placeholder="직무와 관련된 경험"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div id="container-btn">
							<input id="btn-submit" type="submit" value="보내기"/>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</main>