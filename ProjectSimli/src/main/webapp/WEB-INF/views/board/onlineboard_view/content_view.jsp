<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Counselling ContentView</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">

		<input type="hidden" name="onNum" value="${onlineboardDTO.onNum}">
		<tr>
			<td>번호</td>
			<td>제목</td>
		</tr>
		<tr>
			<td>${onlineboardDTO.onNum}</td>
			<td>${onlineboardDTO.onTitle}</td>
		</tr>
		<tr>
			<td colspan="2">내용</td>
		</tr>
		<tr>
			<td colspan="2">${onlineboardDTO.onContent}</td>
		</tr>
		<tr>
		
		<se:authorize access="hasRole('ROLE_EMPLOYEE')">
			<td><a href="onModifyView?onNum=${onlineboardDTO.onNum}">수정하기</a>
				<a href="onDelete?onNum=${onlineboardDTO.onNum}">삭제</a>&nbsp;&nbsp;
				<input type="button" onclick="location.href='onReplyView?onNum=${onlineboardDTO.onNum }'" value="답변하기">
		</se:authorize>
		
				
				
				<a href="onList">목록보기</a>&nbsp;&nbsp;</td>
		</tr>
	</table>
</body>
</html>