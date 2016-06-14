<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>content_view</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
			<input type="hidden" name="noNum" value="${noticeDTO.noNum}">
			<tr>
				<td>번호</td>
				<td>제목</td>
			</tr>
			<tr>
				<td>${noticeDTO.noNum}</td>
				<td>${noticeDTO.noTitle}</td>
			</tr>
		<tr>
			<td colspan="2">내용</td>
		</tr>
		<tr>
			<td colspan="2">${noticeDTO.noContent}</td>
		</tr>
		<tr>
			<td colspan="2">
			<se:authorize access="hasRole('ROLE_EMPLOYEE')">
				<a href="noModifyView?noNum=${noticeDTO.noNum}">수정</a>
				<a href="noDelete?noNum=${noticeDTO.noNum}">삭제</a>
			</se:authorize>
				<a href="noList">목록보기</a>
			</td>
		</tr>
		</form>
	</table>
</body>
</html>