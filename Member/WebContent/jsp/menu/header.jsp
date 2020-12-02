<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>HOME MENU</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>
  <div class="jumbotron text-center" id="jumbo" style="margin-bottom:0">
    <h2>해 인</h2>
  </div>

  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
      <!-- Brand -->
      <a class="navbar-brand" href="#">Blog</a>

      <!-- Links -->

      <ul class="navbar-nav mr-auto">
        <c:if test="${id ne null || auth ne null}">
          <li class="nav-item">
            <a class="nav-link" href="/Member/BorderList.do">자유게시판</a>
          </li>
        </c:if>

        <c:if test="${id ne null || auth ne null}">
          <li class="nav-item">
            <a class="nav-link" href="/Member/NoticeList.do">공지사항</a>
          </li>
        </c:if>

		
        <!-- Dropdown -->
        <c:if test="${auth eq 'admin' }">  
        	<li class="nav-item dropdown">       
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">
              	회원관리
            </a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="/Member/MemberList.do">회원정보 관리</a>
              <a class="dropdown-item" href="/Member/jsp/notice/noticeForm.jsp">공지사항 등록</a>
            </div>
        </c:if>
      </ul>
    </div>

    <div class="mx-auto order-0">
      <a class="navbar-brand mx-auto" href="/Member/jsp/menu/menu.jsp">Sunny's Home</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>

    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
      <ul class="navbar-nav ml-auto">

        <c:if test="${id ne null || auth ne null}">
          <li class="nav-item">
            <a class="nav-link" href="#">마이페이지</a>
          </li>
        </c:if>
	
        <c:if test="${id ne null || auth ne null}">
          <li class="nav-item">
            <a class="nav-link" href="/Member/Logout.do">로그아웃</a>
          </li>
        </c:if>
	
        <c:if test="${id eq null || auth eq null}">
          <li class="nav-item">
            <a class="nav-link" href="/Member/jsp/member/loginForm.jsp">로그인</a>
          </li>
        </c:if>

        <c:if test="${id eq null || auth eq null}">
          <li class="nav-item">
            <a class="nav-link" href="/Member/jsp/member/joinForm.jsp">회원가입</a>
          </li>
        </c:if>

      </ul>
    </div>
  </nav>
  <br>

</body>
</html>