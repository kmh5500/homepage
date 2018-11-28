
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>
 <%

boolean flag = dao.update(dto);
 
 %>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">

</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 

<script type="text/javascript">
function mread() {
	var url="read.jsp";
	url=url+"?id=<%=dto.getId()%>";
	
	location.href=url;
			
	
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">정보 변경</DIV>
 
<div class="content">
<% if(flag){
		out.print("변경을 성공 했습니다.");
}else{
	out.print("변경을 실패했습니다.");
}
%>
</div>
<%if(flag){ %>
  <DIV class='bottom'>
   
    <input type='button' value='정보확인' onclick="mread()">
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
  </DIV>
 <%}else{ %>
  <DIV class='bottom'>
   
    <input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
  </DIV>
  <%} %>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 