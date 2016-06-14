<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var ajaxpay = function(url) {
		var year = $("#yearChoice option:selected").val();
		var month = $("#monthChoice option:selected").val();
		$.ajax({
			type : "POST",
			url : url,
			data : {
				year : year,
				month : month
			}, //post 형식 전송형태 data: {인자명 : 데이터, num:num},
			success : function(msg) {
				$("#payDetail").html(msg);
			}
		});
	};
</script>
</head>
<body>
<h1>수당확인</h1>
	<div id="test">
		<select id="yearChoice">
			<option value="">년도선택</option>
			<c:forEach var="i" begin="2016" end="2030" step="1">
				<option value="${i}">${i}</option>
			</c:forEach>
		</select>
		<select id="monthChoice">
			<option value="">월선택</option>
			<c:forEach var="i" begin="1" end="12" step="1">
				<option value="${i}">${i}</option>
			</c:forEach>
		</select> 
		<input type="button" value="search"
			onclick="ajaxpay('payConfirm_Employee_Detail')" />
	</div>
	<div id="payDetail">입력받은 값이 없습니다.</div>
</body>
</html>



