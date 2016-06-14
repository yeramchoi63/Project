<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC
	"-//W3C//DTD XHTML 1.0 Transitional//EN"
		"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><!-- Title 영역  --> <tiles:getAsString name="title" />
</title>
<link href="./resources/css/bootstrap.css" rel="stylesheet">
	<link href="./resources/css/bootstrap_emp.css" rel="stylesheet">
		<style>
#base {
	margin: auto;
	width: 100%;
	min-height: 400px;
	overflow: auto;
}

#header {
	background-image: url("./resources/images/logo.png");
	background-size: 25% 100%;
	background-repeat: no-repeat;
	height: 100px;
}

#aside {
	width: 15%;
	margin: auto;
	float: left;
	text-align: center;
	position: fixed;
	margin-top: 30px;
}

#content {
	width: 85%;
	float: right;
	text-align: center;
	padding-top: 10px;
	min-height: 400px;
	overflow: auto;
}

body {
	margin: 0;
}

div#asidest div {
	text-align: center;
	width: 150px;
	height: 40px;
	border: 1px gray solid;
	transition: all 0.5s ease;
	padding-top: 5px;
	background-color: white;
}

div#asidest div:hover {
	cursor: pointer;
	width: 200px;
	height: 50px;
	border-right: 40px #2ecc71 solid;
	padding-top: 15px;
	border-top: 1px gray solid;
}
</style>
</head>
<body>

	<!-- Header 영역 -->
	<div id="header">
		<tiles:insertAttribute name="headertop" />
		<tiles:insertAttribute name="headermenu" />
	</div>
	<!-- Visual 영역 -->
	<%-- <tiles:insertAttribute name="visual" /> --%>
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

	<!-- Footer 영역  -->
	<div>
		<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>