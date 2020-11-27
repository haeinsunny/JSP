<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>게시판 수정</title>
</head>
<jsp:include page="/jsp/menu/menu.jsp" />

<body>
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-sm-12" align="center">
                <div>
                    <h4>회원 수정</h4>
                    <br />
                </div>

                <div align="center">
                    <form id="frm" name="frm" action="/Member/MemberUpdate.do" method="post">
                        <table border="1">
                            <tr align="center">
                                <th width="100">ID</th>
                                <td width="300" readonly>${vo.mId }</td>
                            </tr>
                            <tr align="center">
                                <th width="100">이름</th>
                                <td width="300" readonly>${vo.mName }</td>
                            </tr>
                            <tr align="center">
                                <th width="100">PW</th>
                                <td width="300" id="pw" name="pw" align="left"><input type="text" value="${vo.password }"></td>
                            </tr>
                            <tr align="center">
                                <th width="100">권한</th>
                                <td width="300" id="auth" name="auth" align="left"><input type="text" value="${vo.mAuth }"></td>
                            </tr>
                        </table>
                        <br />
                        <input type="hidden" id="id" name="id" value="${vo.mId }">
                        <button type="submit" class="btn btn-warning" onclick="btn('up')">수정</button> &nbsp;&nbsp;&nbsp;
                        <button type="reset" class="btn btn-light" onclick="btn('cn')">취소</button> &nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-secondary"
                            onclick="location.href='/Member/MemberList.do'">목록</button>

                    </form>

                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
</body>

</html>