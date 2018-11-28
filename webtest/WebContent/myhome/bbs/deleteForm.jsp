
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 
 <jsp:useBean id="dao" class="bbs.BbsDAO"/>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	
	boolean flag = dao.checkRefnum(bbsno);
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<script type="text/javascript">
function bcheck(f) {
	if (f.passwd.value == "") {
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
		
		return false;
	}
}

function blist() {
	url = "./list.jsp";
	url = url + "?col=<%=request.getParameter("col") %>";
	url = url + "&word=<%=request.getParameter("word") %>";
	url = url + "&nowPage=<%=request.getParameter("nowPage") %>";	
	location.href = url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/myhome/top.jsp"/><br>
<!-- *********************************************** -->
 
<%
	if (flag) {
%> 

<DIV class="title">삭제 실패</DIV>

<div class="content">답변 글이 존재하여 삭제 할 수 없습니다.</div>
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="blist()">
  </DIV>

<%	
	} else { 
%> 
<DIV class="title">삭제</DIV>

<div class="content">삭제하면 복구할 수 없습니다.</div>
 
<FORM name='frm' method='POST' action='./deleteProc.jsp'
	  onsubmit="return bcheck(this)">
<input type="hidden" name="bbsno" value="<%=bbsno %>">
<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile") %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
  <TABLE>
    <TR>
      <TH>패스워드</TH>
      <TD>
       <input type="password" name="passwd">
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='확인'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>

<% 
	}
%>
 
<!-- *********************************************** -->
<jsp:include page="/myhome/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 