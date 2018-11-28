
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>

 <%
	 String id = request.getParameter("id");  

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
<script type="text/javascript">
function inCheck(f) {
	if(f.oldpasswd.value==""){
		alert("기존 비밀번호를 입력하세요");
		f.oldpasswd.focus();
		return false;
		}
	if(f.passwd.value==""){
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
		return false;
	}
	if(f.repasswd.value==""){
		alert("비밀번호확인을 입력하세요");
		f.repasswd.focus();
		return false;
	}
	if(f.passwd.value!=f.repasswd.value){
		alert("비밀번호가 일치하지 않습니다.다시 입력하세요.");
		f.repasswd.focus();
		return false;
	}
	
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">패스워드 변경</DIV>
 
<FORM name='frm' method='POST' action='./updatePwProc.jsp'
 onsubmit="return inCheck(this)">
 <input type="hidden" name="id" value="<%=id %>">
  <TABLE>
  <TR>
      <TH>기존 비밀번호</TH>
      <TD><input type="password" name="oldpasswd" ></TD>
    </TR>
    <TR>
    <TR>
      <TH>변경할 비밀번호</TH>
      <TD><input type="password" name="passwd" ></TD>
    </TR>
    <TR>
      <TH>비밀번호 확인</TH>
      <TD><input type="password" name="repasswd" ></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='패스워드 수정'>
    <input type='button' value='' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 