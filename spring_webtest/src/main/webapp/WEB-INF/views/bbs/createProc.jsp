<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>


<%-- <jsp:setProperty name="dto" property="*"/> --%>
	<!-- enctype으로 받아오면 setProperty 사용 불가 -->

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

 
<DIV class="w3-center">등록 결과</DIV>

<div class="w3-center">
<%
	if (flag) {
		out.print("등록이 성공 했습니다.");
	}
	else {
		out.print("등록이 실패 했습니다.");
	}
%>
</div>
  
  <DIV class='bottom'>
    <input type="button" value='계속 등록' onclick="location.href='createForm.do'">
    <input type="button" value='목록' onclick="blist()">
  </DIV>
 

</body>
<!-- *********************************************** -->
</html>