
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
 <div class="container">
<h2>로그인처리</h2>
 
<div class="content">
<c:choose>
	<c:when test="${flag=='true' }">
	"로그인 되었습니다."
	<input type='button' value='홈' 
  onclick="location.href='/'">
	</c:when>
	<c:otherwise>
		"아이디/비밀번호를 잘못 입력하셨거나" <br>
		"회원이 아닙니다. 회원가입을 하세요"
		<input type='button' value='홈' 
  onclick="location.href='/'">
  <input type='button' value='다시시도' 
  onclick="history.back()">
	</c:otherwise>
</c:choose>

</div>
  

</div>
 
 

</body>
<!-- *********************************************** -->
</html> 