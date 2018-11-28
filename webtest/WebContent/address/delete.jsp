<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="address.addressDAO"/>
<%
	int no = Integer.parseInt(request.getParameter("no"));

	boolean flag= dao.delete(no);
%>
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
<div id="title">삭제 결과</div>
<div>
<%
if(flag){
	out.print("삭제 성공");
}else {
	out.print("삭제 실패");
}
%>
</div>
<div class="bottom">
<button onclick= "location.href='list.jsp'">목록</button>
<button onclick="location.href='createForm.jsp'">등록</button>
<button onclick="location.href='createForm.jsp'">계속등록</button>
</div>
	<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html> 