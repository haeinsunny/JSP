<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<jsp:include page="../menu/menu.jsp" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$.ajax({
	url: '/Member/AjaxNoticeList.do',
	dataType:'json',
	success: function(event){
		var arr = event.data; //데이터만 추출		
		if(arr.length > 0){
			var tb = $("<table border = '1'/>");	
			var row = $("<tr  align='center'/>").append(
				$("<th width='100'/>").text("번호"),
				$("<th width='200'/>").text("제목"),
				$("<th width='100'/>").text("작성자"),
				$("<th width='100'/>").text("작성일자"),
				$("<th width='100'/>").text("조회수"),
				$("<th width='200'/>").text("첨부파일")
			);
			tb.append(row);	
			for(var i in arr){
				row = $("<tr/>").append(
					$("<td align='center'/>").text(arr[i].nId),
					$("<td  align='center'/>").text(arr[i].nTitle),
					$("<td align='center'/>").text(arr[i].nWriter),
					$("<td align='center'/>").text(arr[i].nDate),
					$("<td align='center'/>").text(arr[i].nHit),
					$("<td align='center'/>").text(arr[i].nAttach)
					);
				tb.append(row);
			}
			$("#notice").append(tb);
		}
	},
	error: function(){
		alert("데이터를 가져오지 못했네요:(");
	}
})
</script>
</head>

<body>
<br/>
	<div align="center">
		<c:if test="${auth ne ' ' }">
		<h2>${vo.mName}님 환영합니다.</h2>
		<br/>
		<!-- 공지사항 목록 -->
		<div id="notice"><h4>공지사항</h4></div>
		</c:if>
		
		<c:if test="${auth eq ' ' }">
		<h3>${vo.mId }가 존재하지 않거나 비밀번호가 일치하지 않습니다.</h3>
		</c:if>
	</div>
</body>
</html>