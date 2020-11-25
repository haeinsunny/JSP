<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
</head>
<jsp:include page="../common/header.jsp" />
<body>
<br/> 
<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h3>게시판</h3><br/>
      <p>아래의 버튼을 클릭하여 수업을 추가하세요</p>
      <button type="button" class="btn btn-outline-info btn-sm" onclick="location.href='jsp/border/borderInput.jsp'">	
      	글쓰기</button>
    </div>
    
    <div class="col-sm-8">
      <div align="center"><h3>수업 리스트 </h3></div>
    <div align="center">
        <form>
            <table border="1">
                <tr align="center">
                    <th width="100" style="background-color:lavender;">번호</th>
                    <th width="250" style="background-color:lavenderblush;">제목</th>
                    <th width="100" style="background-color:lavenderblush;">작성자</th>
                    <th width="100" style="background-color:lavenderblush;">작성일</th>
                    <th width="100" style="background-color:lavenderblush;">조회수</th>
                </tr>
                <c:forEach var="vo" items="${list }"> 
                <tr class="record">
                    <td width="100" align="center">${vo.borderId }</th> 
                    <td width="250" align="center">${vo.borderTitle }</th>
                    <td width="100" align="center">${vo.borderWriter }</th>                    
                    <td width="100" align="center">${vo.borderDate }</th>
                    <td width="100" align="center">${vo.borderHit }</th>
                </tr>
                </c:forEach>
            </table>
            <br/>
        </form>
    </div>   
  </div>
</div>

</body>
</html>