<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta th109</title>
</head>
<body>
<center>
<br>
<table border="1" width="100%">
	<c:if test="${part=='상담사'}">
	<tr>
		<td rowspan="2">내용</td>
		<td rowspan="2">상세</td>
		<td colspan="12">횟수</td>
		<td rowspan="2">총횟수</td>
	</tr>
	<tr>
		<c:forEach var="i" begin="1" end="12" >
  			<td>${i}월</td>
		</c:forEach>
	</tr>
	<tr>
		<td>개인상담</td>
		<td>상담</td>
		<c:forEach var="i" items="${indiviConsultCount}" begin="0" end="11" >
  			<td>${i}</td>
		</c:forEach>
		<td>${indiviConsultCountSum}</td>
	</tr>
	<tr>
		<td></td>
		<td>치료</td>
		<c:forEach var="i" items="${indiviTherapyCount}" begin="0" end="11" >
  			<td>${i}</td>
		</c:forEach>
		<td>${indiviTherapyCountSum}</td>
	</tr>
	<tr>
		<td>부부/집단상담</td>
		<td>상담</td>
		<c:forEach var="i" items="${groupConsultCount}" begin="0" end="11" >
  			<td>${i}</td>
		</c:forEach>
		<td>${groupConsultCountSum}</td>
	</tr>
	<tr>
		<td></td>
		<td>치료</td>
		<c:forEach var="i" items="${groupTherapyCount}" begin="0" end="11" >
  			<td>${i}</td>
		</c:forEach>
		<td>${groupTherapyCountSum}</td>
	</tr>
	<tr>
		<td>심리검사</td>
		<td></td>
		<c:forEach var="i" items="${examinationCount}" begin="0" end="11" >
  			<td>${i}</td>
		</c:forEach>
		<td>${examinationCountSum}</td>
	</tr>
	<tr>
		<td>총수당</td>
		<td></td>
		<c:forEach var="i" items="${payAllAmount}" begin="0" end="11" >
  			<td>${i}</td>
		</c:forEach>
		<td></td>
	</tr>
	<tr>
		<td>세금</td>
		<td>3.3%</td>
		<c:forEach var="i" items="${payTax}" begin="0" end="11" >
  			<td>${i}</td>
		</c:forEach>
		<td></td>
	</tr>
	<tr>
		<td>실 소득</td>
		<td></td>
		<c:forEach var="i" items="${payRealAmount}" begin="0" end="11" >
  			<td>${i}</td>
		</c:forEach>
		<td></td>
	</tr>
	</c:if>
	<c:if test="${part=='치료사'}">
	<tr>
		<td rowspan="2">내용</td>
		<td rowspan="2">상세</td>
		<td colspan="12">횟수</td>
		<td rowspan="2">총횟수</td>
	</tr>
	<tr>
		<c:forEach var="i" begin="1" end="12" >
  			<td>${i}월</td>
		</c:forEach>
	</tr>
	<tr>
		<td>치료</td>
		<td></td>
		<c:forEach var="i" items="${therapistTherapyCount}" begin="0" end="11" >
  			<td>${i}</td>
		</c:forEach>
		<td>${therapistTherapyCountSum}</td>
	</tr>
	<tr>
		<td>총수당</td>
		<td></td>
		<c:forEach var="i" items="${payAllAmount}" begin="0" end="11" >
  			<td>${i}</td>
		</c:forEach>
		<td></td>
	</tr>
	<tr>
		<td>세금</td>
		<td>3.3%</td>
		<c:forEach var="i" items="${payTax}" begin="0" end="11" >
  			<td>${i}</td>
		</c:forEach>
		<td></td>
	</tr>
	<tr>
		<td>실 소득</td>
		<td></td>
		<c:forEach var="i" items="${payRealAmount}" begin="0" end="11" >
  			<td>${i}</td>
		</c:forEach>
		<td></td>
	</tr>
	</c:if>
</table>
</center>
<h3 align="right">수당실적 ${payRealAmountSum}원</h3>
</body>
</html>