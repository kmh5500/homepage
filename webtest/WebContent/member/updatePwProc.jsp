
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
 <%
 	
 	String oldpasswd = request.getParameter("oldpasswd");
 	String passwd = request.getParameter("passwd");
 	String id = request.getParameter("id");
 	
 	Map map = new HashMap();
 	map.put("id", id);
 	map.put("oldpasswd", oldpasswd);
 	map.put("passwd", passwd);
 
 	boolean pflag=dao.OldpassCheck(map);
 	boolean flag=false;
 	if(pflag)
 	flag=dao.updatePw(map);
 	
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
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">비밀번호 변경 처리</DIV>
 

  <div class="content">
  <%if(!pflag){
	  out.print("기존 비밀번호가 틀렸습니다. 다시 입력하세요");
	  
  }else if(flag){
  		out.print("비밀번호를 변경했습니다.<br>");
  		out.print("로그인하세요<br>");
  	}else{
  		out.print("비밀번호 변경을 실패했습니다.");
  	}
  %>
  </div>
  <%if(flag){ %>
  <DIV class='bottom'>
    <input type='button' value='완료' onclick="location.href='../index.jsp'">
  </DIV>
  <%}else {%>
   <DIV class='bottom'>
    <input type='button' value='취소' onclick="location.href='../index.jsp'">
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>
  <%} %>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 