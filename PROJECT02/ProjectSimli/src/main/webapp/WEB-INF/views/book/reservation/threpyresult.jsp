<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	희망하신 치료 날짜는 ${appointday} , 시간은 ${appointtime} , 치료방법은 ${resertype}
	<hr>
	<c:if test="${memberconsult != 'consult therapy'}">
		<table border="1">
		
			<tr>
					<td>선생님목록</td> <td> 예약하기</td>
			</tr>
					<c:forEach items="${list}" var="list">
			<tr>
					<td>${list.employeeid}</td>
					<td><a href="threpyemployenroll?employeeid=${list.employeeid}&appointday=${appointday}&appointtime=${appointtime}&resertype=${resertype}">선택하기</a></td>
			</tr>	
			</c:forEach>
		</table>
	</c:if>
	
	<c:if test="${memberconsult == 'consult therapy'}">
	
	<table border="1">
				<tr>
						<td> 예약하기</td>
				</tr>
						<c:forEach items="${list}" var="list" begin="1" end="1">
				<tr>
						<td><a href="threpyemployenroll?employeeid=${list.employeeid}&appointday=${appointday}&appointtime=${appointtime}&resertype=${resertype}">선택하기</a></td>
				</tr>	
					</c:forEach>
	</table>
	
	</c:if>
</body>
</html>