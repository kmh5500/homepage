<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function listb(){
	var url="list.do";
	url+="?col=${col}";
	url+="&word=${word}";
	url+="&nowPage=${nowPage}";
	
	location.href=url;
}

</script>
</head>
<body>
<c:choose>
	<c:when test="${flag=='true' }">
	답변 등록 성공했습니다.<BR><BR>
	<button onclick="listb()">목록</button>
	
	</c:when>
	<c:otherwise>
	답변 등록 실패했습니다.<BR><BR>
	<button onclick="history.back()">다시시도</button>
	
	</c:otherwise>
</c:choose>

</body>
</html>