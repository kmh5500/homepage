
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
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">비밀번호 변경 처리</DIV>
 

  <div class="content">
  <c:choose>
  	<c:when test="${pflag=='false' }">
  	"기존 비밀번호가 틀렸습니다. 다시 입력하세요"
  	<input type='button' value='취소' onclick="location.href='${root}/'">
    <input type='button' value='다시시도' onclick="history.back()">
  	</c:when>
  	<c:when test="${flag=='true'&&pflag=='true' }">
  	"비밀번호를 변경했습니다.<br>"
  	 <input type='button' value='완료' onclick="location.href='${root}/'">
  	</c:when>
  	<c:otherwise>
  	"비밀번호 변경을 실패했습니다."
  	<input type='button' value='취소' onclick="location.href='${root}/''">
    <input type='button' value='다시시도' onclick="history.back()">
  	</c:otherwise>
  </c:choose>

  </div>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 