<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notice ContentView</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="nomodify" method="post">
			<input type="hidden" name="noNum" value="${noticeDTO.noNum}">
			<tr>
				<td>번호</td>
				<td>제목</td>
			</tr>
			<tr>
				<td>${noticeDTO.noNum}</td>
				<td><input type="text" name="noTitle" value="${noticeDTO.noTitle}"></td>
			</tr>
		<tr>
			<td colspan="2">내용</td>
		</tr>
		<tr>
			<td colspan="2"><textarea rows="10" name="noContent">${noticeDTO.noContent}</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="수정">&nbsp;&nbsp;
				<a href="noDelete?noNum=${noticeDTO.noNum}">삭제</a>&nbsp;&nbsp;<a href="onList">목록보기</a>&nbsp;&nbsp;
			     
		</tr>
		</form>
	</table>
</body>
</html>