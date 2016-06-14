<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	
</script>
<style type="text/css">
#enrollview {
	width: 300px;
	height: 400px;
	background: #eaeaea;
	color: #ggg;
	position: absolute;
	top: 10px;
	left: 100px;
	text-align: center;
	border: 2px solid #000;
}
</style>
<body>
	희망하신 날짜는 ${appointday} , 시간은 ${appointhour}시입니다. 상담유형은 ${consulttype}
	상담방식은 ${memberconsult} ,보호자는 ${patron},${resertype}
	<br>
	<hr>
	<br>

	<c:if test="${memberconsult == 'offline'}">

		<table border="1">
			<tr>
				<td>예약유무</td>
			</tr>

			<tr>
				<c:forEach items="${list}" var="sdto">
					<tr>
						<td><a
							href="pay?employeeid=${sdto.employeeid}&appointtime=${appointtime}&appointday=${appointday}&consulttype=${consulttype}&categoryprice=${categoryprice}&resertype=${resertype}">결제하기</a></td>
					</tr>
				</c:forEach>
		</table>


	</c:if>


	<c:if test="${memberconsult == 'online'}">
		<table border="1">
			<tr>
				<td>선생님이름</td>
				<td>test</td>
			</tr>

			<tr>
				<c:forEach items="${list}" var="sdto">
					<tr>
						<td>${sdto.employeeid}</td>
						<td><a
							href="result?employeeid=${sdto.employeeid}&appointtime=${appointtime}
		&appointday=${appointday}&consulttype=${consulttype}&patron=${patron}&categoryprice=${categoryprice}&resertype=${resertype}">등록</a>

							<%-- <a href="pay?employeeid=${sdto.employeeid}&appointtime=${appointhour}
		&appointday=${appointday}&consulttype=${consulttype}&patron=${patron}&categoryprice=${categoryprice}&resertype=${resertype}">등록</a> --%>

						</td>
					</tr>
				</c:forEach>
		</table>
	</c:if>



</body>
</html>