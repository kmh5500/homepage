<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>




<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function imgread(){
	var url = "read.do"
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
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">결 과</DIV>
<div class=content>
<c:choose>
	<c:when test="${pflag=='false' }">비밀번호가 틀립니다.</c:when>
	<c:when test="${flag=='true'&&pflar=='true' }">업데이트 성공</c:when>
	<c:otherwise>업데이트 실패</c:otherwise>
</c:choose>


</div>
<div class="bottom">
<input type='button' value='다시시도' onclick="history.back()">
<input type='button' value='확인' onclick="imgread()">
</div> 

</body>
<!-- *********************************************** -->
</html>