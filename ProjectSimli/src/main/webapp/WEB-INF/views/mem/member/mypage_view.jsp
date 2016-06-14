<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="se"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kosta th109</title>
</head>

<body>

	<table border="1">
	
		<tr>
			<td colspan="2" id="title">My Page<br>
				<hr>
			</td>
		</tr>

		<c:forEach items="${ list  }" var="list">

			<tr>
				<td>ID</td>
				<td>${ list.id }</td>
			</tr>

			<tr>
				<td>이름</td>
				<td>${ list.name }</td>
			</tr>
			
			<tr>
			<td>E-MAIL</td>
			<td>${ list.email }</td>
			</tr>

			<tr>
				<td>핸드폰번호</td>
				<td>${ list.phone }</td>
			</tr>

			<tr>
				<td>생년월일</td>
				<td>${ list.birth }</td>
			</tr>

			<tr>
				<td>성별</td>
				<td>${ list.gender }</td>
			</tr>

			<tr>
				<td>주소</td>
				<td>${ list.addr }</td>
			</tr>

			<se:authorize access="hasRole('ROLE_EMPLOYEE')">
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
			</se:authorize>

			<tr>
				<td colspan="2">
				
				<a href="modify_view">정보수정</a>
				<se:authorize access="hasRole('ROLE_PKUSER')">
				<a href="member_delete">탈퇴하기</a>
				</se:authorize>
				
				<se:authorize access="hasRole('ROLE_ADMIN')">
						<a href="member_list">회원목록</a>
				</se:authorize>
				
				</td>
			</tr>
			
		</c:forEach>
	</table>
</body>
</html>