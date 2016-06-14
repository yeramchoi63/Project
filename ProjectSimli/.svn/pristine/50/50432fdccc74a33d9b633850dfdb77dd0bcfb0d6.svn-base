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
			<td>ID</td>
			<td>이름</td>
			<td>E-MAIL</td>
			<td>PHONE</td>
	</tr>
	
		<c:forEach items="${ list }" var="list">
			<tr>
				<td>${ list.id }</td>
				<td><a href="adminmember_content?id=${ list.id }">${ list.name }</a></td>
				<td>${ list.email }</td>
				<td>${ list.phone }</td>
			</tr>
		</c:forEach>
		</table>
		
	<a href="${pageContext.request.contextPath}/adminpage_view">관리자 홈</a>

</body>
</html>