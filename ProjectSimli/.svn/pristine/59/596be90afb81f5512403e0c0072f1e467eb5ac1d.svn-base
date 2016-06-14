<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					changeMonth : true, //월변경가능
					changeYear : true, //년변경가능
					showMonthAfterYear : true, //년 뒤에 월 표시
				});
	});

	var ajaxselect = function(url) {

		var _appointday = $("#datepicker").val();
		var _appointhour = $("select[name=hour]").val();
		var _resertype = $("input[name=resertype]").val()
		$.ajax({
			type : "POST",
			url : url,
			data : {
				appointday : _appointday,
				appointhour : _appointhour,
				resertype : _resertype
			},
			success : function(msg) {
				$("#view").html(msg);
			}
		});
	};

	function nowtime() {
		var today = new Date();
		var lhour = today.getHours();
		var lminute = today.getMinutes();

	}
</script>
<style type="text/css">
#schedule {
	position: absolute;
	margin-left: 50px;
	margin-top: 50px;
}

#schedule2 {
	position: absolute;
	width: 200px;
	height: 310px;
	border: 1px solid #000;
}

#schedule3 {
	position: absolute;
	width: 200px;
	height: 310px;
	left: 200px;
	border: 1px solid #000;
}

#schedule4 {
	position: absolute;
	width: 200px;
	height: 310px;
	left: 400px;
	border: 1px solid #000;
}

#view {
	position: absolute;
	width: 200px;
	height: 310px;
	left: 600px;
	border: 1px solid #000;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" value="${resertype}" name="mlist" />

	<div id='schedule'>

		<div id='schedule2'>
			${id}님의 상담결과 치료방법은 ${mlist}입니다.
			<hr>
			치료를 예약해주세요 !!


		</div>
		<div id='schedule3'>
			<p>
				예약날짜 <input style="" type="text" id="datepicker" name="appointday"
					onchange="ajaxselect('threpyresult')" />
			</p>
			<br> 희망시간 <select name="hour"
				onchange="ajaxselect('threpyresult')">
				<option value="09">09시
				<option value="10">10시
				<option value="11">11시
				<option value="12">12시
				<option value="13">13시
				<option value="14">14시
				<option value="15">15시
				<option value="16">16시
			</select>
		</div>

		<div id='schedule4'>
			치료방법<br>
			<br>
			<br>
			<button>${mlist}</button>
		</div>


		<div id='view'>RESULT(TEST)</div>



	</div>
</body>
</html>