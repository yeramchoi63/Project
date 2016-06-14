<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="se"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./resources/css/images.css">
</style>
<title>Notice_ListPage</title>
<style type="text/css">
#toptable {
	background-color: #2ecc71;
}

#toptable td {
	border: #2ecc71;
	border-radius: 3px;
	border-bottom: #27ae60 3px solid;
}

a {
	text-decoration: none;
}
</style>
</head>
<body align="center">
	<h2>Notice List Page</h2>

	<div id="imagewidth">
		<img alt="공지사항게시판" src="./resources/images/sub2_3_contants_1.jpg">
	</div>

	<tr>
		<td colspan="4" style="text-align: right"><b>공지사항</b></a></td>
	</tr>
	<table align="center" style="padding-bottom: 50px;">
		<tr id="toptable">
			<td width="50px;">번호</td>
			<td width="300px;">제목</td>
			<td width="150px">작성자</td>
			<td width="150px">작성일</td>
		</tr>
		<c:forEach items="${ noList }" var="i">
			<tr>
				<td>${ i.noNum}</td>
				<td align="left"><a href="noContentView?noNum=${i.noNum }">${ i.noTitle }</a></td>
				<td>${ i.noName }</td>
				<td><fmt:formatDate value="${i.noDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>

		<se:authorize access="hasRole('ROLE_EMPLOYEE')">
			<tr>
				<td colspan="4" style="text-align: right"><a href="noWriteView">글쓰기</a>
				</td>
			</tr>
		</se:authorize>

	</table>
</body>
</html>