<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Counselling Reply Page</title>
	
</head>


<body align="center">

		<h3>글 답변하기</h3>

	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="onReply" method="post">
			<input type="hidden" name="onNum" value="${onReplyView.onNum}"> 
			<input	type="hidden" name="onGroup" value="${onReplyView.onGroup}"> 
			<input	type="hidden" name="onStep" value="${onReplyView.onStep}">
			<input	type="hidden" name="onIndent" value="${onReplyView.onIndent}">
			<tr>
				<td align="center">번호</td>
				<td>${onReplyView.onNum}</td>
			</tr>
			
			<tr>
				<td align="center">이름</td>
				<td><input type="text" name="onName" value="${onReplyView.onName}"></td>
			</tr>
			<tr>
				<td align="center">제목</td>
				<td><input type="text" name="onTitle" value="└>${onReplyView.onTitle}"></td>
			</tr>
			<tr>
				<td align="center">내용</td>
				<td><textarea rows="10" name="onContent"  cols="140">${onReplyView.onContent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="답변" > 
					<input type="button" value="목록보기" >
					
				</td>
			</tr>
		</form>
	</table>
</div>
</body>
</html>