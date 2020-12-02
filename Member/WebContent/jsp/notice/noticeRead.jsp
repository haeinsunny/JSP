<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/jsp/menu/menu.jsp" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>공지사항 상세보기</title>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12" align="center">
                <br />
                <br />
                <div align="center">
                    <h4>글 상세보기</h4>
                </div>
                <br />
                <br />
                <div align="center">
                    <table border="1">
                        <tr align="center">
                            <th width="100">제목</th>
                            <td width="100" colspan="3">${vo.nTitle}</td>
                            <th width="100">작성시간</th>
                            <td width="100" >${vo.nDate}</td>
                        </tr>
                        <tr align="center">
                            <th width="100">작성자</th>
                            <td width="100" colspan="3">${vo.nWriter}</td>
                            <th width="100">조회수</th>
                            <td width="100">${vo.nHit}</td>
                        </tr>
                        <tr align="center">
                            <th width="100">내용</th>
                            <td colspan="5">
                                <textarea rows="10" cols="70" readonly>${vo.nContent}</textarea>
                            </td>
                        </tr>
                        <tr align="center">
                            <th width="100">첨부파일</th>
                            <td colspan="5">${vo.nAttach}</td>
                        </tr>
                    </table>
                    <br />
                    <div>
                        <form id="frm" name="frm" action="" method="post">
                            <c:if test="${auth eq 'admin' }">
                            <input type="hidden" id="id" name="id" value="${vo.nId }">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="submit" class="btn btn-success"
                                onclick='btn("edit")'>글수정</button>&nbsp;&nbsp;&nbsp;
                            <button type="submit" class="btn btn-dark"
                                onclick='btn("del")'>글삭제</button>&nbsp;&nbsp;&nbsp;
                            </c:if>
                            <button type="button" class="btn btn-secondary"
                                onclick="location.href='/Member/NoticeList.do'">목록</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
</body>
<script>
    function btn(str) {
        if (str == "edit") {
            frm.action = "/Member/NoticeEdit.do";
        } else if (str == "del") {
            frm.action = "/Member/NoticeDelete.do";
        }
    }
</script>

</html>