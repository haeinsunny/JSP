<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>게시판 수정</title>
</head>

<body>
    <div align="center">
        <h1>글수정</h1>
        <br />
    </div>

    <div align="center">
        <form id="frm" name="frm" action="/Board/BorderEdit.do" method="post">
            <table border="1">
               <tr>
                    <th width="100">작성자</th>
                    <td width="300">${vo.borderWriter }</td>
                </tr>
                <tr>
                    <th width="100">작성일</th>
                    <td width="300">${vo.borderDate }</td>
                </tr>
                <tr>
                    <th width="100">제목</th>
                    <td width="300">${vo.borderTitle }</td> 
                </tr>
                <tr>
                    <th width="100">내용</th>
                    <td width="300"><textarea name="content" id="content" cols="50" rows="20">
                    ${vo.borderContent }</textarea></td>
                </tr>
            </table>
            <br/>
          </form>
     <div>     
         <form id="frm" name="frm" action="/Board/BorderUpdate.do" method="post">
            <input type="date" id="wdate" name="wdate">&nbsp;&nbsp;&nbsp;
            <button type="submit">수정</button> &nbsp;&nbsp;&nbsp;
            <button type="reset">취소</button> &nbsp;&nbsp;&nbsp;
            <button type="button" onclick="location.href='/Board/BorderList.do'">목록</button>        
        </form>
        </div>
    </div>
</body>

</html>