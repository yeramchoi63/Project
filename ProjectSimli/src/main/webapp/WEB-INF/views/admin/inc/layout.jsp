<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>

<style>
#base {
	width: 1000px;
	height: auto;
	min-height: 400px;
}

#aside {
	width: 15%;
	height: auto;
	min-height: 400px;
	float: left;
	text-align: center;
	background-color: gray;
	border-style: ridge;
}

#content {
	width: 85%;
	float: left;
	text-align: center;
	padding-top: 10px;
}
</style>

</head>
<body>

	<!-- Header 영역 -->
	<div>
		<tiles:insertAttribute name="headermenu" />
	</div>

	<!-- Visual 영역 -->
	<div id="base">

		<!-- Main   영역  -->
		<div id="aside">

			<!-- Aside(Navi) 영역 -->
			<tiles:insertAttribute name="aside" />

		</div>

		<div id="content">

			<!-- Content 영역 -->
			<tiles:insertAttribute name="content" />

		</div>
	</div>

	</div>
</body>
</html>