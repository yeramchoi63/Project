<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta 109</title>
<style type="text/css">
#mainview {
	text-align: center;
	vertical-align: middle;
}

.undermain {
	padding: 25px;
}

#booking {
	width: 500px;
	height: 400px;
	background-color: #A6A6A6;
	border-radius: 150px;
	padding-top: 50px;
	color: white;
}

#bookbtn {
	background-color: gray;
	border: 0;
	width: 100px;
	height: 50px;
	font-size: large;
	border-radius: 10px;
	transition: all 0.5s ease;
	cursor: pointer;
	padding-top: 15px;
}

#bookbtn:HOVER {
	color: black;
}

#choice {
	padding-top: 50px;
}

#onmain {
	border: 3px #A6A6A6 solid;
	border-radius: 10px;
}

#onmain a {
	text-decoration: none;
}

#ontop {
	background-color: #747474;
}

#ontop td {
	border-radius: 5px;
}

.emp-indicators {
	width: 500px;
	text-align: center;
}

.emp-indicators span {
	float: left;
	background-color: #747474;
	margin: 5px;
	padding: 5px 15px 5px 15px;
	border-radius: 20px;
	cursor: pointer;
	color: white;
}

.emp-indicators span:hover {
	background-color: #3E3E3E;
	color: #AAAAAA;
}
</style>
</head>
<body>
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel" style="margin-top: 10px;">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			<li data-target="#carousel-example-generic" data-slide-to="3"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox" align="center"
			style="width: 1300px; height: 400px; margin: auto;">
			<div class="item active">
				<img src="resources/images/main1.jpg" alt="메인사진1" width="100%"
					height="100%">
				<div class="carousel-caption"></div>
			</div>
			<div class="item" align="center">
				<img src="resources/images/tree.jpg" alt="메인사진2" width="100%"
					height="100%">
				<div class="carousel-caption"></div>
			</div>

			<div class="item" align="center">
				<img src="resources/images/main2.jpg" alt="메인사진3" width="100%"
					height="100%">
				<div class="carousel-caption"></div>
			</div>

			<div class="item" align="center">
				<img src="resources/images//employee_introduce/ho.png" alt="메인사진4"
					width="100%" height="100%">
				<div class="carousel-caption"></div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<br>
	<br>
	<div align="center">
		<table>
			<tr>
				<td width="500px" class="undermain">
					<!-- 슬라이드 -->
					<div id="empimg" class="carousel slide" data-ride="carousel">
						<div class="emp-inner" role="listbox" align="center">
							<div class="item active">
								<img src="resources/images/employee_introduce/kull.png"
									alt="이병걸" width="500px">
							</div>
							<div class="item" align="center">
								<img src="resources/images/employee_introduce/jae.png" alt="김욱재"
									width="500px">
							</div>

							<div class="item" align="center">
								<img src="resources/images//employee_introduce/woo.png"
									alt="박준우" width="500px">
							</div>

							<div class="item" align="center">
								<img src="resources/images//employee_introduce/kook.png"
									alt="김대국" width="500px">
							</div>

							<div class="item" align="center">
								<img src="resources/images//employee_introduce/ho.png" alt="김준호"
									width="500px">

							</div>

							<div class="item" align="center">
								<img src="resources/images//employee_introduce/ram.png"
									alt="최예람" width="500px">
							</div>
						</div>
						<div class="emp-indicators" align="center">
							<span data-target="#empimg" data-slide-to="0">이병걸</span> <span
								data-target="#empimg" data-slide-to="1">김욱재</span> <span
								data-target="#empimg" data-slide-to="2">박준우</span> <span
								data-target="#empimg" data-slide-to="3">김대국</span> <span
								data-target="#empimg" data-slide-to="4">김준호</span> <span
								data-target="#empimg" data-slide-to="5">최예람</span>
						</div>
					</div>
				</td>
				<td rowspan="2" align="center" class="undermain" width="500px">
					<div id="booking">
						<form action="reservationview" id="booksys">
							날짜 선택<br>
							<div id="datepicker" name="appointday" align="center" />
							<br>
							<p id="bookbtn" onclick="bookday('reservationview')">예약하기</p>
						</form>
					</div>
				</td>
			</tr>
			<tr>
				<td class="undermain" width="500px">
					<div id="onmain">
						온라인 상담 게시판 <a href="onList"
							style="background-color: #A6A6A6; border-radius: 10px; float: right; padding: 1px; font-size: xx-small; margin: 2px;">더보기+</a>
						<table style="clear: both;">
							<tr id="ontop">
								<td width="50px;">번호</td>
								<td width="300px;">제목</td>
								<td width="150px">작성자</td>
								<td width="150px">작성일</td>
							</tr>
							<c:forEach items="${ onList }" var="i" begin="0" end="4">
								<tr>
									<td>${i.onNum}</td>
									<td align="left"><a href="onContentview?onNum=${i.onNum}">${ i.onTitle}</td>
									<td>${i.onName}</td>
									<td><fmt:formatDate value="${i.onDate}"
											pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="./resources/js/bootstrap.js"></script>
<script src="./resources/js/bootstrap_emp.js"></script>
<script type="text/javascript">
	var _appointday = null;

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

	var bookday = function(url) {
		_appointday = $("#datepicker").val();
		$.ajax({
			type : "POST",
			url : url,
			data : {
				appointday : _appointday
			}, //post 형식 전송형태 data: {인자명 : 데이터, num:num},
			success : function(msg) {
				$(location).attr('href', msg);
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

	$(function() {
		$('#bookbtn').click(function() {
			var appointday = $('#datepicker').val();
			if (appointday == "") {
				alert("날짜를 선택해 주세요");
			} else {
				$('#booksys').submit();
			}
		});
	});
</script>
</html>