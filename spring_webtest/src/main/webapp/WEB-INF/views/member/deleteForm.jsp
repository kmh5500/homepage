<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>

<%  
String id = request.getParameter("id");
    if(id==null)id = (String)session.getAttribute("id");
%> 
<c:set var="id" value="${id }"></c:set>
<c:if test="${empty sessionScope.id }">
<c:set var="id" value="${sessionScope.id }"></c:set>
	
</c:if>
 
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
 
<DIV class="title">회원탈퇴</DIV>
 
<FORM name='frm' method='POST' action='./delete'>
<input type="hidden" name="id" value="${id }">
<input type="hidden" name="oldfile" value="${param.oldfile}">
	<input type="hidden" name="col" value="${param.col}">
		<input type="hidden" name="word" value="${param.word}">
		<input type="hidden" name="nowPage" value="${param.nowPage}">

 
<div class="content">
탈퇴를 하시면 더이상 컨텐트를 제공받을 수 없습니다<br>
그래도 탈퇴를 원하시면 아래 탈퇴버튼을 클릭하세요
</div>
  
  <DIV class='bottom'>
    <input type='submit' value='탈퇴'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 

</body>
<!-- *********************************************** -->
</html> 
 