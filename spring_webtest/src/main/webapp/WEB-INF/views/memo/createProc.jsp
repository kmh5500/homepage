<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>




<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 

div {
	text-align: center;
	margin-top: 100px;
}
</style> 
</head> 
<body> 
<c:choose>
	<c:when test="${flag }">메모를 등록했습니다.
	<input type='button' value='계속 등록' onclick="location.href='./create.do'">
	 <input type='button' value='목록' onclick="location.href='./list.do'">	
	 </c:when>
	 <c:otherwise>
	 	메모 등록이 실패했습니다.
	 <button onclick="history.back()">다시시도</button>
	 </c:otherwise>
</c:choose>

</body> 
</html>

