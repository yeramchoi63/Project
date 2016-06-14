<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상담대기목록</title>
</head>
<body>

<table width="500" cellpadding="0" cellspacing="0" border="1" align="center">
		<tr>
			<td>등록일</td>
			<td>회원</td>
			<td>예약날짜</td>
			<td>상담방식</td>
			<td>개인/집단</td>
			<td></td>
		</tr>
		

		
		<c:forEach items="${list}" var="rdto">
			<tr>
				<td>${rdto.currentday}</td>
				<td>${rdto.memberid}</td>
				<td>${rdto.appointday},${rdto.appointtime}</td>
				<td>${rdto.memberconsult}</td>
				<td>${rdto.consulttype}</td>
				<td>
				
				<a href="connection?num=${rdto.num}">접속하기</a></td>
			</tr>
		</c:forEach>

	</table>




</body>
</html>