<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- comment.jsp -->
<link href="${path}/resources/css/boardmanu/manu_readpage.css" rel="stylesheet" type="text/css"/>

<div>
	<c:if test="${!empty userInfo}">
		<table class="commenttable">
			<tr>
				<th colspan=2>댓글</th>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" id="cAuth" value="${userInfo.uname}"  class="comment_text" readonly />
				</td>			
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows=5 cols=50 id="cText"  class="comment_textarea"></textarea>
				</td>			
			</tr>
			<tr>
				<td colspan=2 style="border:0px;">
					<input type="button" id="commentAddBtn" value="댓글 작성" class="styleBtn"/>
				</td>
			</tr>
		</table>
	</c:if>
</div>
<div id="modDiv">
	<h3>댓글 수정 &amp; 삭제</h3>
	<!-- 댓글 번호 -->
	<div class="mod-title"></div>
	<!-- 댓글 내용 -->
	<div>
		<textarea id="modCommentText" style="width:600px;height:50px;padding:5px;"></textarea>
		<!-- <input type="text" "/> -->
	</div>
	<div>
		<input type="button" id="cModBtn" value="MODIFY" class="styleBtn" style="float:none;"/>
		<input type="button" id="cDelBtn" value="DELETE" class="styleBtn" style="float:none;"/>
		<input type="button" id="closeBtn" value="CLOSE" class="styleBtn" style="float:none;"/>
	</div><br/>
</div>
<div>
	<ul id="comments">
	
	</ul>
</div>
<script>
	var bno = "${board.bno}";
	var commentPage = 1;
	var uno = "${userInfo.uno}";
	
	getListPage(commentPage);
	
	// 댓글 삽입
	$("#commentAddBtn").click(function(){
		var cAuth = $("#cAuth").val();
		var cText = $("#cText").val();
		console.log(cAuth);
		console.log(cText);
		$.ajax({
			type : "POST",
			url : contextPath+"/comments/add",
			headers : {
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				bno : bno,
				uno : uno,
				cauth : cAuth,
				ctext : cText
			}),
			dataType : "text",
			success : function(result){
				// dataType json = JSON.parse(res.responseText);
				console.log(result);
			},
			error : function(ajaxXHR){
				alert(ajaxXHR.responseText);
			}
		});
	});
	
	// 댓글 리스트 
	function getListPage(page){
		console.log("호출");
		var url = contextPath+"/comments/"+bno+"/"+page;
		// type : get , dataType : "json"
		$.getJSON(url,function(data){
			// data : pageMaker, list
			// data.list = 댓글 리스트 정보
			// data.pm	 = 페이지 블럭 정보
			console.log(data);
			
			//
			var str ="";
			$(data.list).each(function(){
				// this = CommentVO
				str += "<li class='commentLi' data-cno='"+this.cno+"' data-text='"+this.ctext+"'><br/>";
				str += "&nbsp;&nbsp; ID : " + this.cauth;
				str += "<br/><br/> &nbsp;&nbsp;내용 <br/><hr style='width:600px;'/><br/> &nbsp;&nbsp;&nbsp;"+ this.ctext+"<br/><br/><br/>";
				str += "<hr style='width:600px;'/>";
				str += "<p style='font-size:12px;margin-left:440px;'> Date : "+getDate(this.regdate)+"</p>";
				if(isCheckUser(this.uno)){
					str += "<button class='styleBtn' style='float:none;margin-left:530px;'>MOD</button>"; 
				}
				str += "</li>";
				str += "<li><br/><br/></li>";
			});
			$("#comments").html(str);
		});
	}
	
	$("#comments").on("click",".commentLi button", function(){
		var commentWrap = $(this).parent();
		var commentCno = commentWrap.attr("data-cno");
		var commentText = commentWrap.attr("data-text");
		
		$(".mod-title").html(commentCno);
		$("#modCommentText").val(commentText);
		
		$("#modDiv").toggle("slow");
		
		$("#modCommentText").focus();
	});
	
	$("#closeBtn").click(function(){
		$("#modDiv").hide("slow");
	});
	
	$("#cModBtn").click(function(){
		var cno = $(".mod-title").html();
		var commentText = $("#modCommentText").val();
		
		var url = contextPath+"/comments/mod";
		
		$.ajax({
			type : "PATCH",
			url : url,
			dataType : "text",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PATCH"
			},
			data : JSON.stringify({
				ctext : commentText,
				cno : cno
			}),
			success : function(result){
				console.log(result);
				$("#modDiv").hide();
				getListPage(commentPage);
			}
		});
	});
	
	$("#cDelBtn").click(function(){
		var cno  = $(".mod-title").html();
		
		$.ajax({
			type : "DELETE",
			url : contextPath+"/comments/remove/"+cno,
			headers : {
				"X-HTTP-Override" : "DELETE"
			},
			dataType : "text",
			success : function(result){
				console.log(result);
				$("#modDiv").hide("slow");
				getListPage(commentPage);
			}
		});
	});
	
	
	
	function getDate(timeValue){
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth()+1;
		var day = dateObj.getDate();
		var hour = dateObj.getHours();
		var minute = dateObj.getMinutes();
		var second = dateObj.getSeconds();
		var time = year+"/"+month+"/"+day + " " + hour +":"+minute+":"+second; 
		return time;
	}
	
	function isCheckUser(uno){
		var userUno = "${userInfo.uno}";
		return userUno != "" && userUno == uno ? true : false;
	}
	
</script>










