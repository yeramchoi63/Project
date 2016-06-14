<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<body>
<center>
<br>
<table border="1">
	<c:if test="${part=='상담사'}">
	<tr>
		<td>내용</td>
		<td>상세</td>
		<td>횟수</td>
		<td>금액(1회)</td>
		<td>금액</td>
		<td>수당</td>
	</tr>
	<tr>
		<td rowspan="2">개인상담</td>
		<td>상담</td>
		<td>${indiviConsultCount}</td>
		<td>100,000</td>
		<td>${indiviConsultCount*indiviPrice}</td>
		<td>${indiviConsultCount*indiviAllowance}</td>
	</tr>
	<tr>
		<td>치료</td>
		<td>${indiviTherapyCount}</td>
		<td>100,000</td>
		<td>${indiviTherapyCount*indiviPrice}</td>
		<td>${indiviTherapyCount*indiviAllowance}</td>
	</tr>
	<tr>
		<td rowspan="2">부부/집단상담</td>
		<td>상담</td>
		<td>${groupConsultCount}</td>
		<td>150,000</td>
		<td>${groupConsultCount*groupPrice}</td>
		<td>${groupConsultCount*groupAllowance}</td>
	</tr>
	<tr>
		<td>치료</td>
		<td>${groupTherapyCount}</td>
		<td>150,000</td>
		<td>${groupTherapyCount*groupPrice}</td>
		<td>${groupTherapyCount*groupAllowance}</td>
	</tr>
	<tr>
		<td>심리검사</td>
		<td> </td>
		<td>${examinationCount}</td>
		<td>400,000</td>
		<td>${examinationCount*examinePrice}</td>
		<td>${examinationCount*examineAllowance}</td>
	</tr>
	<tr>
		<td>합계</td>
		<td> </td>
		<td> </td>
		<td> </td>
		<td>${payAllPrice}</td>
		<td>${payAllAmount}</td>
	</tr>
	<tr>
		<td>세금</td>
		<td>3.30%</td>
		<td> </td>
		<td> </td>
		<td> </td>
		<td>${payTax}</td>
	</tr>
	<tr>
		<td>실 소득</td>
		<td> </td>
		<td> </td>
		<td> </td>
		<td> </td>
		<td>${payRealAmount}</td>
	</tr>
	</c:if>
	<c:if test="${part=='치료사'}">
	<tr>
		<td>내용</td>
		<td>횟수</td>
		<td>금액(1회)</td>
		<td>금액</td>
		<td>수당</td>
	</tr>
	<tr>
		<td>치료</td>
		<td>${therapistTherapyCount}</td>
		<td>100,000</td>
		<td>${therapistTherapyCount*therapyPrice}</td>
		<td>${therapistTherapyCount*therapyAllowance}</td>
	</tr>
	<tr>
		<td>합계</td>
		<td> </td>
		<td> </td>
		<td>${payAllPrice}</td>
		<td>${payAllAmount}</td>
	</tr>
	<tr>
		<td>세금</td>
		<td>3.30%</td>
		<td> </td>
		<td> </td>
		<td>${payTax}</td>
	</tr>
	<tr>
		<td>실 소득</td>
		<td> </td>
		<td> </td>
		<td> </td>
		<td>${payRealAmount}</td>
	</tr>
	</c:if>
</table>
</center>
</body>