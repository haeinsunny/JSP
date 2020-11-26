<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	
	#jumbo{
	background-color: lavender;
	}
	
	ul {
  	list-style-type: none;
  	margin: 0px 0px;
  	padding: 0;
  	overflow: hidden;
  	background-color: #CC99FF;
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
	color: white;
  	background-color: #664CFF;
  	text-decoration: none;
	}
	
</style>
</head>
<body>
	<div class="jumbotron text-center" id="jumbo" style="margin-bottom:0;">
  		<h1>해인</h1>
	</div>

	<div>
		<ul>
  			<li><a class="active" href="/Board/index.jsp">Home</a></li>
  			<li><a href="/Board/BorderList.do">게시판</a></li>
  			<li><a href="#contact">회원관리</a></li>
  			<li><a href="#about">소소한일상</a></li>
  			<li><a href="#">Login</a></li>
		</ul>
	</div>
</body>
</html>