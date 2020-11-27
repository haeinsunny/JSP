<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>글 보기</title>

</head>
<jsp:include page="/jsp/menu/menu.jsp" />

<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12" align="center">
                <br />
                <br />
                <div align="center">
                    <h4>회원 상세보기</h4>
                </div>
                <br />
                <br />
                <div align="center">
                    <table border="1">
                        <tr align="center">
                            <th width="100">ID</th>
                            <td width="100">${vo.mId}</td>
                            <th width="100" >이름</th>
                            <td width="100">${vo.mName}</td>                         
                        </tr>
                        <tr align="center">
                            <th width="100" >PW</th>
                            <td colspan="5">${vo.password}</td>
                        </tr>
                        <tr align="center">
                            <th width="100" >권한</th>
                            <td colspan="5">${vo.mAuth}</td>
                        </tr>
                    </table>
                    <br />
                    <div>
                        <form id="frm" name="frm" action="" method="post">
                            <input type="hidden" id="id" name="id" value="${vo.mId }">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="submit" class="btn btn-success" onclick='btn("edit")'>수정</button>&nbsp;&nbsp;&nbsp;
                            <button type="submit" class="btn btn-dark" onclick='btn("del")'>삭제</button>&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-secondary" onclick="location.href='/Member/MemberList.do'">목록</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br/>
</body>
<script>
    function btn(str) {
        if (str == "edit") {
            frm.action = "/Member/MemberEdit.do";
        } else if (str == "del") {
            frm.action = "/Member/MemberDelete.do";
        }
    }
</script>

</html>