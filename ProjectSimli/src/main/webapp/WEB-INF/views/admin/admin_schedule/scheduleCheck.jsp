<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta 109</title>
</head>
<body>
<h1>선생님 스케줄</h1>
	<table width="500" cellpadding="0" cellspacing="0" border="1"
		align="center">
		<tr>
			<td>선생님</td>
			<td>월</td>
			<td>화</td>
			<td>수</td>
			<td>목</td>
			<td>금</td>
			<td>토</td>
		</tr>

		<c:forEach items="${scheduleList}" var="dto">
			<tr>
			
				<td>${dto.employeeid}</td>
				<td>${dto.mon_s} ~<br/>${dto.mon_e}</td>
				<td>${dto.thu_s} ~<br/>${dto.thu_e}</td>
				<td>${dto.wed_s} ~<br/>${dto.wed_e}</td>
				<td>${dto.thr_s} ~<br/>${dto.thr_e}</td>
				<td>${dto.fri_s} ~<br/>${dto.fri_e}</td>
				<td>${dto.sat_s} ~<br/>${dto.sat_e}</td>

			</tr>
		</c:forEach>
	</table>
</body>
</html>