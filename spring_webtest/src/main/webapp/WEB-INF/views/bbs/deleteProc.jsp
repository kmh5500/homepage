<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>

<%
	
	boolean pflag = (boolean)request.getAttribute("pflag");
	boolean flag =  (boolean)request.getAttribute("flag");
	
	
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
	url = url + "?col=<%=request.getParameter("col") %>";
	url = url + "&word=<%=request.getParameter("word") %>";
	url = url + "&nowPage=<%=request.getParameter("nowPage") %>";
	location.href = url;
}
</script>

<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 <h2>삭제 결과</h2>


<div class="container">
<%
	if (pflag == false) {
		out.print("비밀번호가 일치하지 않습니다.");
	}
	else if (flag) {
		out.print("글을 삭제 했습니다.");
	}
	else {
		out.print("글 삭제를 실패했습니다.");
	}
%>

<%
	if (pflag==false || flag==false) {
%>
  
    <input type='button' value='다시 시도' onclick="history.back()">
    <input type='button' value='목록' onclick="blist()">
  
<% 
	}
	else {		
%>
  
    <input type='button' value='목록' onclick="blist()">
  
<%
	}
%>
 </div>
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>