<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var ajaxResultPay = function(url) {
		var year = $("#resultYearChoice option:selected").val();
		$.ajax({
			type : "POST",
			url : url,
			data : {
				year : year
			}, //post 형식 전송형태 data: {인자명 : 데이터, num:num},
			success : function(msg) {
				$("#resultPayDetail").html(msg);
			}
		});
	};
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta th109</title>
</head>
<body>
<h1>수당 실적 확인</h1>
	<div>
		<select id="resultYearChoice">
			<option>년도선택</option>
			<c:forEach var="i" begin="2016" end="2030" step="1">
				<option value="${i}">${i}</option>
			</c:forEach>
		</select>
		<input type="button" value="search" onclick="ajaxResultPay('payResultConfirm_Employee_Detail')"/>
	</div>
	<div id="resultPayDetail">입력받은 값이 없습니다.</div>
</body>
</html>