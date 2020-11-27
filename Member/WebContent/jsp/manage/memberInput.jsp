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

    <title>회원 입력</title>
</head>
<jsp:include page="/jsp/menu/menu.jsp" />

<body>
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-sm-12" align="center">
                <div>
                    <h4>글 작성</h4>
                    <br />
                </div>

                <div align="center">
                    <form id="frm" name="frm" action="/Member/MemberInput.do" method="post">
                        <table border="1">
                            <tr align="center">
                                <th width="100">ID</th>
                                <td width="300" align="left"><input type="text" id="writer" name="writer"></td>
                            </tr>
                            <tr align="center">
                                <th width="100">이름</th>
                                <td width="300" align="left"><input type="date" id="date" name="date"></td>
                            </tr>
                            <tr align="center">
                                <th width="100">PW</th>
                                <td width="300" align="left"><input type="text" id="title" name="title"></td>
                            </tr>
                            <tr align="center">
                                <th width="100">권한</th>
                                <td width="300" align="left"><textarea name="content" id="content" cols="50"
                                        rows="20"></textarea>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <button type="submit" class="btn btn-warning">입력</button> &nbsp;&nbsp;&nbsp;
                        <button type="reset" class="btn btn-light">취소</button> &nbsp;&nbsp;&nbsp;
                        <button type="submit" class="btn btn-secondary" onclick="location.href='/Member/MemberList.do'">목록</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <br/>
    <br/>
</body>

</html>