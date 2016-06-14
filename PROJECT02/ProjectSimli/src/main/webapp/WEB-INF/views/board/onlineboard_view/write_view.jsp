<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write_view</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="onWrite" method="post">
			<tr>
				<td>제목</td>
				<td><input type="text" name="onTitle" size="50"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="onName" size="50"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="onContent" rows="10"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="입력">
				&nbsp;&nbsp;<a href="onList">목록</a></td>
			</tr>

		</form>

	</table>

</body>
</html>