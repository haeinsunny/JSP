<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %><!-- 헤더가져와 쓰는방법 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%! //변수선언
	String id;
	String msg;
%>
<% //자바코드
	id = request.getParameter("id");
	if (id.equals("hong")) {
		msg = "홍길동님 환영합니다.";
	} else {
		msg = "아이디값이 존재하지 않습니다.";
	}
%>

<body>
	<div align="center"><!-- 출력문 -->
		<h1><%= msg %></h1>
	</div>	
</body>

</html>
<%@ include file="../common/tail.jsp" %><!-- tail가져와 쓰는방법 -->