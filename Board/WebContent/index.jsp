<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
  	#jumbo{
	background-color: lavender;
	}
  </style>
</head>
<body>

<div class="jumbotron text-center" id="jumbo">
  <h1>해인</h1>
  <br/>
  <p>SUNNY의 페이지에 오신것을 환영합니다!</p> 
</div>
  <br/>
  <br/>
<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h3>게시판</h3><br/>
      <p><a href="BorderList.do" class="btn btn-outline-warning" role="button">수업 일정을 확인해보세요</a></p>      
    </div>
    
    <div class="col-sm-4">
      <h3>회원관리</h3><br/>
      <p><a href="#" class="btn btn-outline-warning" role="button">회원 현황을 확인해보세요</a></p>
    </div>
    
    <div class="col-sm-4">
      <h3>소소한일상</h3><br/>
      <p><a href="#" class="btn btn-outline-warning" role="button">해인의 일상을 확인해보세요</a></p>
    </div>
  </div>
</div>

</body>
</html>
    