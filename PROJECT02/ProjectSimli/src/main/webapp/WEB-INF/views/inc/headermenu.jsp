<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#menubase {
	margin: auto;
	width: 100%;
	text-align: center;
	font-family: 'Open Sans', sans-serif;
}

#headermenu {
	height: 50px;
	width: 950px;
	font-size: 15px;
	margin-left: 390px;
}

#menulist {
	margin: auto;
}

#menulist li {
	height: 50px;
	float: left;
	width: 145px;
	list-style: none;
	padding-top: 10px;
	border-bottom: 1px #EAEAEA solid;
	border-left: 2px #EAEAEA solid;
	transition: all 0.5s ease;
}

#menulist li a {
	text-decoration: none;
	color: #8C8C8C;
	font-size: medium;
}

#menulist li:hover {
	text-decoration: none;
	border-bottom: 3px #2ecc71 solid;
	margin-top: -2px;
}

#menulist li:hover .mainmenu {
	color: black;
}

#menulist li li {
	background-color: #F6F6F6;
	margin-left: -40px;
	border: none;
	height: 50px;
	clear: both;
	margin-top: -3px;
}

#menulist li li a {
	font-size: medium;
	text-decoration: none;
	color: #A6A6A6;
}

#menulist ul {
	display: none;
	position: absolute;
	z-index: 100;
}

#menulist li:hover ul {
	display: block;
}

#menulist a {
	font-weight: bold;
}

#menulist li li:hover {
	border: none;
	margin-top: -3px;
}

#menulist li li:hover a {
	text-decoration: underline;
	color: #2ecc71;
}
</style>
<div id="menubase">
	<div id="headermenu">
		<ul id="menulist">
			<li><a href="hellow_page" class="mainmenu">센터소개</a> <br> <br>
				<ul>
					<li><a href="hellow_page">인사말</a></li>
					<li><a href="emlpoyee_introduce">선생님소개</a></li>
					<li><a href="video_guide">동영상소개</a></li>
					<li><a href="operation_guide">이용안내</a></li>
				</ul></li>
			<li><a href="psychotherapy" class="mainmenu">상담 소개</a> <br>
				<br>
				<ul>
					<li><a href="psychotherapy">심리상담</a></li>
					<li><a href="familytherapy">가족상담</a></li>
					<li><a href="chatting_counsel">채팅상담</a></li>
					<li><a href="voice_counsel">음성상담</a></li>
					<li><a href="cam_counsel">화상캠상담</a></li>
					<li><a href="call_counsel">전화상담</a></li>
				</ul></li>
			<li><a href="total_inspect" class="mainmenu">검사 소개</a><br>
				<br>
				<ul>
					<li><a href="total_inspect">종합심리검사</a></li>
					<li><a href="character_inspect">성격유형검사</a></li>
					<li><a href="study_inspect">학습 및 진로검사</a></li>
					<li><a href="play_inspect">놀이평가</a></li>
					<li><a href="baby_inspect">영유아발달검사</a></li>
					<li><a href="concentration_inspect">주의집중력검사</a></li>
					<li><a href="selftest_inspect">자가진단테스트</a></li>
				</ul></li>
			<li><a href="gametherapy" class="mainmenu">치료 소개</a><br> <br>
				<ul>
					<li><a href="gametherapy">놀이치료</a></li>
					<li><a href="arttherapy">미술치료</a></li>
					<li><a href="speechtherapy">언어치료</a></li>
					<li><a href="readtherapy">독서치료</a></li>
					<li><a href="musictherapy">음악치료</a></li>
					<li><a href="playtherapy">연극치료</a></li>
					<li><a href="mediatherapy">미디어치료</a></li>
				</ul></li>
			<li><a href="noList" class="mainmenu">게시판</a><br> <br>
				<ul>
					<li><a href="noList">공지사항</a></li>
					<li><a href="faqView">FAQ</li>
					<li><a href="onList">온라인 상담</a></li>
				</ul></li>
			<li><a href="reservationview" class="mainmenu">예약</a><br> <br>
				<ul>
					<li><a href="reservationview">온라인예약</a></li>
					<li><a href="reservationview">전화예약</a></li>
					<li><a href="exemlist">예약관리</a></li>
				</ul></li>
		</ul>
	</div>
</div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var ajaxmenu = function(url) {
		$.ajax({
			type : "GET",
			url : url,
			async : false,
			success : function(msg) {
				$("#content").html(msg);
			}
		});
	};
</script>