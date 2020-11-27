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
  <title>Insert title here</title>
  <link rel="stylesheet" href="/Member/css/menu.css">
</head>

<body>
  <div class="jumbotron text-center" id="jumbo" style="margin-bottom:0;">
    <h1>해인</h1>
  </div>
  <ul>
    <!-- 서블릿의 세션객체로부터 읽어오는거임-->
    <c:if test="${id eq null || auth eq null}">
      <li><a href="jsp/member/loginForm.jsp">로그인</a></li>
    </c:if>

    <li><a href="/Member/BorderList.do">게시판</a></li>

    <li class="dropdown">
      <a href="javascript:void(0)" class="dropbtn">메뉴</a>
      <div class="dropdown-content">
        <a href="#">Link1</a>
        <a href="#">Link 2</a>
        <a href="#">Link 3</a>
      </div>
    </li>

    <c:if test="${auth eq 'admin' }">
      <li>
        <a href="/Member/MemberList.do" class="dropbtn">회원관리</a>
      </li>
    </c:if>

    <c:if test="${id ne null || auth ne null}">
      <li><a href="/Member/Logout.do">로그아웃</a></li>
    </c:if>

  </ul>
  </div>
</body>

</html>