<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내담자</title>
</head>
<body>
<div style="position: absolute; left: 270px; top: 200px;">
<table border="1" width="100%">
	<tr>
		<td>내담자ID</td><td>상담방법</td><td>상담/치료/검사</td>
		<td>개인/집단</td><td>가격</td><td>예약날짜</td>
	</tr>
	<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.memberid}</td>
			<td>${dto.memberconsult}</td>
			<td>${dto.resertype}</td>
			<td>${dto.consulttype}</td>
			<td>${dto.categoryprice}</td>
			<td>${dto.appointday}</td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="6">매출</td>
		</tr>	
		<tr>
			<td colspan="6">총 ${categoryPriceSum} 원</td>
		</tr>
</table>
</div>
</body>
</html>
