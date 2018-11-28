
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 


<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	
	bdao.upviewcnt(bbsno);

	BbsDTO dto = bdao.read(bbsno);	
	
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">


</head> 

<script type="text/javascript">
function blist() {
	var url = "./list.jsp";
	url = url + "?col=<%=request.getParameter("col") %>";
	url = url + "&word=<%=request.getParameter("word") %>";
	url = url + "&nowPage=<%=request.getParameter("nowPage") %>";
	location.href = url;
}
function bupdate() {
	var url = "./updateForm.jsp";
	url = url + "?bbsno=<%=bbsno%>";
	url = url + "&col=<%=request.getParameter("col") %>";
	url = url + "&word=<%=request.getParameter("word") %>";
	url = url + "&nowPage=<%=request.getParameter("nowPage") %>";
	location.href = url;
}
function bdelete() {
	var url = "./deleteForm.jsp";
	url = url + "?bbsno=<%=bbsno%>";
	url = url + "&oldfile=<%=dto.getFilename()%>";
	url = url + "&col=<%=request.getParameter("col") %>";
	url = url + "&word=<%=request.getParameter("word") %>";
	url = url + "&nowPage=<%=request.getParameter("nowPage") %>";
	location.href = url;
}
function breply() {
	var url = "./replyForm.jsp";
	url = url + "?bbsno=<%=bbsno%>";
	location.href = url;
}
function fileDown() {
	var url="<%=root%>/download";
	url = url+"?filename=<%=dto.getFilename()%>";
	url= url+"&dir=/bbs/storage";
	
	location.href = url;
}
</script>



<!-- *********************************************** -->
<body>
<jsp:include page="/myhome/top.jsp"/><br>
<!-- *********************************************** -->
 
<div class="w3-container" style="width:100%">
	<div class=" w3-bar w3-panel w3-pale-red w3-leftbar w3-border-red">
	  <p>게시글 내용</p>
	  <div class="w3-right-align">
	  작성자: <%=dto.getWname() %> 
	  조회수: <%=dto.getViewcnt() %>
	  등록일: <%=dto.getWdate() %>
	  </div>
	</div>
	<div class=" w3-border w3-bar w3-light-grey">
	<div class="w3-left"><p>제목: <%=dto.getTitle() %></p></div>
	<div class="w3-right">첨부 파일:
	<%
      
      if(dto.getFilename() !=null){%>
    	  
    
    	<%   out.print(dto.getFilename());
    	  out.print("("+dto.getFilesize()+".byte)");
      
      %>
  	<a href="javascript:fileDown()">
  	<span class="glyphicon glyphicon-download-alt"></span>
  	</a>
  	(<%=(dto.getFilesize()/1024)%>KB)
    <% }else{
    	  out.print("파일없음");
      }
      %> </div>
	</div>
	
	<div class="w3-container w3-border w3-large">
	
    <div class="w3-left-align" style="width:100%; height:400px"><p><%=content %></p></div>
   
  </div>
	
</div>
 
  <DIV class='w3-center'>
    <input type='button' value='목록' onclick="blist()">
    <button onclick="bupdate()">수정</button>
    <button onclick="bdelete()">삭제</button>
    
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/myhome/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 