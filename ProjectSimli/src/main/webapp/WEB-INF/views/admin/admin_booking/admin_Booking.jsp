<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
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

	var ajaxaAdminBooking = function(url) {

		var _appointday = $("#datepicker").val(); //id값호출

		$.ajax({
			type : "POST",
			url : url,
			data : {
				appointday : _appointday,
			}, //post 형식 전송형태 data: {인자명 : 데이터, num:num},
			success : function(msg) {
				$("#adminBookingDetail").html(msg);
			}
		});
	};
</script>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<title>예약 현황 페이지</title>
</head>
<body>
<center>
	<h3>예약날짜</h3>
	<div id="datepicker" name="appointday"
		onchange="ajaxaAdminBooking('admin_Booking_Detail')"></div>
	<div id="adminBookingDetail">날짜를 선택해주세요.</div>
</center>
</body>
</html>

