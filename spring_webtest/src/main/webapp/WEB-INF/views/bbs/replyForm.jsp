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
	if (f.content.value == "") {
		alert("내용을 입력하세요");
		f.content.focus();
		
		return false;
	}
	if (f.passwd.value == "") {
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
		
		return false;
	}
}
</script>

<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">답변</DIV>
 
<FORM name='frm' method='POST' action='./reply' 
	  onsubmit="return bcheck(this)"
	  enctype="multipart/form-data">
 
 <input type="hidden" name="bbsno" value="${dto.bbsno}">
 	<!-- 답변 있는 부모글의 삭제를 못하게 하기 위해서 -->
 	
 <input type="hidden" name="grpno" value="${dto.grpno}">
 <input type="hidden" name="indent" value="${dto.indent}">
 <input type="hidden" name="ansnum" value="${dto.ansnum}">
 	<!-- 답변에 필요한 부모 자료들 -->
 	
  <TABLE>
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
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='목록' onclick="location.href='./list.do'">
    <input type="reset" value="입력 취소">
  </DIV>
</FORM>
 
 

</body>
<!-- *********************************************** -->
</html>