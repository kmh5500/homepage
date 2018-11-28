<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 


<%
	
	boolean flag = (boolean)request.getAttribute("flag");
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function ilist(){
	var url = "list.do";
	location.href = url;
}
</script>
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
 
<DIV class="title">답변처리</DIV>
<div class="content">
<%
	if(flag){
		out.print("답변이 등록되었습니다");
	}else{
		out.print("답변등록을 실패했습니다");
	}
%>
</div>
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="ilist()">
    <input type='button' value='등록' onclick="location.href='create.do'">
  </DIV>

 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>