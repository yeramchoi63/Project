<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta 109</title>
</head>
<body>
	<c:set value="${dto}" var="dto" />
	<table align="center" border="1">
		<tr>
			<td>제목</td>
			<td colspan="2">${dto.smstitle}</td>
		</tr>
		<tr>
			<td colspan="3">내용</td>
		</tr>
		<tr>
			<td colspan="3" width="300" height="100">${dto.smscon}</textarea></td>
		</tr>
		<tr>
			<td>보낸 아이디</td>
			<td>${dto.fromid}</td>
			<td><button onclick="rplsend()">답장 보내기</td>
		</tr>
	</table>
	<input type="hidden" value="${dto.fromid}" id="fromid">
</body>
<script type="text/javascript">
	function rplsend() {
		window.open(
				"/simli/rplsend?toid=" + document.getElementById("fromid").value,
				"", "width=500, height=300")
	}
</script>
</html>