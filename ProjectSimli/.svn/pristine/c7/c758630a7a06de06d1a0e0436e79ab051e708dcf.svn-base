<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="se"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<title>kosta 109</title>

<script language="JavaScript">
	function PopWin(url, w, h, sb) {
		var newWin;
		var setting = "width=" + w + ", height=" + h
				+ ", top=5, left=20, scrollbars=" + sb;
		newWin = window.open(url, "", setting);
		newWin.focus();
	}
</script>
</head>
<body>



	<%
		Calendar cr = Calendar.getInstance();
		int year = cr.get(Calendar.YEAR);
		int month = cr.get(Calendar.MONTH);
		int date = cr.get(Calendar.DATE);
		String today = year + ":" + (month + 1) + ":" + date; // 오늘 날짜
		// 1일부터 시작하는 달력을 만들기 위해 오늘의 연도,월을 셋팅하고 일부분은 1을 셋팅한다.
		cr.set(year, month, 1);

		// 셋팅한 날짜로 부터 아래 내용을 구함

		// 해당 월의 첫날를 구함
		int startDate = cr.getMinimum(Calendar.DATE);

		// 해당 월의 마지막 날을 구함
		int endDate = cr.getActualMaximum(Calendar.DATE);

		// 1일의 요일을 구함
		int startDay = cr.get(Calendar.DAY_OF_WEEK);
		int count = 0;
	%>
	<table width="400" cellpadding="2" cellspacing="0" border="1"
		align="center">
		<tr height="30">
			<td><font size="2">일</font></td>
			<td><font size="2">월</font></td>
			<td><font size="2">화</font></td>
			<td><font size="2">수</font></td>
			<td><font size="2">목</font></td>
			<td><font size="2">금</font></td>
			<td><font size="2">토</font></td>
		</tr>
		<tr height="30">
			<%
				for (int i = 1; i < startDay; i++) {
					count++;
			%>
			<td>&nbsp;</td>
			<%
				}
				for (int i = startDate; i <= endDate; i++) {
					String bgcolor = (today.equals(year + ":" + (month + 1) + ":" + i)) ? "#CCCCCC" : "#FFFFFF";
					String color = (count % 7 == 0 || count % 7 == 6) ? "red" : "black";
					count++;
			%>
			<td bgcolor="<%=bgcolor%>"><font size="2" color=<%=color%>><%=i%></font></td>
			<%
				if (count % 7 == 0 && i < endDate) {
			%>
		</tr>
		<tr height="30">
			<%
				}
				}
				while (count % 7 != 0) {
			%>
			<td>&nbsp;</td>
			<%
				count++;
				}
			%>
		</tr>
	</table>
	<br>


	<form action="reserManage_Employee" method="post">
		<table>

			<select name="year">
				<option value="">년</option>
				<option value="2016">2016</option>
				<option value="2017">2017</option>
			</select> &nbsp;&nbsp;&nbsp;

			<select name="month">
				<option value="">월</option>
				<option value="01">1월</option>
				<option value="02">2월</option>
				<option value="03">3월</option>
				<option value="04">4월</option>
				<option value="05">5월</option>
				<option value="06">6월</option>
				<option value="07">7월</option>
				<option value="08">8월</option>
				<option value="09">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select> &nbsp;&nbsp;&nbsp;

			<select name="day">
				<option value="">일</option>
				<option value="01">1일</option>
				<option value="02">2일</option>
				<option value="03">3일</option>
				<option value="04">4일</option>
				<option value="05">5일</option>
				<option value="06">6일</option>
				<option value="07">7일</option>
				<option value="08">8일</option>
				<option value="09">9일</option>
				<option value="10">10일</option>
				<option value="11">11일</option>
				<option value="12">12일</option>
				<option value="13">13일</option>
				<option value="14">14일</option>
				<option value="15">15일</option>
				<option value="16">16일</option>
				<option value="17">17일</option>
				<option value="18">18일</option>
				<option value="19">19일</option>
				<option value="20">20일</option>
				<option value="21">21일</option>
				<option value="22">22일</option>
				<option value="23">23일</option>
				<option value="24">24일</option>
				<option value="25">25일</option>
				<option value="26">26일</option>
				<option value="27">27일</option>
				<option value="28">28일</option>
				<option value="29">29일</option>
				<option value="30">30일</option>
				<option value="31">31일</option>
			</select> &nbsp;&nbsp;&nbsp;

			<input type="submit" value="확인">

		</table>
	</form>

	
			<table border="1" width="100%">
				<tr class="alert alert-success">
					<td>등록일</td>
					<td>내담자ID</td>
					<td>예약 날짜</td>
					<td>예약 요일</td>
					<td>예약 시간</td>
					<td>상담 방법</td>
					<td>비고란</td>
					<td>상담/치료/검사</td>
					<td>가격</td>
					<td>수정</td>
					<td>채팅</td>
				</tr>
				
				<c:forEach items="${reserEmployeeList}" var="dto">

				<tr>
					<td class="alert alert-danger"><fmt:formatDate
							value="${dto.currentday}" pattern="yyyy-MM-dd" /></td>
					<td class="alert alert-warning">${dto.memberid}</td>
					<td class="alert alert-danger"><fmt:parseDate
							value="${dto.appointday}" pattern="yyyy-MM-dd" var="appointday" />
						<fmt:formatDate value="${appointday}" pattern="yyyy-MM-dd" /></td>
					<td class="alert alert-warning">${dto.appointweek}</td>
					<td class="alert alert-danger">${dto.appointtime}</td>
					<td class="alert alert-warning">${dto.memberconsult}</td>
					<td class="alert alert-danger">${dto.ref}</td>
					<td class="alert alert-warning">${dto.resertype}</td>
					<td class="alert alert-danger">${dto.categoryprice}</td>
					<td class="alert alert-warning"><a
						href="javascript:PopWin('reserManage_Employee_UpdateForm?reNum=${dto.num}&reRef=${dto.ref}','400','400','no');">수정</a></td>
					<td class="alert alert-danger"><a
						href="Chat_0_Waiting?num=${dto.num}">채팅상담</a></td>
				</tr>
				</c:forEach>
			</table>

	



</body>
</html>