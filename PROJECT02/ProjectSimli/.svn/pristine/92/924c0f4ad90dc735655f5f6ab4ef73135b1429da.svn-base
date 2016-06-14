<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var ajaxUserMoney = function(url) {
		var year = $("#userMoneyYearChoice option:selected").val();
		var month = $("#userMoneyMonthChoice option:selected").val();
		$.ajax({
			type : "POST",
			url : url,
			data : {
				year : year,
				month : month
			}, //post 형식 전송형태 data: {인자명 : 데이터, num:num},
			success : function(msg) {
				$("#userMoneyDetail").html(msg);
			}
		});
	};
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내담자 지불 정보</title>
</head>
<body>
<h1>내담자 지불 정보</h1>
	<div>
		<select id="userMoneyYearChoice" onchange="ajaxUserMoney('user_Money_Detail')">
			<option value="null">년도선택</option>
			<c:forEach var="i" begin="2016" end="2030" step="1">
				<option value="${i}">${i}</option>
			</c:forEach>
		</select>
		<select id="userMoneyMonthChoice" onchange="ajaxUserMoney('user_Money_Detail')">
			<option value="null">월선택</option>
			<c:forEach var="i" begin="1" end="12" step="1">
				<option value="${i}">${i}</option>
			</c:forEach>
		</select>
		<!-- <input type="button" value="search" onclick="ajaxUserMoney('user_Money_Detail')"/> -->
	</div>
	<div id="userMoneyDetail">입력받은 값이 없습니다.</div>
</body>
</html>