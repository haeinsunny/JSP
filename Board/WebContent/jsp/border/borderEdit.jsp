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
<jsp:include page="../common/header.jsp" />

<body>
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-sm-12" align="center">
                <div>
                    <h4>글 수정</h4>
                    <br />
                </div>

                <div align="center">
                    <form id="frm" name="frm" action="/Board/BorderEdit.do" method="post">
                        <table border="1">
                            <tr align="center">
                                <th width="100">작성자</th>
                                <td width="300">${vo.borderWriter }</td>
                            </tr>
                            <tr align="center">
                                <th width="100">작성일</th>
                                <td width="300">${vo.borderDate }</td>
                            </tr>
                            <tr align="center">
                                <th width="100">제목</th>
                                <td width="300">${vo.borderTitle }</td>
                            </tr>
                            <tr align="center">
                                <th width="100">내용</th>
                                <td width="300"><textarea name="content" id="content" cols="50" rows="20" text-align:"left">${vo.borderContent }                                        
                                </textarea></td>
                            </tr>
                        </table>
                        <br />
                        <input type="hidden" id="id" name="id" value="${vo.borderId }">
                        수정일&nbsp;<input type="text" id="wdate" name="wdate" readonly>&nbsp;&nbsp;&nbsp;
                        <button type="submit" class="btn btn-warning" onclick="btn('up')">수정</button> &nbsp;&nbsp;&nbsp;
                        <button type="reset" class="btn btn-light" onclick="btn('cn')">취소</button> &nbsp;&nbsp;&nbsp;
                        <button type="button" class="btn btn-secondary"
                            onclick="location.href='/Board/BorderList.do'">목록</button>

                    </form>

                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
</body>
<script>
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    var today = yyyy + '-' + mm + '-' + dd;
    $("#wdate").attr('value', today);
    console.log(today);

    function btn(str) {
        if (str == "up") {
            frm.action = "/Board/BorderUpdate.do";
        } else if (str == "cn") {
            frm.action = "/Board/BorderEdit.do";
        }
    }
</script>

</html>