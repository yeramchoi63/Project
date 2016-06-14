<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>과제함</title>

<body>
	<table border="1">
			<tr>
				<td>번호</td> 	<td>제출자료</td>	<td>업로드</td>	<td>날짜</td>		<td>제출여부</td>
			</tr>
	
	<c:forEach items="${tasklist}" var="list">
			<tr>
				<td>${list.num}</td> 	<td>${list.title}</td>	
				<td><a href="content?num=${list.num}">업로드</td>
				<td>${list.regdate}</td>		
				<td></td>
			</tr>
	
	</c:forEach>
	</table>
	
	
			<a href="fileupload">작성하기
</body>
</html>