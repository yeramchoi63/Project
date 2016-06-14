<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta th109</title>
</head>
<body>
<h1>선생님 예약 현황 수정페이지</h1>
<form action="reserManage_Employee_Update">
	<input type="hidden"  name="reNum" value="${reNum}"/>
		<table width="280" height="230" cellpadding="0" cellspacing="0" border="1"
			align="center">
			<tr height="35">
				<td>비고란</td>
			</tr>
			<tr>
				<td><input type="text" value="${reRef}" name="reRef" style="height:200;"></td>			
			</tr>
		</table>
	<input type="submit" value="수정하기" />
</form>
</body>
</html>