<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	희망하신 날짜는 ${appointday} , 시간은 ${appointhour}시입니다. 검사방식은 ${resertype}
	<br>
	<hr>
	<br>
	<table border="1">
			<tr>
				<td>선생님이름</td>
				<td>test</td>
			</tr>

			<tr>
				<c:forEach items="${list}" var="sdto">
					<tr>
						<td>${sdto.employeeid}</td>
						<td><a
							href="exresult?employeeid=${sdto.employeeid}&appointtime=${appointhour}&appointday=${appointday}">선택하기</a></td>
					</tr>
				</c:forEach>
		</table>


</body>
</html>