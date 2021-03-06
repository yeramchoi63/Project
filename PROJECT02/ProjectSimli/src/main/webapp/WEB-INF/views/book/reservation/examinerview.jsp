<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>검사하기</head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
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
		var _appointday = $("#datepicker").val(); //id값호출
		var _appointhour = $("select[name=hour]").val(); //name값 호출
		var _resertype = $("input[type=radio][name=resertype]:checked")
				.val();
		$.ajax({
			type : "POST",
			url : url,
			data : {
				resertype : _resertype,
				appointday : _appointday,
				appointhour : _appointhour
			}, //post 형식 전송형태 data: {인자명 : 데이터, num:num},
			success : function(msg) {
				$("#scheduleview3").html(msg);
			}
		});
	};
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

	<div id='schedule'>

		<div id='scheduleview'>
			<p>
				검사예약날짜 <input style="" type="text" id="datepicker" name="appointday"
					onchange="ajaxselect('examinerresult')" />
			</p>

			<br> 검사희망시간 <select name="hour"
				onchange="ajaxselect('examinerresult')">
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
		<!-- scheduleview -->


		<div id='scheduleview2'>
			<input type="radio" name="resertype" value="종합심리검사"
				onchange="ajaxselect('examinerresult')" checked="checked">종합심리검사 <br><br>
				
			<input type="radio" name="resertype" value="성격유형검사"
				onchange="ajaxselect('examinerresult')">성격유형검사 <br><br>
				
			<input type="radio" name="resertype" value="학습 및 진로검사"
				onchange="ajaxselect('examinerresult')" checked="checked">학습 및 진로검사 <br><br>
				
			<input type="radio" name="resertype" value="놀이평가"
				onchange="ajaxselect('examinerresult')">놀이평가 <br><br>
				
				
			<input type="radio" name="resertype" value="영유아발달검사"
				onchange="ajaxselect('examinerresult')" checked="checked">영유아발달검사 <br><br>
				
			<input type="radio" name="resertype" value="주의집중력검사"
				onchange="ajaxselect('examinerresult')">주의집중력검사 <br><br>
		</div>


		<div id='scheduleview3'>result</div>
	
	</div>


</body>
</html>