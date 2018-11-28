
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 


<%-- <c:choose> --%>
<%-- 	<c:when test="${empty str }"> --%>
<%-- 	<jsp:forward page="/member/createProc"/> --%>
<%-- 	</c:when> --%>
<%-- 	<c:otherwise> --%>

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
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 <div class="container">
<h2>아이디 및 이메일 중복 확인</h2>
 
<div class="content">
${str}
</div>
  

    <input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='홈' onclick="location.href='${root}/'">

</div>
<%--  	</c:otherwise> --%>
	
	

<%-- </c:choose> --%>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 