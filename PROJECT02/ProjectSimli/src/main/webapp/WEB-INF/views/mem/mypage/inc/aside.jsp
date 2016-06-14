<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="se"%>
<div id="asidest">

	<se:authorize access="hasRole('ROLE_ADMIN')">

		<div>
			<p onclick="ajaxmenu('ajax_mypage_view')">Admin Page</p>
		</div>

		<div>
			<p onclick="ajaxmenu('#')">관리자2</p>
		</div>

		<div>
			<p onclick="ajaxmenu('#')">관리자3</p>
		</div>

		<div>
			<p onclick="ajaxmenu('#')">관리자4</p>
		</div>

	</se:authorize>

	<se:authorize access="hasRole('ROLE_PKEMPLOYEE')">

		<div>
			<p onclick="ajaxmenu('ajax_mypage_view')">Employee Page</p>
		</div>

		<div>
			<p onclick="ajaxmenu('ajax_reserManage')">예약 리스트</p>
		</div>

		<div>
			<p onclick="ajaxmenu('ajax_smslist')">쪽지 보관함</p>
		</div>

		<div>
			<p onclick="ajaxmenu('#')">선생님4</p>
		</div>

	</se:authorize>

	<se:authorize access="hasRole('ROLE_PKUSER')">

		<div>
			<p onclick="ajaxmenu('ajax_mypage_view')">My Page</p>
		</div>

		<div>
			<p onclick="ajaxmenu('ajax_reserManage')">예약 리스트</p>
		</div>

		<div>
			<p onclick="ajaxmenu('ajax_smslist')">쪽지 보관함</p>
		</div>

		<div>
			<p onclick="ajaxmenu('#')">일반유저4</p>
		</div>

	</se:authorize>

</div>