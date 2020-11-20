<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 자바코드가 하나도 없는 EL표현식으로 쓰는것이 현대 JSP방식. 요청하거나 전달하는 일은 자바클래스에서 하고, jsp는 페이지 표출만 담당한다 -->
<jsp:include page="../common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<%-- <h1><%= request.getAttribute("msg") %></h1> //msg는 내가 임의로 출력되게 전달한 값이라서 getparam이 아니라 getAtt로 받아야함 --%>
		<h1>${param.id}</h1>
		<h1>${param.password}</h1>
		
		<h3>${msg}</h3>
	</div>	
</body>

</html>
<jsp:include page="../common/tail.jsp" />