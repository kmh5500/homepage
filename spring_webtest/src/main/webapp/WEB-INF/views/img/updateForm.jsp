
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>



 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>

<style type="text/css"> 

</style>
<script type="text/javascript">

function inputCheck(f){
	
	if(f.title.value==""){
		alert("title을 입력해 주세요");
		f.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 입력해 주세요");
		f.focus();
		return false;
	}
	if(f.passwd.value==""){
		alert("비밀번호를 입력해 주세요");
		f.focus();
		return false;
	}
	
}


</script> 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">수정</DIV>
 
<FORM name='frm' method='POST' 
	action='./update'
	
	onsubmit="return inputCheck(this)">
	<input type="hidden" name="no" value="${dto.no}">
  <TABLE>
   
    <TR>
      <TH>No</TH>
      <TD>${dto.no}</TD>
      
    </TR>
    
    <TR>
      <TH>title</TH>
      <TD><input type="text" name="title" value="${dto.title}"></TD>

    </TR>
    
    <TR>
      <TD colspan="3">
      
		<img src="${root }/img/storage/${dto.fname}"> 

      </TD> 
    </TR>
    
    <TR>
      <TH>content</TH>
      <TD><textarea rows="15" cols="65" name="content">${dto.content}</textarea></TD>
      
    </TR>
    
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd">
    </TR>
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='reset' value='취소'>
  </DIV>
</FORM>
 
 

</body>
<!-- *********************************************** -->
</html>