<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kosta th109</title>
</head>

<script type="text/javascript">
	
	function checkInfo() {
		var userinput = eval("document.input");
		if (!input.pwd.value) {
			alert("비밀번호를 입력하세요.");
			input.pwd.focus();
			return false;
		}
		if (input.pwd.value != userinput.pwd2.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			input.pwd2.focus();
			return false;
		}
		if (!input.email.value) {
			alert("이메일을 입력하세요.");
			input.email.focus();
			return false;
		}
		if (!input.phone1.value) {
			alert("전화번호를 입력하세요.");
			input.phone2.focus();
			return false;
		}
		if (!input.phone2.value) {
			alert("전화번호를 입력하세요.");
			input.phone2.focus();
			return false;
		}
		if (!input.phone3.value) {
			alert("전화번호를 입력하세요.");
			input.phone3.focus();
			return false;
		}
		if (!input.addr.value) {
			alert("주소를 입력하세요.");
			input.addr.focus();
			return false;
		}
	}
</script>

<body>

	<c:set var="dbpwd" value="${dbpwd}" />
	<c:set var="inputpwd" value="${ inputpwd }" />
	<c:set var="temp" value="" />

	<c:if test="${ dbpwd == inputpwd }">
		<form action="member_modify" method="post" name="input"
			onSubmit="return checkInfo()">
			<table border="1">
				<tr>
					<td colspan="2" id="title">정보수정<br>
						<hr>
					</td>
				</tr>

				<c:forEach items="${ list  }" var="list">

					<tr>
						<td>ID</td>
						<td>${ list.id }<font color="red">&nbsp;[수정불가]</font> <input
							type="hidden" value="${ list.id }" name="id">
						</td>

					</tr>

					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pwd" size="21"
							maxlength="12"></td>
					</tr>

					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="pwd2" size="21"
							maxlength="12"></td>
					</tr>

					<tr>
						<td>이름</td>
						<td>${ list.name }<font color="red">&nbsp;[수정불가]</font>
						</td>
					</tr>

					<tr>
						<td>E-MAIL</td>
						<td><input type="text" value="${ list.email }" name="email" />
						</td>
					</tr>

					<tr>
						<td>핸드폰번호</td>
						<td><select name="phone1">
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> <script type="text/javascript">
							document.input.phone1.value = "${ phone1 }";
						</script> - <input type="text" size="2" value="${ phone2 }" name="phone2">
							- <input type="text" size="2" value="${ phone3 }" name="phone3"></td>
					</tr>

					<tr>
						<td>생년월일</td>
						<td>${ list.birth }<font color="red">&nbsp;[수정불가]</font>
						</td>
					</tr>

					<tr>
						<td>성별</td>
						<td>${ list.gender }<font color="red">&nbsp;[수정불가]</font>
						</td>
					</tr>

					<tr>
						<td>주소</td>
						<td><input type="text" name="addr" size="50"
							value="${ list.addr }"></td>
					</tr>

					<se:authorize access="hasRole('ROLE_EMPLOYEE')">
						<tr>
							<td>THERAPY1</td>
							<td><input type="text" name="therapy1"
								value="${ list.therapy1 }"></td>
						</tr>

						<tr>
							<td>THERAPY2</td>
							<td><input type="text" name="therapy2"
								value="${ list.therapy2 }"></td>
						</tr>

						<tr>
							<td>THERAPY3</td>
							<td><input type="text" name="therapy3"
								value="${ list.therapy3 }"></td>
						</tr>

						<tr>
							<td>PART</td>
							<td><input type="text" name="part" value="${ list.part }"></td>
						</tr>
					</se:authorize>

					<se:authorize access="hasRole('ROLE_PKUSER')">
						<input type="hidden" name="therapy1" value="${ list.therapy1 }">

						<input type="hidden" name="therapy2" value="${ list.therapy2 }">

						<input type="hidden" name="therapy3" value="${ list.therapy3 }">

						<input type="hidden" name="part" value="${ list.part }">
					</se:authorize>

					<tr>
						<td>가입일자</td>
						<td>${ list.mem_date }</td>
					</tr>

					<tr>
						<td colspan="2"><input type="submit" value="완료"> <a
							href="mypage_view">취소</a></td>
					</tr>

				</c:forEach>
			</table>
		</form>
	</c:if>

	<c:if test="${ empty inputpwd }">
		<form action="modify_view" method="post">
			<table border="1">
			
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd"></td>
				</tr>

				<tr>
					<td colspan="2"><input type="submit" value="확인"> <a
						href="mypage_view"><input type="button" value="취소"></a></td>
				</tr>
				
			</table>
		</form>
	</c:if>

	<c:if test="${ inputpwd !=  temp and dbpwd != inputpwd }">
		<form action="modify_view" method="post">
			<table border="1">
			
				<tr>
					<td colspan="2"><font color="red">비밀번호가 옳바르지 않습니다.</font></td>
				</tr>

				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pwd"></td>
				</tr>

				<tr>
					<td colspan="2"><input type="submit" value="확인"> <a
						href="mypage_view"><input type="button" value="취소"></a></td>
				</tr>
				
			</table>
		</form>
	</c:if>

</body>
</html>