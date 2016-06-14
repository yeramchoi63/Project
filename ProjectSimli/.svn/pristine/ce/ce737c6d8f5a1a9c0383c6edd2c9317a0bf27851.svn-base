<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se" %>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Waiting Room</title>
	<link type="text/css" rel="stylesheet" href="./resources/css/flipclock.css" />
	<style type="text/css">
		#chatIndex td {
		    border-color: gray;
		    border-spacing: 2px;
		    border-bottom: #27ae60 3px solid;
	    }
		#chatIndex th {
			background-color: #2ecc71;
			border: #2ecc71;
			border-radius: 3px;
			border-bottom: #27ae60 3px solid;
		}
	
	</style>
</head>

<body>
	<!-- 채팅 대기 화면 : ~채팅 끝나기 전 -->
	<div id="ChatInfoTable" style="display: none;">
		<table width=1050 border=0 align="center">
			<tr height=40>
			</tr>
			<tr>
				<!-- Round Clock -->
				<td width=30%>
					<canvas id="canvas" width="200" height="200" style="background-color:#333"></canvas>
					<script src="./resources/js/roundClockInChatroom.js"></script>
				</td>
			
				<!-- 상담 일시 및 대상 -->
				<td width=50%>
					<table id="chatIndex" align="center" width=300>
						<tr valign="top" >
							<th rowspan=2><b>예약일</b></th><td>${apYear }년 ${apMon }월 ${apDate }일</td>
						</tr>
						<tr>
							<td>${apHour }시 ${apMin }분 </td>
						</tr>
						<tr>
							<th><b>상담유형</b></th><td>${consultType }</td>
						</tr>
						<tr>
							<th><b>내담자</b></th><td>${memName } </td>
						</tr>
						<tr>
							<th><b>상담자</b></th><td>${empName } </td>	
						</tr>
						<tr>
							<th><b>참가자</b></th><td>${ptnName } </td>	
						</tr>
					</table>
				</td>
				<td width=20% align="center">
					<div id="chatStartBtn"></div>
					<style>
						#chatstartBtn {
							background-image: url("./resources/images/tree.jpg");
							background-size: 100% 100%;
							background-repeat: no-repeat;
						}
					</style>
					<h2 style="color:red;">채팅화면 바로 가기</h2></p>
					<a href="Chat_WebCam?num=${num}" id="goChat">클릭!</a>
					<style text="text/css">
						#goChat {
							font-size: 250%;
						}
					</style>
					<!-- <input type="button" onclick="location.href='Chat_WebCam'" value="클릭!" id="goChat"> -->
				</td>
			</tr>		
			<!-- Countdown Timer -->
			<tr height=200>
				<td align="center" valign="middle">
					<h1>채팅상담 시작까지</h1>
				</td>
				<td align="left" colspan=2>
					<!-- flip countdown -->
					<div class="clock-builder-output"></div>
				</td>
			</tr>
		</table>	
	</div>
	
	<!-- 채팅 시간 지난 후 -->
	<div id="FinishMessage" style="display: none;">
		<h1>상담 시간이 종료되었습니다.</h1>
	</div>
	<!-- 채팅 예약 시간  타이머 -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="./resources/js/flipclock.js"></script>
	<style text="text/css">
		body .flip-clock-wrapper ul li a div div.inn, 
		body .flip-clock-small-wrapper ul li a div div.inn { 
			color: #CCCCCC; 
			background-color: #333333; 
		} 
		body .flip-clock-dot, 
		body .flip-clock-small-wrapper .flip-clock-dot { 
			background: #323434; 
		} 
		body .flip-clock-wrapper .flip-clock-meridium a, 
		body .flip-clock-small-wrapper .flip-clock-meridium a { 
			color: #323434; 
		}
	</style>
	
	<input type="hidden" value="${ChatDate }" id="cDate">
	
	<script type="text/javascript">
		
		//var d1 = Date.parse('06 02 12:09:44 +0900 2016')/1000;
		var d1 = Date.parse(document.getElementById("cDate").value)/1000;
		/* alert(d1); */
		
		$(function(){
			FlipClock.Lang.Custom = { days:'일', hours:'시간', minutes:'분', seconds:'초' };
			var opts = {
				clockFace: 'DailyCounter',
				countdown: true,
				language: 'Custom'
			};
			//var countdown = 1466730000 - ((new Date().getTime())/1000); // from: 06/24/2016 10:00 am +0900
			var countdown = d1 - ((new Date().getTime())/1000); // from: 06/24/2016 10:00 am +0900
			
			if (countdown<=0 && countdown>-3000) {
				console.log(countdown);
				console.log("채팅화면 이동해야함");
				document.getElementById("ChatInfoTable").style.display ='block';
				document.getElementById("FinishMessage").style.display ='none';
			} else if (countdown<= -3000){
				console.log(countdown);
				console.log("상담시간이 지났음");
				
				document.getElementById("ChatInfoTable").style.display ='none';
				document.getElementById("FinishMessage").style.display ='block';
			} else {
				console.log("카운트다운");
				countdown = Math.max(1, countdown);
				$('.clock-builder-output').FlipClock(countdown, opts);
				document.getElementById("ChatInfoTable").style.display ='block';
				document.getElementById("FinishMessage").style.display ='none';
			}
			
		});
	</script>
	
</body>
</html>