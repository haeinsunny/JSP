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
<jsp:include page="/jsp/menu/menu.jsp" />

<body>
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <h3>회원관리</h3><br />
                <p>아래의 버튼을 클릭하여 회원을 추가하세요</p>
                <button type="button" class="btn btn-outline-info btn-sm"
                    onclick="location.href='jsp/manage/memberInput.jsp'">
                    등록하기</button>
            </div>
            <div class="col-sm-8">
                <div align="center">
                    <h4>회원 리스트 </h4>
                </div>
                <br />
                <div>
                    <form>
                        <table border="1" align="center">
                            <tr align="center">
                                <th width="100" style="background-color:lavender;">ID</th>
                                <th width="250" style="background-color:lavenderblush;">이름</th>
                                <th width="100" style="background-color:lavender;">권한</th>
                                <th width="250" style="background-color:lavenderblush;">점수</th>
                            </tr>
                            <c:forEach var="vo" items="${list }">
                                <tr class="record" onclick="location.href='/Member/MemberRead.do?id=${vo.mId}'">
                                    <td width="100" align="center">${vo.mId }</th>
                                    <td width="250" align="center">${vo.mName }</th>
                                    <td width="100" align="center">${vo.mAuth }</th>
                                    <td width="100" align="center">${vo.mPoint}</th>
                                </tr>
                            </c:forEach>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <br />
</body>

</html>