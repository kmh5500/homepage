<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>


 
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
function mlist() {
	url = "./list.do";
	location.href = url;
}
</script>

<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">처리 결과</DIV>

<div class="content">
<c:choose>
	<c:when test="${flag }">답변이 등록되었습니다.</c:when>
	<c:otherwise>답변 등록이 실패했습니다.</c:otherwise>
</c:choose>


</div>
   
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="mlist()">
    <input type='button' value='등록' onclick="location.href='./create.do'">
  </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>