<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<script src="./resources/js/click_cal.js"></script>
<script type="text/javascript">
	function checkInfo() {
		var userinput = eval("document.input");
		if (!input.id.value) {
			alert("ID를 입력하세요.");
			input.id.focus();
			return false;
		}
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
		if (!input.name.value) {
			alert("이름을 입력하세요.");
			input.name.focus();
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
		if (!input.birth.value) {
			alert("생년월일을 입력하세요.");
			input.birth.focus();
			return false;
		}
		if (!input.gender.value) {
			alert("성별을 입력하세요.");
			input.gender.focus();
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

	<form action="admin_join" method="post" name="input" onSubmit="return checkInfo()">

		<table>

			<tr>
				<td colspan="2" id="title">직원등록<br>
					<hr></td>
			</tr>

			<tr>
							<td>ID</td>
							<td><input type="text" name="id" size="21" maxlength="20">
						</tr>

						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pwd" size="21" maxlength="20"></td>
						</tr>

						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="pwd2" size="21" maxlength="20"></td>
						</tr>

						<tr>
							<td>이름</td>
							<td><input type="text" name="name" size="21" maxlength="10">
							</td>
						</tr>

						<tr>
							<td>E-MAIL</td>
							<td><input type="text" name="email" size="30">&nbsp;
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
							</select>
							- <input type="text" size="2" name="phone2">
							- <input type="text" size="2" name="phone3"></td>
						</tr>

						<tr>
							<td>생년월일</td>
							<td><input type="text" size="21" name="birth" style="text-align: center;" placeholder="연-월-일" OnClick="Calendar(this, 'down','no');"></td>
						</tr>

						<tr>
							<td>성별</td>
							<td><select name="gender">
									<option value="">선택</option>
									<option value="남자">남자</option>
									<option value="여자">여자</option>
							</select></td>
						</tr>

						<tr>
							<td>주소</td>
							<td><input type="text" name="addr" size="50"></td>
						</tr>
						
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
						<td><input type="text" name="part"
							value="${ list.part }"></td>
					</tr>

			<!-- <tr>
					<td>비밀번호 찾기 질문</td>
					<td>
						<select name="pwd_q" onclick="SetEmailTail(emailCheck.options[this.selectedIndex].value)">
							<option value="0">::　　선 택 하 세 요　　::</option>
							<option value="1">가장 기억에 남는 장소는?</option>
							<option value="2">초등학교 이름은?</option>
							<option value="3">중학교 이름은?</option>
							<option value="4">고등학교 이름은?</option>
							<option value="5">아버지 성함은?</option>
							<option value="6">어머니 성함은?</option>
							<option value="7">좋아하는 사람의 이름은?</option>
							<option value="8">좋아하는 애인의 이름은?</option>
							<option value="9">지금 가장 하고 싶은 일은?</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>비밀번호 찾기 답변</td>
					<td>
						<input type="text" name="pwd_a" size="21" maxlength="10">
					</td>
				</tr> -->

			<tr>
				<td colspan="2" id="td_btn"><br>
					<hr> <br> <input type="submit"  value="확인"> &nbsp;
					<input type="reset" value="취소"></td>
			</tr>

		</table>
	</form>
</body>

</html>