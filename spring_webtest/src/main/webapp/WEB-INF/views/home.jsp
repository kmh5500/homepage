<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" %>

    <c:set var="title" value="나의 여행 블로그"/>
    <c:if test="${not empty sessionScope.id && sessionScope.grade =='A' }">
    <c:set var="title" value="관리자 페이지"/>
    
    </c:if>
    <c:choose>
    	<c:when test="${empty sessionScope.id }">
    		<c:set var="str" value="메인페이지 입니다."></c:set>
    	</c:when>
    	<c:otherwise>
    	
    		<c:set var="str" value="안녕하세요 ${sessionScope.id}님"></c:set>
    	</c:otherwise>
    </c:choose>
 
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Spring 4.3.14 기반의 MVC WebTest실습
</h1>
<div class="title">${title}</div>
 
<div class="content">
<h1>${str}</h1>
<img src="${pageContext.request.contextPath }/images/kim.jpg"  width="50%"><br>
 <c:choose>
 	<c:when test="${empty sessionScope.id }">
 	
<input type="button" value="로그인" 
onclick="location.href='member/login.do'">
 	</c:when>
 	<c:otherwise>
<input type="button" value="로그아웃" 
onclick="location.href='member/logout.do'">
 	
 	</c:otherwise>
 </c:choose>

</div>
<div align="center"> 
<br><br><br> 
<h1> 
HOME<br> 
</h1> 
</div> 
<P>  The time on the server is ${serverTime}. </P>



</body>
</html>
