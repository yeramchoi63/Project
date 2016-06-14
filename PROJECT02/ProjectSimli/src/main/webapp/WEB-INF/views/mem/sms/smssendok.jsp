<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta 109</title>
</head>
<body style="text-align: center;">
	<h1>메세지 전송이 완료 되었습니다.</h1>
	<br>
	<br>
	<button onclick="closesms()">닫기</button>
</body>
<script type="text/javascript">
	function closesms() {
		opener.document.location.href = "smslist";
		self.close();
	}
</script>
</html>