
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
<script type="text/javascript">
function updateFile() {
	var url="updateFile";
	url =url+"?id=${dto.id}";
	url =url+"&oldfile=${dto.fname}";
	
	location.href=url;
}
function updatePwForm() {
	var url="updatePw";
	url =url+"?id=${dto.id}";
	
	location.href=url;
	
}
function Mupdate() {
	var url ="update";
	url =url+"?id=${dto.id}";
	url = url+"&col=${param.col}";
	url = url+"&word=${param.word}";
	url = url+"&nowPage=${param.nowPage}";
	 location.href=url;
	
}
function Del() {
	var url ="delete";
	url =url+"?id=${dto.id}";
	url =url+"&oldfile=${dto.fname}";
	url = url+"&col=${param.col}";
	url = url+"&word=${param.word}";
	url = url+"&nowPage=${param.nowPage}";
	 location.href=url;
	
}
</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="w3-center">${dto.mname}의 회원정보</DIV>
 

  <TABLE>
    <TR>
      <TD colspan="2"  ><img src="./storage/${dto.fname}">
      </TD>
    </TR>
     <TR>
      <TH>아이디</TH>
      <TD>${dto.id}</TD>
    </TR>
      <TR>
      <TH>성명</TH>
      <TD>${dto.mname}</TD>
    </TR>
      <TR>
      <TH>전화번호</TH>
      <TD>${dto.tel}</TD>
    </TR>
      <TR>
      <TH>이메일</TH>
      <TD>${dto.email}</TD>
    </TR>
      <TR>
      <TH>우편번호</TH>
      <TD>${dto.zipcode}</TD>
    </TR>
      <TR>
      <TH>주소</TH>
      <TD>${dto.address1}<br>
      ${Utility.checkNull(dto.address2)}</TD>
    </TR>
      <TR>
      <TH>직업</TH>
      <TD>
      직업코드:${dto.job}
      (${util:jobName(dto.job)})</TD>
<%--       (${utility.jobName(dto.job)})</TD> --%>
    </TR>
    <TR>
      <TH>날짜</TH>
      <TD>${dto.mdate}</TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    
    <input type='button' value='정보수정' onclick="Mupdate()">
    <input type='button' value='탈퇴' onclick="Del()">

	<c:if test="${not empty sessionScope.id && sessionScope.grade != 'A'}">
    <input type='button' value='사진수정' onclick="updateFile()">
    <input type='button' value='패스워드 변경' onclick="updatePwForm()">
  	</c:if>
  </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 