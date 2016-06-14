<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <script type="text/javascript">
 $(document).ready(function(){
 	$('#enrollview').hide();
 })  
 
$(function(){
	 $('#enroll').click(function(){
	     $('#enrollview').show();
	  });     
});
	  
 $(function(){
	 $('#submit').click(function(){
	     $('#enrollview').hide();
	  });     
});
    
 
 
 
</script>

<style type="text/css">
 #enrollview{
  width:300px; height:400px; background:#eaeaea; color:#ggg; 
  position:absolute; top:10px; left:100px; text-align:center; 
  border:2px solid #000;
   }
</style>




</head>
<body>
상담컨트롤

	<table border="1">
	
		<tr>
			<td>상담자이름</td> <td>상담날짜</td> <td>상담시간</td> <td>상담방법</td> <td>치료등록</td>
		</tr>
	
	<c:forEach items="${list}" var="result">
		<tr>
			 	<td>${result.name}</td> 
				<td>${result.appointday}</td>
				 <td>${result.appointtime}</td>
			  	<td>${result.memberconsult}</td>
				<td><button id="enroll">치료 등록</button></td>			
		</tr>
		
		
				<div id="enrollview">
					<form action="enrollsubmit" method="post">
						${result.name} 님의 치료를 선택해주세요 <br>
							<select name="resertype"> 
									<option value="미술치료">미술치료</option>
									<option value="가족치료">가족치료</option>	
									<option value="게임치료">게임치료</option>
									<option value="영상치료">영상치료</option>
									<option value="놀이치료">놀이치료</option>
									<option value="심리치료">심리치료</option>
									<option value="독서치료">독서치료</option>
									<option value="언어치료">언어치료</option>
									<option value="상담치료">상담치료</option>
							</select>	
							<input type="hidden" value="${result.id}" name="id">
							<input type="submit">등록<input>
					</form>
	</div>
		
		
	</c:forEach>	
	</table>
	
	
	

</body>
</html>