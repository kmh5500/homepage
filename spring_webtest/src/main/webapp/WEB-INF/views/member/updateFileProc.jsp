
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

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
<script type="text/javascript">
function read() {
	var url ="read.do";
	url=url+"?id=${id}";
	
	location.href=url;
}
</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">사진변경</DIV>
 <div class="content">
 <c:choose>
 	<c:when test="${flag=='true' }">
 	"사진변경 했습니다."
 	 
    <input type='button' value='나의정보' onclick="read()">
 	</c:when>
 	<c:otherwise>
 	"사진변경을 실패했습니다."
 	  <input type='button' value='다시시도' onclick="history.back()">
 	</c:otherwise>
 </c:choose>


  </DIV>

 
 

<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 