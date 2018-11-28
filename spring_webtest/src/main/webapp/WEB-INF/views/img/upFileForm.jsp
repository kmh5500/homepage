<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
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
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">사진수정</DIV>
 
<FORM name='frm' method='POST' 
action='./upFile' 
enctype="multipart/form-data" 
>
<input type="hidden" name="no" value="${param.no }">
<input type="hidden" name="oldfile" value="${param.oldfile}">

   <TABLE>
  	<tr>
  		<td colspan="2" align="center">
   			<img src="${root }/img/storage/${param.oldfile}" width="200px" height="200px"> 
			
  		</td>
  	</tr>
    <TR>
      <TH>파일</TH>
      <TD><input type="file" name="fnameMF" ></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 

</body>
<!-- *********************************************** -->
</html>