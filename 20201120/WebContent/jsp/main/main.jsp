<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!-- 지시어 태그라고 함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<script></script>
</head>
<jsp:include page="../common/header.jsp" />
<body>
	<!-- 되도록이면 본문만 들어가도록 -->
	<div align="center">
		<div>
			<h1>이곳은 시작페이지 Main 입니다.</h1>
		</div>
		<div>
			<h1>
				<a href="jsp/member/loginForm.jsp">로그인 하기</a>
			</h1>
		</div>
	</div>
</body>
</html>
<jsp:include page="../common/tail.jsp" />