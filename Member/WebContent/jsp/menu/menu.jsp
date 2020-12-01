<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME MENU</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script><style type="text/css">
	#jumbo{
 	 background-color: lavender;
	}
		
	ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #CC99FF;	
  	}
  
  	li {
		float: left;
 	}
  
   li a, .dropbtn {
	display: inline-block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
  }
  
  li a:hover, .dropdown:hover .dropbtn {
	background-color: #664CFF;
	color: white;
	text-decoration: none;
  }
  
  li.dropdown {
	display: inline-block;
  }
  
  .dropdown-content {
	display: none;
	position: absolute;
	background-color: lavender;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	
  }
  
  .dropdown-content a {
	color: #CC99FF;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
	z-index: 1;
  }
  
  .dropdown-content a:hover {background-color: #664CFF;}
  
  .dropdown:hover .dropdown-content {
	display: block;
	
  }
</style>
</head>
<body>
<div class="jumbotron text-center" id="jumbo" style="margin-bottom:0">
	<h2>해 인</h2>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="#">Logo</a>
  
<!-- Links -->  
 <ul class="navbar-nav">	
 	<li class="nav-item"><a class="nav-link" href="/Member/jsp/menu/menu.jsp">HOME</a></li>
 	
    <!-- 서블릿의 세션객체로부터 읽어오는거임-->
   <c:if test="${id eq null || auth eq null}">
   <li class="nav-item"><a class="nav-link" href="/Member/jsp/member/joinForm.jsp">회원가입</a></li>
   </c:if>
   
    <c:if test="${id eq null || auth eq null}">
      <li class="nav-item"><a class="nav-link" href="/Member/jsp/member/loginForm.jsp">로그인</a></li>
    </c:if>
	
	<c:if test="${id eq null || auth eq null}">
    <li class="nav-item"><a class="nav-link" href="/Member/BorderList.do">게시판</a></li>	
    </c:if>

    <!-- Dropdown -->
    <c:if test="${auth eq 'admin' }">
      <li class="nav-item dropdown">
        <a href="#" class="nav-link dropdown-toggle" id="navbardrop">회원관리</a>
 	 		<div class="dropdown-menu">
        		<a class="dropdown-item" href="/Member/NoticeList.do">공지사항관리</a>
       	    	<a class="dropdown-item" href="/Member/MemberList.do">회원정보관리</a>
       	    </div>
      </li>
    </c:if>

    <c:if test="${id ne null || auth ne null}">
      <li class="nav-item dropdown"><a class="dropdown-item" href="/Member/Logout.do">로그아웃</a></li>
    </c:if>

  </ul>
</nav>
<br>
</body>

</html>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="#">Logo</a>

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="/Member/jsp/menu/menu.jsp">HOME</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/Member/jsp/member/joinForm.jsp">회원가입</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">로그인</a>
    </li>
    
     <li class="nav-item">
      <a class="nav-link" href="#">게시판</a>
    </li>

    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Dropdown link
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Link 1</a>
        <a class="dropdown-item" href="#">Link 2</a>
        <a class="dropdown-item" href="#">Link 3</a>
      </div>
    </li>
  </ul>
</nav>
<br>
  
<div class="container">
  <h3>Navbar With Dropdown</h3>
  <p>This example adds a dropdown menu in the navbar.</p>
</div>





















