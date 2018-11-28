<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>




<%
boolean pflag=	(boolean)request.getAttribute("pflag");
boolean flag=	(boolean)request.getAttribute("flag");
String col =(String)request.getAttribute("col");
String word=	(String)request.getAttribute("word");
String nowPage= (String)request.getAttribute("nowPage");
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
	url = url + "?col=<%=col%>";
	url = url + "&word=<%=word%>";
	url = url + "&nowPage=<%=nowPage%>";
	
	location.href = url;
}
</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="title">수정 결과</DIV>

<div class="content">
<%
	if (pflag == false) {
		out.print("비밀번호가 일치하지 않습니다.");
	}
	else if (flag) {
		out.print("글을 변경했습니다.");
	}
	else {
		out.print("수정에 실패했습니다.");
	}
%>
</div>
<%
	if (pflag==false || flag==false) {
%>
  <DIV class='bottom'>
    <input type='button' value='다시 시도' onclick="history.back()">
    <input type='button' value='목록' onclick="blist()">
  </DIV>
<% 
	}
	else {		
%>
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="blist()">
  </DIV>
<%
	}
%>
 
 
</body>
<!-- *********************************************** -->
</html>