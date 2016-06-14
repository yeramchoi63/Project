<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>

	<table>
	
		<tr>
			<td colspan="2" id="title" align="center">Admin 정보<br>
			</td>
		</tr>
		
		<c:forEach items="${ list  }" var="list">
		
			<tr>
				<td>ID</td>
				<td>${ list.id }</td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td>${ list.name }</td>
			</tr>
			
			<td>E-MAIL</td>
					<td>
						${ list.email }
					</td>
				</tr>
				
				<tr>
					<td>핸드폰번호</td>
					<td>
						${ list.phone }
					</td>
				</tr>
				
				<tr>
					<td>생년월일</td>
					<td>${ list.birth }</td>
				</tr>
				
				<tr>
					<td>성별</td>
					<td>${ list.gender }</td>
				</tr>
				
				<tr>
					<td>주소</td>
					<td>
						${ list.addr }
					</td>
				</tr>
			
			<tr>
				<td>THERAPY1</td>
				<td>${ list.therapy1 }</td>
			</tr>

			<tr>
				<td>THERAPY2</td>
				<td>${ list.therapy2 }</td>
			</tr>

			<tr>
				<td>THERAPY3</td>
				<td>${ list.therapy3 }</td>
			</tr>
			
			<tr>
				<td>PART</td>
				<td>${ list.part }</td>
			</tr>
			
			<tr>
				<td>가입일자</td>
				<td>
					${ list.mem_date }
				</td>
			</tr>
			
				<tr>
					<td colspan="2">
						<a href="${pageContext.request.contextPath}/adminmodify_view">정보수정</a>
					</td>
					
				</tr>
				
		</c:forEach>
		
	</table>
	
</body>
</html>