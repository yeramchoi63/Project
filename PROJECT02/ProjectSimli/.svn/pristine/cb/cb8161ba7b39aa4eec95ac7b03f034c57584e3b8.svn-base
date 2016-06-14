<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트</title>
</head>
<body>

<table board="1">
	<tr>
			<td>이름</td>
			<td>ID</td>
			<td>성별</td>
			<td>생년월일</td>
			<td>PHONE</td>
			<td>E-MAIL</td>
			<td>주소</td>
			<td>비고</td>
	</tr>
	
		<c:forEach items="${ list }" var="list">
			<tr>
				<td><a href="adminmember_content?id=${ list.id }">${ list.name }</a></td>
				<td>${ list.id }</td>
				<td>${ list.gender }</td>
				<td>${ list.birth }</td>
				<td>${ list.phone }</td>
				<td>${ list.email }</td>
				<td>${ list.addr }</td>
				<td>${ list.part }</td>
			</tr>
		</c:forEach>
		</table>
		
	<a href="${pageContext.request.contextPath}/adminpage_view">관리자 홈</a>

</body>
</html>