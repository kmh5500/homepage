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

<script type="text/javascript">
function blist() {
	var url = "./list.do";
	location.href = url;
}
</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title"></DIV>

<div class="content">
<%
	if (flag) {
		out.print("답변이 등록 되었습니다.");
	}
	else {
		out.print("답변 등록이 실패 되었습니다.");
	}
%>
</div>

  <DIV class='bottom'>
    <input type='button' value='목록' onclick="blist()">
    <input type='button' value='새 글 등록' onclick="location.href='./createForm.do'">
  </DIV>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>