<%@ page language="java" contentType="text/html; charset=UTF-8"%>

    <%@ include file="/ssi/ssi.jsp" %>
     
    <%
	int no = Integer.parseInt(request.getParameter("no"));
    String fname= request.getParameter("fname");
  
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/myhome/top.jsp"/><br>
<DIV class="title">삭제</DIV>
 
 
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
<input type="hidden" name="no" value="<%=no%>">
<input type="hidden" name="fname" value="<%=fname%>">
  
  <div class = "content">
  삭제를 하시면 더이상 되돌릴수 없습니다.<br>
  그래도 삭제를 원하시면 비밀번호를 입력하세요.
 <table>
 <tr>
 <th>비밀번호</th>
 <td><input type="password" name="passwd"></td>
 
 </tr>
 </table>
  
  
  
  
  </div>
  
  <DIV class='bottom'>
    <input type='submit' value='삭제'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
<!-- *********************************************** -->
<jsp:include page="/myhome/bottom.jsp" flush="false"/>
</body>
</html>