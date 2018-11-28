<%@ page contentType="text/html; charset=UTF-8" %> 
<%    request.setCharacterEncoding("utf-8");
        String root = request.getContextPath();
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">

<title></title> 
<style type="text/css"> 
* { 
	font-family: gulim; 
	font-size: 20px; 
} 
</style> 
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 <script type="text/JavaScript">
   window.onload=function(){
     CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
 </script>


<script type="text/javascript">
function bcheck(f) {
	if (f.wname.value == "") {
		alert("성명을 입력하세요");
		f.wname.focus();
		
		return false;
	}
	if (f.title.value == "") {
		alert("제목을 입력하세요");
		f.title.focus();
		
		return false;
	}
// 	if (f.content.value == "") {
// 		alert("내용을 입력하세요");
// 		f.content.focus();
		
// 		return false;
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
		
		return false;
	}
}
</script>

<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<div class="">

<h2>
등록</h2>
 
<FORM name='frm' method='POST' action='./create' onsubmit="return bcheck(this)"
	  enctype="multipart/form-data">
  <TABLE class="w3-table border:1px w3-center">
    <TR>
      <TH>성명</TH>
      <TD>
       <input type="text" name="wname">
      </TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD>
       <input type="text" name="title">
      </TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD>
       <textarea rows="10" cols="45" name="content"></textarea>
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
  
  <DIV class=''>
    <input type='submit' value='등록'>
    <input type='button' value='목록' onclick="location.href='./list.do'">
    <input type="reset" value="입력 취소">
  </DIV>
</FORM>
 
</div>
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>