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
	$(document).ready(function() {
		$('#patronview').hide();
	});

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
		var _appointday = $("#datepicker").val(); //id값호출
		var _patron = $("#patron").val();
		var _appointhour = $("select[name=hour]").val(); //name값 호출
		var _memberconsult = $("input[type=radio][name=memberconsult]:checked")
				.val();
		var _consulttype = $("input[type=radio][name=consulttype]:checked")
				.val();
		$.ajax({
			type : "POST",
			url : url,
			data : {
				patron : _patron,
				appointday : _appointday,
				appointhour : _appointhour,
				memberconsult : _memberconsult,
				consulttype : _consulttype

			}, //post 형식 전송형태 data: {인자명 : 데이터, num:num},
			success : function(msg) {
				$("#scheduleview3").html(msg);
			}
		});
	};

	var ajaxselect2 = function(url) { //????
		var _patron = $("#patron").val(); //id값호출

		$.ajax({
			type : "POST",
			url : url,
			data : {
				patron : _patron
			}, //post 형식 전송형태 data: {인자명 : 데이터, num:num},
			success : function(msg) {
				$("#patronview").html(msg);
			}
		});
	};

	$(function() {
		$('#group').click(function() {
			$('#patronview').show();
		});
	});

	$(function() {
		$('#close').click(function() {
			$('#patronview').hide();
		});
	});

	$(function() {
		$('#submit').click(function() {
			$('#patronview').hide();
		});
	});

	$(function() {
		$('#individual').click(function() {
			$('#patronview').hide();
			var _patron = $("#patron").val('');
		});
	});
</script>
<style type="text/css">
#resultxx {
	width: 300px;
	height: 250px;
	background-color: gray;
}

#schedule {
	margin-left: 50px;
	margin-top: 50px;
}

#scheduleview {
	width: 200px;
	height: 310px;
	border: 1px solid #000;
	float: left;
}

#scheduleview2 {
	width: 200px;
	height: 310px;
	left: 200px;
	border: 1px solid #000;
	float: left;
}

#scheduleview3 {
	width: 300px;
	height: 310px;
	left: 400px;
	border: 1px solid #000;
	float: left;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" value="${hour}" id="hourcheck">
	<input type="hidden" value="${consulttype}" id="concheck">
	<div id='schedule'>

		<div id='scheduleview'>
			<p>
				예약날짜 <input type="text" id="datepicker" name="appointday"
					onchange="ajaxselect('testresult')" value="${appointday}" />
			</p>

			<br> 희망시간 <select name="hour"
				onchange="ajaxselect('testresult')">
				<option value="09">09시
				<option value="10">10시
				<option value="11">11시
				<option value="12">12시
				<option value="13">13시
				<option value="14">14시
				<option value="15">15시
				<option value="16">16시
			</select> <br> <br> <br> 상담유형을 선택하세요 <br> <input
				type="radio" id="individual" name="consulttype" value="개인상담"
				onchange="ajaxselect('testresult')" checked="checked">개인 <br>
			<br> <input type="radio" id="group" name="consulttype"
				value="집단상담" onchange="ajaxselect('testresult')">집단



			<div id="patronview">
				보호자를 등록해주세요<br> <input type="text" id="patron" name="patron"
					checked="checked"> <br>
			</div>


		</div>
		<!-- scheduleview -->


		<div id='scheduleview2'>
			<input type="radio" name="memberconsult" value="offline"
				onchange="ajaxselect('testresult')" checked="checked">오프라인상담
			<br> <input type="radio" name="memberconsult" value="online"
				onchange="ajaxselect('testresult')">온라인상담
		</div>


		<div id='scheduleview3'>예약</div>


	</div>


</body>
</html>