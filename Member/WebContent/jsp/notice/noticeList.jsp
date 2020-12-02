<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/jsp/menu/menu.jsp" />
<title>공지사항 리스트</title>
</head>
<body>
<div align="center">
	<br/>
	<div><h3>공지사항</h3></div>
	<br/>
	<div>
		<table border="1">	
			<tr align="center">
				<th width="100">번호</th>	
				<th width="300">제목</th>
				<th width="100">작성자</th>
				<th width="100">작성일자</th>
				<th width="100">첨부파일</th>
				<th width="100">조회수</th>				
			</tr>
			<c:forEach var="no" items="${list }">
				<tr align="center" class="record" onclick="location.href='/Member/NoticeRead.do?id=${no.nId}'">				
					<td width="100">${no.nId }</td>	
					<td width="300">${no.nTitle }</td>	
					<td width="100">${no.nWriter }</td>	
					<td width="100">${no.nDate }</td>	
					<c:if test="${vo.nAttach ne null }">
					<td align="center">Y</td>
					</c:if>	
					<c:if test="${vo.nAttach eq null }">
					<td align="center">N</td>
					</c:if>							
					<td width="100">${no.nHit }</td>				
				</tr>
			</c:forEach>
		</table>
		<br/>	
	</div>
</div>
</body>
</html>