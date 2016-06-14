<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<div>
	<table border="1" width="100%">
		<tr>
			<td>등록일</td>
			<td>내담자 성함</td>
			<td>선생님 성함</td>
			<td>예약 날짜</td>
			<td>예약 요일</td>
			<td>예약 시간</td>
			<td>개인/집단</td>
			<td>상담/치료/검사</td>
			<td>상담 방법</td>
			<td>보호자</td>
			<td>가격</td>
		</tr>
		<c:forEach items="${reserList}" var="dto">
		<tr>
			<td><fmt:formatDate value="${dto.currentday}" pattern="yyyy-MM-dd" /></td>
			<td>${dto.memname}</td>
			<td>${dto.empname}</td>
			<td>
				<fmt:parseDate value="${dto.appointday}" pattern="yyyy-MM-dd" var="appointday" />
				<fmt:formatDate value="${appointday}" pattern="yyyy-MM-dd" />
			</td>
			<td>${dto.appointweek}</td>
			<td>${dto.ahour} 시 ${dto.aminute} 분</td>
			<td>${dto.consulttype}</td>
			<td>${dto.resertype}</td>
			<td>${dto.memberconsult}</td>
			<td>${dto.patron}</td>
			<td>${dto.categoryprice}</td>
		</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>