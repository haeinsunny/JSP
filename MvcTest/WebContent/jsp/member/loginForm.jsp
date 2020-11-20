<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %><!-- 헤더가져와 쓰는방법 -->	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div align="center">
		<div>
			<h1>로 그 인</h1>
		</div>
		<div>
			<!--<form action="../../Login" id="frm" name="frm" method="post"> action이 활동되려면 해당서블릿 만들기. 어노테이션 이용함-->
			<form action="loginCheck.do" id="frm" name="frm" method="post">	
				<table border="1">
					<tr>
						<th>아이디</th>
						<td><input type="text" id="id" name="id" size="20"></td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="password" id="password" name="password"
							size="20"></td>
					</tr>
				</table>
				<br/> 
				<input type="submit" value="로그인"> &nbsp;&nbsp;&nbsp;
				<input type="reset" value="취소">
			</form>
		</div>
	</div>
</body>

</html>
<%@ include file="../common/tail.jsp" %><!-- tail가져와 쓰는방법 -->