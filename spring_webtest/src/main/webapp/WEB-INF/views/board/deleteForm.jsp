<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
<c:choose>
	<c:when test="${flag=='true' }">
	<div>삭제 할수없습니다. 답변을 지워주세요.</div>
	<input type="button" onclick="history.back()" value="뒤로가기">
	</c:when>
	<c:otherwise>
	<form action="./delete" method="post" >
	<div>비밀번호를 입력하세요</div>
	<input type="hidden" name="num" value="${param.num}">
	<input type="hidden" name="oldfile" value="${param.oldfile}">
	  <div class="form-group">
      <label for="pwd">비밀번호:</label>
      <input type="password" class="form-control" id="pwd" required="required" name="passwd">
    	
    </div>
	<button type="submit" class="btn btn-primary">등록</button>
    <button type="reset" class="btn btn-primary">취소</button>
	
</form>
	</c:otherwise>
</c:choose>

</body>
</html>