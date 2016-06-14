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
<title>OnLineBoard_ListPage</title>
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
<body align="center">
	<h2>OnLineBoard List Page</h2>


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


	<tr>
		<td colspan="5" style="text-align: right"><b>^_^온라인상담^_^</b></a></td>
	</tr>

	<div id="imagewidth">
		<img alt="온라인상담게시판" src="./resources/images/sub2_1_contants_1.jpg">
	</div>

	<table align="center" style="padding-bottom: 50px;">
		<tr id="toptable">
			<td width="50px;">번호</td>
			<td width="300px;">제목</td>
			<td width="150px">작성자</td>
			<td width="150px">작성일</td>
		</tr>

		<c:forEach items="${ onList }" var="i">
			<tr>
				<td>${ i.onNum}</td>
				<td align="left"><a href="onContentview?onNum=${i.onNum }">${ i.onTitle }</td>
				<td>${ i.onName }</td>
				<td><fmt:formatDate value="${i.onDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
		<se:authorize access="hasRole('ROLE_EMPLOYEE')">
			<tr>
				<td colspan="5" style="text-align: right"><a href="onWriteview">글쓰기</a>
				</td>
			</tr>
		</se:authorize>

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