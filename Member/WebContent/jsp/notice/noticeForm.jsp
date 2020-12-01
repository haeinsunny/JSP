<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<jsp:include page="/jsp/menu/menu.jsp" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

</head>
<body>
<br/>
	<div align="center">
		<h3>공지사항 등록</h3>
	</div>
	<br/>
	<div align="center">
		<form id="frm" name="frm" action="/Member/NoticeInsert.do" method="post" enctype="multipast/form-data">
			<table border="1">
				<tr align="center">
					<th width="100" >제목</th>
					<td width="500" align="left">
						<input type="text" id="title" name="title" size="75" required="required">							
					</td>
				</tr>
				<tr align="center">
					<th width="100">내용</th>
					<td width="500" align="left">
						<textarea rows="10" cols="80" id="content" name="content" required="required"></textarea>				
					</td>
				</tr>
				<tr align="center">
					<th width="100" >첨부파일</th>
					<td width="500" align="left">
						<input type="file" id="attatch" name="attatch">							
					</td>
				</tr>
			</table>
			<br/>
			<div>
				<input type="submit" class="btn btn-warning" value="저장">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" class="btn btn-light" value="취소">&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-secondary" onclick="location.href='/Member/NoticeList.do'"></button>
			</div>
		</form>	
	</div>
</body>
</html>