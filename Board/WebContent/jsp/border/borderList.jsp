<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <div align="center">
        <h1>게시판</h1>
        <br/>
    </div>
    <div align="center">
        <form>
            <table border="1">
                <tr>
                    <th width="100">번호</th>
                    <th width="250">제목</th>
                    <th width="100">작성자</th>
                    <th width="100">작성일</th>
                    <th width="100">조회수</th>
                </tr>
                <c:forEach var="vo" items="${list }"> 
                <tr>
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
    <div align="center">
        <button type="button" onclick="location.href='jsp/border/borderInput.jsp'">글쓰기</button>
    </div>
</body>

</html>