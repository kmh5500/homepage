<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${flag}">글쓰기를 성공했습니다.
<button onclick="location.href='list.do'">목록</button>
	
	</c:when>
	<c:otherwise>글쓰기를 실패했습니다.
<button onclick="history.back()">다시시도</button>
	
	</c:otherwise>
</c:choose>

</body>
</html>