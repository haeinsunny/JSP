<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<jsp:include page="../menu/menu.jsp" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br/>
	<div align="center">
		<c:if test="${auth ne ' ' }">
		<h1>${vo.mName} 님 환영합니다.</h1>
		</c:if>
		<c:if test="${auth eq ' ' }">
		<h1>${vo.mId } 가 존재하지 않거나 비밀번호가 일치하지 않습니다.</h1>
		</c:if>
	</div>
</body>
</html>