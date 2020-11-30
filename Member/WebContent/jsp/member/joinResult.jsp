<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>회원가입 결과</title>
 <jsp:include page="/jsp/menu/menu.jsp" />
</head>
<body>
<br/>
<br/>
	<div align="center">
		<h3>${vo.mName} 님 회원가입 되었습니다.</h3>
		<br/>
		<button class="btn btn-warning" onclick="location.href='/Member/jsp/member/loginForm.jsp'">로그인하기</button>
	</div>
	<br/>
	
</body>
</html>