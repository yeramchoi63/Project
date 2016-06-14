<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri ="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>

<html>

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title></title>
</head>

<script type="text/javascript">

   function setId() {
      opener.document.input.id.value = "${ id }";
      self.close();
   }
   
   function setClose() {
      opener.document.input.id.value = "";
      self.close();
   }
</script>

<body>
   <c:if test="${ check == 1 }">
      <table class="confirmID">
         <tr>
            <td>
               ${ id }는 이미 사용 중인 아이디입니다.
            </td>
         </tr>
         <tr>
            <td>
               <p>다른 아이디를 입력하세요.</p>
               <input type="button" value="닫기" id="btn" onclick="setClose()">
            </td>
         </tr>
      </table>
   </c:if>
   <c:if test="${ check != 1 }">
      <table class="confirmID">
         <tr>
            <td>
               <p>${ id }는 사용 가능한 아이디입니다.</p>
               <input type="button" value="닫기" id="" onclick="setId()">
            </td>
         </tr>
      </table>
   </c:if>
</body>

</html>