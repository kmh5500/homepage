<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>

<%
	

	
	boolean flag = (boolean)request.getAttribute("flag");
			
			%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
* { 
	font-family: gulim; 
	font-size: 20px; 
} 
</style> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">결과 처리</DIV>

<div class="content">
<%
	if (flag) {
		out.print("글 작성이 완료 되었습니다.");
	}
	else {
		out.print("글 작성을 실패했습니다.");
	}
%>
</div>

<%
	if (flag) {
%>  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="location.href='./list.do'">
  </DIV>
<%
	}
	else {
%>
  <DIV class='bottom'>
    <input type='button' value='다시 시도' onclick="history.back()">
    <input type='button' value='목록' onclick="location.href='./list.do'">
  </DIV>
<%
	}
%>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>