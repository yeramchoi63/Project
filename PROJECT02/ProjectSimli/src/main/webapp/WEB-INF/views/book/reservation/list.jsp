<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta 109</title>
</head>
<body>
<table width="500" cellpadding="0" cellspacing="0" border="1" align="center">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
		</tr>
		

		
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.exnum}</td>
				<td>${dto.extitle }</td>
				<td>${dto.exname}</td>
			</tr>
		</c:forEach>

		<tr>
			<td colspan="3"><a href="">글쓰기</a></td>
		</tr>
	</table>
</body>
</html>