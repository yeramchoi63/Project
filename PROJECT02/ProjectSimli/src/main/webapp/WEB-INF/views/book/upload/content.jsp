<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상세보기</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
	
	<tr>
		<td>제목</td><td>${contentview.title}</td>
	</tr>
	<tr>
		<td>작성자</td><td>${contentview.writer}</td>
	</tr>
	<tr>
		<td>내용</td><td>${contentview.content}</td>
	</tr>
	<tr>
		<td>다운로드</td><td>
		<a href="download?p=upload&f=${contentview.fileSrc}">${contentview.fileSrc}</a>
		</td>
	</tr>
	
	</table>
</body>
</html>