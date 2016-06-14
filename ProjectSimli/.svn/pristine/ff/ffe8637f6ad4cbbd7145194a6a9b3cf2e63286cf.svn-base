<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="se"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta 109</title>
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

.pagination li {
	list-style: none;
	display: inline-block;
}
</style>
</head>
<body>
	<h2>쪽지 보관함</h2>

	<c:if test="${ count > 0 }">
		<fmt:parseNumber var="pageCount"
			value="${count / dto.pageSize + (count % dto.pageSize == 0? 0:1) }"
			integerOnly="true" />
		<c:set var="startPage" value="${1 }" />
		<c:set var="pageBlock" value="${5 }" />

		<fmt:parseNumber var="result" value="${dto.currentPage / pageBlock }"
			integerOnly="true" />

		<c:if test="${dto.currentPage % pageBlock != 0 }">
			<c:set var="startPage" value="${result * pageBlock +1 }" />
		</c:if>
		<c:if test="${dto.currentPage % pageBlock == 0 }">
			<c:set var="startPage" value="${(result-1) * pageBlock +1 }" />
		</c:if>

		<c:set var="endPage" value="${startPage + pageBlock -1 }" />

		<c:if test="${endPage > pageCount }">
			<c:set var="endPage" value="${pageCount }" />
		</c:if>

	</c:if>

	<table align="center" style="padding-bottom: 50px;">
		<tr id="toptable">
			<td width="100px">보낸 아이디</td>
			<td width="300px;">제목</td>
			<td width="150px">날짜</td>
			<td width="50px;">삭제</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.fromid}</td>
				<td><a href="smscontent?num=${dto.num}">${dto.smstitle}</a></td>
				<td><fmt:formatDate value="${dto.smstime}" pattern="yyyy-MM-dd" /></td>
				<td><a href="smsdelete?num=${dto.num}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>

	<div align="center">
		<nav>
			<ul class="pagination">
				<c:if test="${startPage > pageBlock }">
					<li class="disabled"><a href="onList?pageNum=${startPage-5}"
						aria-label="Previous"> <span aria-hidden="true">[이전]</span>
					</a></li>
				</c:if>

				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<li><a href="onList?pageNum=${i }"> ${i } <span
							class="sr-only">(current)</span>
					</a></li>
				</c:forEach>

				<c:if test="${endPage < pageCount }">
					<li><a href="onList?pageNum=${startPage+5 }" aria-label="Next">
							<span aria-hidden="true">[다음]</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
	</div>

</body>
</html>