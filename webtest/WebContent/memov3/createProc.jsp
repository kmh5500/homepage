<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/>
<jsp:useBean id="dto" class="memo.MemoDTO"/>

<!-- <jsp:setProperty name="dto" property="title" param="ti"/> -->
 
<!-- <jsp:setProperty name="dto" property="title"/>
<jsp:setProperty name="dto" property="content"/> -->
<jsp:setProperty name="dto" property="*"/>

<%
boolean flag = dao.create(dto);
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

div {
	text-align: center;
	margin-top: 100px;
}
</style> 
</head> 
<body> 

<div> 

<%
 if(flag) {
	 out.println("메모를 등록했습니다.");
 }
 else {
	 out.println("메모 등록이 실패했습니다.");
 }
%>
 <br>
 <input type='button' value='계속 등록' onclick="location.href='./createForm.jsp'">
 <input type='button' value='목록' onclick="location.href='./list.jsp'">
</div>

</body> 
</html>

