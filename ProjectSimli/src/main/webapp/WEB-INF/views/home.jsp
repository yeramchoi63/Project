<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="se"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
</head>
<body>

<se:authorize access="hasRole('ROLE_ADMIN')">
<h1>
관리자 로그인됨 (세션유지중)
</h1>
</se:authorize>

<se:authorize access="hasRole('ROLE_EMPLOYEE')">
<h1>
진료/상담사 로그인됨 (세션유지중)
</h1>
</se:authorize>

<se:authorize access="hasRole('ROLE_USER')">
<h1>
일반사용자 로그인됨 (세션유지중)
</h1>
</se:authorize>

<h1>
	Hello world!  
</h1>


<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
