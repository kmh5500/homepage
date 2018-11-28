
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 
 <jsp:useBean id="dao" class="img.ImgDAO" />

<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	ImgDTO dto = dao.read(no);
	
	dao.upViewcnt(no);

	String content = dto.getContent();	   
	content = content.replaceAll("\r\n", "<br>");
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
 
 <style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}

div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

table {
	width: 60%;
	margin: 0 auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 10px
}
</style>
 
<script type="text/javascript">

function iupdate() {
	var url = "./updateForm.jsp"
	url += "?no=<%=dto.getNo()%>";
	location.href = url;
}

function idelete() {
	var url = "./deleteForm.jsp"
	url += "?no=<%=dto.getNo()%>";
	url += "&fname=<%=dto.getFname()%>";
	
	location.href = url;
}

function ilist() {
	var url = "./list.jsp"
	location.href = url;
}

function iread(no) {
	var url = "./read.jsp"
	url += "?no=" + no;
	location.href = url;
}

function ireply() {
	var url = "./replyForm.jsp"
		url += "?no=<%=dto.getNo()%>";
	location.href = url;
}
</script>
 
 
 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/myhome/top.jsp"/><br>
<!-- *********************************************** -->
  <div class="w3-container w3-border w3-bar w3-center" style="width:100%">
<DIV class="w3-container w3-border w3-bar" style="width:100%">이미지 정보</DIV>

<div class="">
 <img style="width:300px; height:300px;" src="./storage/<%=dto.getFname() %>">
</div>

<br>

  <TABLE class="w3-table-center"style="width:30%; height:20%;">
    <tr>
<%
	List list = dao.readImg(no);
	int[] noArr = (int[])list.get(0);
	String[] fArr = (String[])list.get(1);
	
	for (int i=0; i<5; i++) {
		if (fArr[i] == null) {
%> 
	  <td class="">
	   <img src="./storage/null.png" width="100px" height="100px">
	  </td>
<%
		}
		else {
			if (noArr[i] == no) {
%>
	  <td class="">
	  
	   <a href="javascript:iread('<%=noArr[i]%>')">
  		<img class="" src="./storage/<%=fArr[i] %>">
  	   </a>
	  </td>				
<%
			}
			else {
%>
	  <td class="">
	   <a href="javascript:iread('<%=noArr[i]%>')">
  		<img src="./storage/<%=fArr[i] %>" width="100px" height="100px">
  	   </a>
	  </td>				
<%				
			}
		}
	}
%>     
    </tr>
 </table>
 <br>
   
 <table class="w3-table-centered">
    <TR>
      <TH class="">제 &nbsp;목</TH>
      <TD colspan="4"><%=dto.getTitle() %></TD>
    </TR>
    <TR>
      <TH class="">내 &nbsp;용</TH>
      <TD colspan="4"><%=content %></TD>
    </TR>
    <TR>
      <TH class="">작성일</TH>
      <TD colspan="4"><%=dto.getWdate() %></TD>
    </TR>
    <TR>
      <TH class="">조회수</TH>
      <TD colspan="4"><%=dto.getViewcnt() %></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    
    <input type='button' value='정보 수정' onclick="iupdate()">
    <input type='button' value='이미지 삭제' onclick="idelete()">
    <input type='button' value='목록' onclick="ilist()">
    
  </DIV>
 </div>
 
<!-- *********************************************** -->
<jsp:include page="/myhome/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 