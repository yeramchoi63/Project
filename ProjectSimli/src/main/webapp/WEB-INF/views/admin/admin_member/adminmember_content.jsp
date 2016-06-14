<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kosta th109</title>
</head>

<script src="./resources/js/click_cal.js"></script>

<body>


	<table border="1">
		<c:forEach items="${ list }" var="list">
			<tr>
				<td>ID</td>
				<td>${ list.id }</td>
			</tr>
			
			<tr>
				<td>PASSWORD</td>
				<td>${ list.pwd }</td>
			</tr>

			<tr>
				<td>NAME</td>
				<td>${ list.name }</td>
			</tr>

			<tr>
				<td>E-MAIL</td>
				<td>${ list.email }</td>
			</tr>

			<tr>
				<td>PHONE</td>
				<td>${ list.phone }</td>
			</tr>

			<tr>
				<td>성별</td>
				<td>${ list.gender }</td>
			</tr>

			<tr>
				<td>BIRTH</td>
				<td>${ list.birth }</td>
			</tr>

			<tr>
				<td>주소</td>
				<td>${ list.addr }</td>
			</tr>

			<tr>
				<td>THERAPY1</td>
				<td>${ list.therapy1 }</td>
			</tr>

			<tr>
				<td>THERAPY2</td>
				<td>${ list.therapy2 }</td>
			</tr>

			<tr>
				<td>THERAPY3</td>
				<td>${ list.therapy3 }</td>
			</tr>

			<tr>
				<td>PART</td>
				<td>${ list.part }</td>
			</tr>

			<tr>
				<td>가입일자</td>
				<td>${ list.mem_date }</td>
			</tr>

			<tr>
				<td colspan="2">
				<a href="${pageContext.request.contextPath}/adminpage_view">관리자 홈</a>
				<a href="adminmlistmodify_view?id=${list.id}">수정하기</a>
				<a href="adminmlist_delete?id=${list.id}">강퇴하기</a>
				<a href="${pageContext.request.contextPath}/adminmember_list">회원목록</a>
				</td>
			</tr>
		</c:forEach>
			
		</table>
	
</body>
</html>