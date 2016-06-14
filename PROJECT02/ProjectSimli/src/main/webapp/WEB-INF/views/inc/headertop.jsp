<%@page import="sun.net.www.protocol.http.AuthCache"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="se"%>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script src="./resources/js/click_cal.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/layout.css">
</style>

<style>
#headertop {
	margin: auto;
	height: 50px;
	text-align: right;
}

#pagemenu li {
	float: left;
	list-style: none;
	margin: 3px;
}

.listdown:HOVER a {
	background-color: #2ecc71;
	border-radius: 3px;
	color: white;
}

#pagemenu li:HOVER ul {
	display: block;
}

#pagemenu li li {
	clear: both;
	list-style: none;
	margin-left: -50px;
	background-color: #2ecc71;
	border-radius: 3px;
}

#pagemenu ul {
	display: none;
	position: absolute;
	z-index: 10;
}

#upmenu {
	float: right;
}
</style>

<div id="headertop">
	<div id="upmenu">
		<ul id="pagemenu">
			<li><a href="/simli/">홈</a></li>

			<c:if test="${empty pageContext.request.userPrincipal}">
				<li><a href="#" onclick="layer_open('layer3');return false;">로그인</a>
					<a href="#" onclick="layer_open('layer2');return false;">회원가입</a></li>
			</c:if>

			<c:if test="${not empty pageContext.request.userPrincipal}">
				<li><se:authentication property="name" var="id" />${id}님
					환영합니다.</li>
				<se:authorize access="hasRole('ROLE_ADMIN')">
					<li class="listdown"><a href="####"
						onClick="window.open('${pageContext.request.contextPath}/adminmember_list','Admin Page',
			'width=1020, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
			return false;">Admin
							Page</a></li>
				</se:authorize>

				<se:authorize access="hasRole('ROLE_PKEMPLOYEE')">
					<li class="listdown">My Page
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/employeepage_view">My
									Page 가기</a></li>
							<li><a href="#" onclick="smssend()">쪽지 보내기</a></li>
							<li><a href="smslist">쪽지 리스트</a></li>
						</ul>
					</li>
				</se:authorize>

				<se:authorize access="hasRole('ROLE_PKUSER')">
					<li class="listdown">My Page
						<ul>
							<li><a href="${pageContext.request.contextPath}/mypage_view">My
									Page 가기</a></li>
							<li><a href="#" onclick="smssend()">쪽지 보내기</a></li>
							<li><a href="smslist">쪽지 리스트</a></li>
						</ul>
					</li>

				</se:authorize>
				<li><a href="${pageContext.request.contextPath}/logout">logout</a></li>
		</ul>
		<script type="text/javascript">
			function smssend() {
				window.open("/simli/smssend", "", "width=500, height=300")
			}
		</script>
		</c:if>
	</div>
</div>
<div class="layer">
	<div class="bg"></div>
	<div id="layer2" class="pop-layer">
		<div class="pop-container">
			<div class="pop-conts">

				<script type="text/javascript">
					function checkID() {
						window.open("/simli/confirmID?id="
								+ document.input.id.value, "",
								"width=500, height=150")
					}
				</script>

				<!--content //-->
				<form action="join" method="post" name="input"
					onSubmit="return checkInfo()">

					<table>

						<tr>
							<td colspan="2" id="title">회 원 가 입<br>
								<hr>
							</td>
						</tr>

						<tr>
							<td>ID</td>
							<td><input type="text" name="id" size="21" maxlength="20">&nbsp;&nbsp;
								<input type="button" name="checkid" class="sbtn"
								onclick="javascript:checkID()" value="중복확인"></td>

						</tr>

						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pwd" size="21"
								maxlength="20"></td>
						</tr>

						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="pwd2" size="21"
								maxlength="20"></td>
						</tr>

						<tr>
							<td>이름</td>
							<td><input type="text" name="name" size="21" maxlength="10">
							</td>
						</tr>

						<tr>
							<td>E-MAIL</td>
							<td><input type="text" name="email" size="21">&nbsp;&nbsp;
								<input type="button" name="checkemail" class="sbtn" onclick=""
								value="중복확인">
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
							</select> - <input type="text" size="2" name="phone2"> - <input
								type="text" size="2" name="phone3"></td>
						</tr>

						<tr>
							<td>생년월일</td>
							<td><input type="text" size="21" name="birth"
								placeholder="연-월-일" style="text-align: center;"
								OnClick="Calendar(this, 'down','no');"></td>
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
							<td colspan="3">
								<div class="btn-r">
									<input type="submit" class="sbtn" value="확인"> <input
										type="button" class="cbtn" value="취소">
								</div>
							</td>
						</tr>

					</table>

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
								input.phone1.focus();
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

				</form>

				<!--// content-->
			</div>
		</div>
	</div>

	<div id="layer3" class="pop-layer">
		<div class="pop-container">
			<div class="pop-conts">

				<!--content //-->
				<form action="login" method="post">

					<table border="0" align="center">
						<tr>
							<td>아이디</td>

							<td><input type="text" name="username"></td>
						</tr>

						<br />

						<tr>
							<td>비밀번호</td>

							<td><input type="password" name="password"></td>
						</tr>
					</table>

					<div class="btn-r">
						<input type="submit" class="sbtn" value="로그인"> <input
							type="button" class="cbtn" value="취소">
					</div>
					</span>

				</form>

				<!--// content-->
			</div>
		</div>
	</div>

</div>