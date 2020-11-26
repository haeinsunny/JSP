<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>검색결과페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
    .record:hover {
      background: lavenderblush;
    }

    ul.pagination {
      background: none;
    }

    .search {
      background-color: white;
    }
  </style>
</head>
<jsp:include page="../common/header.jsp" />

<body>
  <br />
  <br />
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <h3>게시판</h3><br />
        <p>아래의 버튼을 클릭하여 수업을 추가하세요</p>
        <button type="button" class="btn btn-outline-info btn-sm" onclick="location.href='jsp/border/borderInput.jsp'">
          글쓰기</button>
      </div>
      <div class="col-sm-8">
        <div align="center">
          <h4>수업 리스트 </h4>
        </div>
        <br />
        <div>
            <table border="1" align="center">
              <tr align="center">
                <th width="100" style="background-color:lavender;">번호</th>
                <th width="250" style="background-color:lavenderblush;">제목</th>
                <th width="100" style="background-color:lavenderblush;">작성자</th>
                <th width="100" style="background-color:lavenderblush;">작성일</th>
                <th width="100" style="background-color:lavenderblush;">조회수</th>
              </tr>
              <c:forEach var="vo" items="${slist }">
                <tr class="record" onclick="location.href='/Board/BorderRead.do?id=${vo.borderId}'">
                  <td width="100" align="center">${vo.borderId }</td>
                  <td width="250" align="center">${vo.borderTitle }</td>
                  <td width="100" align="center">${vo.borderWriter }</td>
                  <td width="100" align="center">${vo.borderDate }</td>
                  <td width="100" align="center">${vo.borderHit }</td>
                </tr>
              </c:forEach>
            </table>
            <br />
            
            <form action="/Board/SearchList.do">
              <table class="search" align="center">
                <tr>
                  <td>
                    <select name="search" id="search">
                      <option value="writer">작성자</option>
                      <option value="title">제목</option>
                      <option value="content">내용</option>
                    </select>
                  </td>
                  <td>
                    <input type="text" name="word" id="word">
                  </td>
                  <td>
                    <input type="submit" class="btn btn-outline-info btn-sm" value="검색"></td>
                </tr>
              </table>
            </form>
        </div>
      </div>
    </div>
  </div>
  <br />
</body>

</html>