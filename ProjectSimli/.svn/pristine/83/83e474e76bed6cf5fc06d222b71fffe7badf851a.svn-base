<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>kosta 109</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
var sendAjax =  function(url) {
	 
    var postString = "";
    $.ajax({
        type: "POST",
        url: url,
        data: postString,   //post 형식 전송형태 data: {인자명 : 데이터, num:num},
        success: function(msg) {
        	$("#changeView").html(msg) ;
        }
    });
 };
</script>
</head>
<body>
<input type="button" value="화면1" onclick="sendAjax('ajaxView1')"><br>
<input type="button" value="화면2" onclick="sendAjax('ajaxView2')"><br>
 
<hr>
<!-- 새로운 View를 표시하기 위한위치. -->
<div id="changeView"></div>
<div id="changeView2"></div>
 
</body>
</html>