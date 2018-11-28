
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 
 
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = bdao.read(bbsno);
	String id =(String)session.getAttribute("id");
	String grade =(String)session.getAttribute("grade");
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

<script type="text/javascript">
function bcheck(f) {
	if (f.wname.value == "") {
		alert("성명을 입력하세요");
		f.wname.focus();
		
		return;
	}
	if (f.title.value == "") {
		alert("제목을 입력하세요");
		f.title.focus();
		
		return;
	}
	if (f.content.value == "") {
		alert("내용을 입력하세요");
		f.content.focus();
		
		return;
	}
	if (f.passwd.value == "") {
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
		
		return;
	}
	
	f.submit();
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/myhome/top.jsp"/><br>
<!-- *********************************************** -->
 
 <FORM name='frm' method='POST' action='./updateProc.jsp'
		enctype = "multipart/form-data">
		<input type="hidden" name="bbsno" value="<%=dto.getBbsno() %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
<input type="hidden" name="oldfile" value="<%=dto.getFilename() %>">
<div class="w3-container" style="width:100%">
	<div class=" w3-bar w3-panel w3-pale-red w3-leftbar w3-border-red">
	  <p>글 수정</p>
	  <div class="w3-right-align">
		작성자: <%=id %>
		<input type="hidden" name="wname" value=<%=id %>>
	  </div>
	</div>
	<div class=" w3-border w3-bar w3-light-grey">
	<div class="w3-left"><p>제목:
	   <input type="text" name="title"  style="width: 300px" value="<%=dto.getTitle() %>">
		 </p>
	 </div>
	<div class="w3-right">첨부 파일:
	<input type="file" name="filename">
	<div>
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
      %> 
 	</div>
   </div>
	</div>
	
	<div class="w3-container w3-border w3-large">
	
    <div class="w3-left-align" style="width:100%; height:400px">
        <textarea style="width:100%; height:400px" name="content"><%=dto.getContent() %></textarea>
    
    </div>
   	<div>비밀번호:  <input type="password" name="passwd"></div>
  </div>
	
</div>
 <DIV class='w3-center'>
    <input type='submit' value='등록'>
    <input type='button' value='목록' onclick="location.href='./list.jsp'">
    <input type="reset" value="입력 취소">
  </DIV>
</FORM>
 <%-- 
 
<DIV class="title">수정</DIV>
 
<FORM name='frm' method='POST' action='./updateProc.jsp'
		enctype = "multipart/form-data">
<input type="hidden" name="bbsno" value="<%=dto.getBbsno() %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
<input type="hidden" name="oldfile" value="<%=dto.getFilename() %>">
  <TABLE>
    <TR>
      <TH>성명</TH>
      <TD>
       <input type="text" name="wname" value="<%=dto.getWname() %>">
      </TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD>
       <input type="text" name="title" value="<%=dto.getTitle() %>">
      </TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD>
       <textarea rows="10" cols="45" name="content"><%=dto.getContent() %></textarea>
      </TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD>
       <input type="password" name="passwd">
      </TD>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD>
       <input type="file" name="filename">
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='수정' onclick="bcheck(this.form)">
    <input type='button' value='목록' onclick="location.href='./list.jsp'">
    <input type="reset" value="입력 취소">
  </DIV>
</FORM> --%>
 
<!-- *********************************************** -->
<jsp:include page="/myhome/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 