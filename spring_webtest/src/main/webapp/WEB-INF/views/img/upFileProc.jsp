<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>


<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function read(){
	var url = "read.do";
	url = url+"?no=${no}";
	
	location.href=url;
}
</script>  
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">사진 변경</DIV>
<div class="content">
<c:choose>
	<c:when test="${flag=='true' }">사진 변경 했습니다.
	<DIV class='bottom'>
	 <input type='button' value='나의 정보' onclick="read()">
	 </DIV>
	 </c:when>
	<c:otherwise>사진 변경을 실패했습니다.
	<DIV class='bottom'>
	 <input type='button' value='다시 시도' onclick="history.back()">
	  </DIV></c:otherwise>
</c:choose>

</div>

 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>