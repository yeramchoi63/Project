<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
<link href="./resources/css/bootstrap.css" rel="stylesheet">
<link href="./resources/css/bootstrap_emp.css" rel="stylesheet">
<style>
#base {
	margin: auto;
}

#header {
	background-image: url("./resources/images/logo.png");
	background-size: 25% 100%;
	background-repeat: no-repeat;
	height: 100px;
}

#content {
	height: auto;
	min-height: 400px;
	text-align: center;
	clear: both;
}

body {
	margin: 0;
}
</style>
</head>
<body>
	<div id="base">
		<!-- Header  영역  -->
		<div id="header">
			<tiles:insertAttribute name="headertop" />
			<tiles:insertAttribute name="headermenu" />
		</div>

		<!-- Main 영역 -->
		<div id="content">
			<tiles:insertAttribute name="content" />
		</div>
		<!-- Footer  영역  -->
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>