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
<div style="position: absolute; left: 220px; top: 200px;">
<table border="1" width="100%">
	<tr>
		<td colspan="14">상담자</td>
	</tr>
	<tr>
		<td> </td>
		<c:forEach var="i" begin="1" end="12">			
			<c:choose>
	      		<c:when test="${highlightMonth==i}">
	      			<td style="background-color:#FAFABF;">${i}월</td>
	     		</c:when>	
	      		<c:otherwise>
	      			<td>${i}월</td>	
	      		</c:otherwise>
  		    	</c:choose>  		    
		</c:forEach>
		<td>총지출액</td>
	</tr>
	<c:forEach var="counselor" items="${counselorList}" varStatus="i">
	<tr>
		<td>${counselor.name}</td>
			<c:forEach begin="0" end="11" var="j">
				<c:choose>
					<c:when test="${highlightMonth==(j+1)}">
						<td style="background-color:#FAFABF;">${(cMonthSum[i.index][j])/2}</td>
					</c:when>
					<c:otherwise>
		      			<td>${(cMonthSum[i.index][j])/2}</td>	
		      		</c:otherwise>	
		      	</c:choose> 
			</c:forEach>
		<td>${(cMonthSumAll[i.index])/2}</td>
	</tr>
	</c:forEach>
	<tr>
		<td>소계</td>
		<c:forEach var="i" begin="0" end="11">
			<c:choose>
				<c:when test="${highlightMonth==(i+1)}">
					<td style="background-color:#FAFABF;">${(allCMonthSum[i])/2}</td>
				</c:when>
				<c:otherwise>
					<td>${(allCMonthSum[i])/2}</td>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<td>${(allCMonthSumAll)/2}</td>
	</tr>
	<tr>
		<td colspan="14">치료자</td>
	</tr>
	<tr>
		<td> </td>
		<c:forEach var="i" begin="1" end="12">			
			<c:choose>
	      		<c:when test="${highlightMonth==i}">
	      			<td style="background-color:#FAFABF;">${i}월</td>
	     		</c:when>	
	      		<c:otherwise>
	      			<td>${i}월</td>	
	      		</c:otherwise>
  		    	</c:choose>  		    
		</c:forEach>
		<td>총지출액</td>
	</tr>
	<c:forEach var="therapist" items="${therapistList}" varStatus="i">
	<tr>
		<td>${therapist.name}</td>
			<c:forEach begin="0" end="11" var="j">
				<c:choose>
					<c:when test="${highlightMonth==(j+1)}">
						<td style="background-color:#FAFABF;">${tMonthSum[i.index][j]/2}</td>
					</c:when>
					<c:otherwise>
		      			<td>${tMonthSum[i.index][j]/2}</td>	
		      		</c:otherwise>	
		      	</c:choose> 
			</c:forEach>
		<td>${(tMonthSumAll[i.index])/2}</td>
	</tr>
	</c:forEach>
	<tr>
		<td>소계</td>
		<c:forEach var="i" begin="0" end="11">
			<c:choose>
				<c:when test="${highlightMonth==(i+1)}">
					<td style="background-color:#FAFABF;">${allTMonthSum[i]/2}</td>
				</c:when>
				<c:otherwise>
					<td>${allTMonthSum[i]/2}</td>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<td>${(allTMonthSumAll)/2}</td>
	</tr>
	<tr>
		<td colspan="14">합계</td>
	</tr>
	<tr>
		<td> </td>
		<c:forEach var="i" begin="1" end="12">			
			<c:choose>
	      		<c:when test="${highlightMonth==i}">
	      			<td style="background-color:#FAFABF;">${i}월</td>
	     		</c:when>	
	      		<c:otherwise>
	      			<td>${i}월</td>	
	      		</c:otherwise>
  		    	</c:choose>  		    
		</c:forEach>
		<td>총 금액</td>
	</tr>
	<tr>
	<td>총 급여</td>
		<c:forEach var="i" begin="0" end="11">
			<c:choose>
				<c:when test="${highlightMonth==(i+1)}">
					<td style="background-color:#FAFABF;">${allEMonthSum[i]/2}</td>
				</c:when>
				<c:otherwise>
					<td>${allEMonthSum[i]/2}</td>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<td>${(allEMonthSumAll)/2}</td>
	</tr>		
</table>
</div>
</body>
</html>