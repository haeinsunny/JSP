<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!-- 지시어 태그라고 함 -->
<!DOCTYPE html>
<html>
<head>
<!-- 스크립트, CSS등을 HEAD란에 쓴다 -->
<meta charset="UTF-8">
<title>My Home</title>
<script></script>
<!-- 스크립트의 위치는 HEAD란에! BODY안에 넣어도되는데 그러지말기 -->
</head>
<jsp:include page="jsp/common/header.jsp" /><!-- 액션태그 -->
<body>
	<!-- 되도록이면 본문만 들어가도록
	<div align="center">
		<div>
			<h1>환영합니다.</h1>
		</div>
		<div>
			<h1>
				<a href="jsp/member/loginForm.jsp">로그인 하기</a>
			</h1>
		</div>
	</div>-->
	
	<!--<jsp:forward page="jsp/main/main.jsp" />
	 1.액션태그로 넘겨보기 index.jsp를 먼저 실행시키지만 얘때문에 main.jsp페이지로 넘어간다-->
	<%--<% response.sendRedirect("jsp/main/main.jsp"); 
	 2.response객체로 넘겨보기 index.jsp를 먼저 실행시키지만 얘때문에 main.jsp페이지로 넘어간다 --%>
	 
	 <script type="text/javascript">
	 location.href="jsp/main/main.jsp";
	 </script><!-- 3.스크립트를 이용하는방법 -->
	
</body>
</html>
<jsp:include page="jsp/common/tail.jsp" /><!-- 액션태그 -->