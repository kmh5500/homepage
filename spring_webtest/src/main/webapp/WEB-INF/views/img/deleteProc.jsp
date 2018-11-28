<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file ="/ssi/ssi.jsp" %> 

<%


	boolean pflag =(boolean) request.getAttribute("pflag");
	boolean flag = (boolean)request.getAttribute("flag");
	
		

%>
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
 
<DIV class="title">번호삭제 처리</DIV>
 
<div class="content">

<%

	if(flag){
		out.print("삭제되었습니다.");
	}else if(pflag==false){
		out.print("비밀번호가 틀렸습니다.");
	}else
		out.print("삭제 실패.");


%>



</div>
  
  <DIV class='bottom'>
    <input type='button' value='홈' onclick="location.href='../index.do'">
    <input type='button' value='목록' onclick="location.href='./list.do'">
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>

 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 

