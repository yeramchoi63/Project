<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta 109</title>
<style type="text/css">
#sms {
	background-color: #FFD3B0;
	border-radius: 10px;
	border-bottom: 3px #B77956 solid;
	min-height: 250px;
	overflow: auto;
}
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var idok = $("#idok").val();
		if (idok == "no") {
			alert("없는 아이디 입니다.");
		}
	});
</script>
<body>
	<input type="hidden" value="${idok}" id="idok">
	<form action="smssendok">
		<input type="hidden" value="${fromid}" name="fromid">
		<div id="sms">
			<table align="center">
				<tr>
					<td>제목</td>
					<td colspan="2"><input type="text" name="smstitle"
						style="border: 0; background-color: #FFC19E; border-radius: 20px; border-top: 3px #B77956 solid;"></td>
				</tr>
				<tr>
					<td colspan="3">내용</td>
				</tr>
				<tr>
					<td colspan="3"><textarea rows="10" cols="50" name="smscon"
							style="border: 0; background-color: #FFC19E; border-radius: 20px; border-top: 3px #B77956 solid;"></textarea></td>
				</tr>
				<tr>
					<td>받을 아이디</td>
					<c:if test="${toid==null }">
						<td><input type="text" name="toid"
							style="border: 0; background-color: #FFC19E; border-radius: 20px; border-top: 3px #B77956 solid;"></td>
					</c:if>
					<c:if test="${toid!=null }">
						<td><input type="text" disabled="disabled" value="${toid}"
							style="border: 0; background-color: #FFC19E; border-radius: 20px; border-top: 3px #B77956 solid;">
							<input type="hidden" name="toid" value="${toid}"></td>
					</c:if>
					<td><input type="submit" value="보내기"
						style="border: 0; border-bottom: 1px #4B0D00 solid; background-color: #B77956;"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>