
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 



<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">

</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 

<script type="text/javascript">
function mread() {
	var url="read.do";
	url=url+"?id=${param.id}";
	
	location.href=url;
			
	
}
</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->

<body>
<!-- *********************************************** -->
 
<DIV class="title">정보 변경</DIV>
 
<div class="content">
<c:choose>
	<c:when test="${flag=='true' }">
	"변경을 성공 했습니다."
	<DIV class='bottom'>
   
    <input type='button' value='정보확인' onclick="mread()">
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
  </DIV>
	</c:when>
	<c:otherwise>
	"변경을 실패했습니다."
	<DIV class='bottom'>
   
    <input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
  </DIV>
	</c:otherwise>
</c:choose>


</div>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 