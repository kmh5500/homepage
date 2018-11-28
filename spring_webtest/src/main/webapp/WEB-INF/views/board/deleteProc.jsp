<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function listb(){
	var url="list.do";
	
	
	location.href=url;
}
</script>
</head>
<body>
<c:choose>
	<c:when test="${pflag=='false' }">
	<div>비밀번호가 맞지 않습니다.</div>
	<input type="button" onclick="history.back()" value="뒤로가기">
	</c:when>
	<c:when test="${pflag=='true'&&flag=='false' }">
	<div>삭제가 실패하였습니다.</div>
	</c:when>
	<c:otherwise>
	<div>삭제 되었습니다.</div>
<button onclick="listb()">목록</button>
	</c:otherwise>
</c:choose>

</body>
</html>