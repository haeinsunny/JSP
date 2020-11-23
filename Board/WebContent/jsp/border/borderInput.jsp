<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <div align="center">
        <h1>글쓰기</h1>
        <br/>
    </div>

    <div align="center">
        <form action="">
            <table border="1">
                <tr>
                    <th width="100">작성자</th>
                    <td width="300"><input type="text" id="writer" name="writer"></td>
                </tr>
                <tr>
                    <th width="100">작성일</th>
                    <td width="300"><input type="date" id="date" name="date"></td>
                </tr>
                <tr>
                    <th width="100">제목</th>
                    <td width="300"><input type="text" id="title" name="title"></td>
                </tr>
                <tr>
                    <th width="100">내용</th>
                    <td width="300"><textarea name="content" id="content" cols="50" rows="20"></textarea></td>
                </tr>
            </table>
            <br/>
        </form>
    </div>
    <div align="center">
        <button type="submit">등록</button> &nbsp;&nbsp;&nbsp;
        <button type="reset">취소</button> &nbsp;&nbsp;&nbsp;
        <button type="submit" onclick="location.href='/Board/Border.do'">목록</button>
    </div>
</body>

</html>