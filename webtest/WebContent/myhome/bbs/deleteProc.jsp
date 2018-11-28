
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 
 
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String passwd = request.getParameter("passwd");
	String oldfile = request.getParameter("oldfile");
	
	Map map = new HashMap();
	
	map.put("bbsno", bbsno);
	map.put("passwd", passwd);
	
	boolean pflag = bdao.passCheck(map);
	boolean flag = false;
	
	if (pflag) {
		flag = bdao.delete(bbsno);
	}
	String upDir = application.getRealPath("/bbs/storage");
	if(flag){
		UploadSave.deleteFile(upDir,oldfile);
	}
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<title></title> 

<script type="text/javascript">
function blist() {
	var url = "./list.jsp";
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

<DIV class="title">삭제 결과</DIV>

<div class="content">
<%
	if (pflag == false) {
		out.print("비밀번호가 일치하지 않습니다.");
	}
	else if (flag) {
		out.print("글을 삭제 했습니다.");
	}
	else {
		out.print("글 삭제를 실패했습니다.");
	}
%>
</div>
<%
	if (pflag==false || flag==false) {
%>
  <DIV class='bottom'>
    <input type='button' value='다시 시도' onclick="history.back()">
    <input type='button' value='목록' onclick="blist()">
  </DIV>
<% 
	}
	else {		
%>
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="blist()">
  </DIV>
<%
	}
%>
 
 
<!-- *********************************************** -->
<jsp:include page="/myhome/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 