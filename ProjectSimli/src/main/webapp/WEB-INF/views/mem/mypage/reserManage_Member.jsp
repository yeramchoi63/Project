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
	<h1>예약 관리</h1>
	
	상담예약리스트
	<table border="1" width="100%">
		<tr>
			<td>등록일</td>
			<td>예약 날짜</td>
			<td>예약 요일</td>
			<td>예약 시간</td>
			<td>상담 방법</td>
			<td>비고란</td>
			<td>상담/치료/검사</td>
			<td>가격</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>

		<c:forEach items="${reserMemberList_counsel}" var="dto">
			<tr>
				<td>${dto.currentday}</td>
				<td>${dto.appointday}</td>
				<td>${dto.appointweek}</td>
				<td>${dto.appointtime}</td>
				<td>${dto.memberconsult}</td>
				<td>${dto.ref}</td>
				<td>${dto.resertype}</td>
				<td>${dto.categoryprice}</td>
				<td><a href="#">수정</a></td>
				<td><a href="reserDelete?reNum=${dto.num}">삭제</a></td>
			</tr>
		</c:forEach>		
	</table>
	치료예약리스트
	<table border="1" width="100%">
		<tr>
			<td>등록일</td>
			<td>예약 날짜</td>
			<td>예약 요일</td>
			<td>예약 시간</td>
			<td>상담 방법</td>
			<td>비고란</td>
			<td>상담/치료/검사</td>
			<td>가격</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>

		<c:forEach items="${reserMemberList_therapy}" var="dto">
			<tr>
				<td>${dto.currentday}</td>
				<td>${dto.appointday}</td>
				<td>${dto.appointweek}</td>
				<td>${dto.appointtime}</td>
				<td>${dto.memberconsult}</td>
				<td>${dto.ref}</td>
				<td>${dto.resertype}</td>
				<td>${dto.categoryprice}</td>
				<td><a href="#">수정</a></td>
				<td><a href="reserDelete?reNum=${dto.num}">삭제</a></td>
			</tr>
		</c:forEach>		
	</table>
	검사예약리스트
	<table border="1" width="100%">
		<tr>
			<td>등록일</td>
			<td>예약 날짜</td>
			<td>예약 요일</td>
			<td>예약 시간</td>
			<td>상담 방법</td>
			<td>비고란</td>
			<td>상담/치료/검사</td>
			<td>가격</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>

		<c:forEach items="${reserMemberList_examine}" var="dto">
			<tr>
				<td>${dto.currentday}</td>
				<td>${dto.appointday}</td>
				<td>${dto.appointweek}</td>
				<td>${dto.appointtime}</td>
				<td>${dto.memberconsult}</td>
				<td>${dto.ref}</td>
				<td>${dto.resertype}</td>
				<td>${dto.categoryprice}</td>
				<td><a href="#">수정</a></td>
				<td><a href="reserDelete?reNum=${dto.num}">삭제</a></td>
			</tr>
		</c:forEach>		
	</table>		
</body>
</html>