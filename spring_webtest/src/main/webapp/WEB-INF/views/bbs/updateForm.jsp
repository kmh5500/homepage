<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
* { 
	font-family: gulim; 
	font-size: 20px; 
} 
</style> 

<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
 </script>
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>


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
// 	if (f.content.value == "") {
// 		alert("내용을 입력하세요");
// 		f.content.focus();
		
// 		return;
// 	}
    // content: textarea name
    if (CKEDITOR.instances['content'].getData() == '') {
      window.alert('내용을 입력해 주세요.');
      CKEDITOR.instances['content'].focus();
      return false;
    }
	if (f.passwd.value == "") {
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
		
		return;
	}
	
	f.submit();
}
</script>

<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

 <Div class="container"></Div>
<h2>수정</h2>
 
<FORM name='frm' method='POST' action='./update'
		enctype = "multipart/form-data">
<input type="hidden" name="bbsno" value="${dto.bbsno}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">
<input type="hidden" name="oldfile" value="${dto.filename}">
  <TABLE>
    <TR>
      <TH>성명</TH>
      <TD>
       <input type="text" name="wname" value="${dto.wname}">
      </TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD>
       <input type="text" name="title" value="${dto.title}">
      </TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD>
       <textarea rows="10" cols="45" name="content">${dto.content}</textarea>
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
       <input type="file" name="filenameMF">
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='수정' onclick="bcheck(this.form)">
    <input type='button' value='목록' onclick="location.href='./list'">
    <input type="reset" value="입력 취소">
  </DIV>
</FORM>
 
 

</body>
<!-- *********************************************** -->
</html>