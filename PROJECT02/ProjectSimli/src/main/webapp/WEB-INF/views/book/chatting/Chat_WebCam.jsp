<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se" %>
<!DOCTYPE>
<html>
<head>
	<title>WebCam Chatting</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link type="text/css" rel="stylesheet" href="./resources/css/flipclock.css" />
	<style text="text/css">
		body .flip-clock-wrapper ul li a div div.inn, 
		body .flip-clock-small-wrapper ul li a div div.inn { 
			color: #CCCCCC; background-color: #333333; 
		} 
		body .flip-clock-dot, body .flip-clock-small-wrapper .flip-clock-dot { 
			background: #323434; 
		} 
		body .flip-clock-wrapper .flip-clock-meridium a, 
		body .flip-clock-small-wrapper .flip-clock-meridium a { 
			color: #323434; 
		}
	</style>
	
</head>

<body>
	<!-- ${ChatRoomName } 접속 방제  -->
	<table width=1050 border=1 align="center">
		<tr>
			<td valign="top" width=250 height="155">	
				<!-- Round Clock -->
				<canvas id="canvas" width="200" height="200" style="background-color:#333"></canvas>
				<script src="./resources/js/roundClockInChatroom.js"></script>
			</td>
			<td rowspan=3 width=750>
				<iframe src="https://appear.in/${ChatRoomName }" width="780" height="500" frameborder="0"></iframe>
			</td>
		</tr>
		<tr>
			<td>
				<h1>상담종료까지</h1>
				<div class="clock-builder-output"></div>
			</td>
		</tr>
		<tr>
			<td>
				<table id="chatIndex" align="center" border=1>
						<tr valign="top">
							<td rowspan=2><b>예약일 : </b></td><td>${apYear }년 ${apMon }월 ${apDate }일</td>
						</tr>
						<tr>
							<td>${apHour }시 ${apMin }분 </td>
						</tr>
						<tr>
							<td><b>상담유형 : </b></td><td>${consultType }</td>
						</tr>
						<tr>
							<td><b>내담자 : </b></td><td>${memName } </td>
						</tr>
						<tr>
							<td><b>상담자 : </b></td><td>${empName } </td>	
						</tr>
						<tr>
							<td><b>참가자 : </b></td><td>${ptnName } </td>	
						</tr>
					</table>
			</td>
		</tr>
	</table>

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="./resources/js/flipclock.js"></script>
	
	<input type="hidden" value="${ChatDate2 }" id="cDate">
	<input type="hidden" value="${consultType }" id="cType">

	<script type="text/javascript">
		var d1 = Date.parse(document.getElementById("cDate").value)/1000;
		
		$(function(){
			FlipClock.Lang.Custom = { days:'일', hours:'시간', minutes:'분', seconds:'초' };
			var opts = {
				clockFace: 'HourCounter',
				countdown: true,
				language: 'Custom'
			};
			
			opts.classes = {
					active: 'flip-clock-active',
					before: 'flip-clock-before',
					divider: 'flip-clock-divider',
					dot: 'flip-clock-dot',
					label: 'flip-clock-label',
					flip: 'flip',
					play: 'play',
					wrapper: 'flip-clock-small-wrapper'
				};
			
			var consultType = document.getElementById("cType").value;
			console.log(consultType);
			var timelimit = null; //제한시간
			if (consultType=="개인상담") timelimit=3000; //개인상담은 50분x60초 , 집단상담은 80분x60초
			else timelimit=4800; 
			console.log(timelimit);
			//var countdown = d1 + 3000 - ((new Date().getTime())/1000); // from: 06/24/2016 10:00 am +0900
			var countdown = d1 + timelimit - ((new Date().getTime())/1000); // from: 06/24/2016 10:00 am +0900
			countdown = Math.max(1, countdown);
			$('.clock-builder-output').FlipClock(countdown, opts);
		});
	</script>
</body>
</html>