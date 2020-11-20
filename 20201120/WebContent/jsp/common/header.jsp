<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	ul {
  	list-style-type: none;
  	margin: 0;
  	padding: 0;
  	overflow: hidden;
  	background-color: orange;
	}

	li {
  	float: left;
	}

	li a {
  	display: block;
  	color: white;
  	text-align: center;
  	padding: 14px 16px;
  	text-decoration: none;
	}

	li a:hover {
  	background-color: orangered;
	}
</style>
</head>
<body>
	<div>
		<ul>
  			<li><a class="active" href="jsp/main/main.jsp">Home</a></li>
  			<li><a href="#news">News</a></li>
  			<li><a href="#contact">Contact</a></li>
  			<li><a href="#about">About</a></li>
  			<li><a href="jsp/member/loginForm.jsp">Login</a></li>
		</ul>
	</div>
</body>
</html>