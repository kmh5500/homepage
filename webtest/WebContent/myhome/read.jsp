
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %> 
 <jsp:useBean id="dao" class="member.MemberDAO"/>
 <%
 	String id = request.getParameter("id");
 	if(id==null) id = (String)session.getAttribute("id");
 	
 
 	MemberDTO dto = dao.read(id);
 %>
 
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">

<script type="text/javascript">
function updateFile() {
	var url="updateFileForm.jsp";
	url =url+"?id=<%=dto.getId()%>";
	url =url+"&oldfile=<%=dto.getFname()%>";
	
	location.href=url;
}
function updatePwForm() {
	var url="updatePwForm.jsp";
	url =url+"?id=<%=dto.getId()%>";
	
	location.href=url;
	
}
function Mupdate() {
	var url ="updateForm.jsp";
	url=url+"?id=<%=dto.getId()%>";
	 location.href=url;
	
}
</script>
<style type="text/css">
table td tr{
w3-center;
}
</style>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="./top.jsp"/><br>
<!-- *********************************************** -->

<DIV class="w3-theme w3-padding w3-center"><%=dto.getMname() %>의 회원정보</DIV>
 
  <TABLE  class='w3-table-all tr{border-bottom:1px solid #ddd}.w3-striped tbody tr:nth-child(even){background-color:#f1f1f1}'> 

    <TR >
      <TD colspan="2"><img src="./storage/<%=dto.getFname() %>">
      </TD>
    </TR>
     <TR >
      <TH >아이디</TH>
      <TD ><%=dto.getId() %></TD>
    </TR>
      <TR>
      <TH>성명</TH>
      <TD><%=dto.getMname() %></TD>
    </TR>
      <TR>
      <TH>전화번호</TH>
      <TD><%=dto.getTel() %></TD>
    </TR>
      <TR>
      <TH>이메일</TH>
      <TD><%=dto.getEmail() %></TD>
    </TR>
      <TR>
      <TH>우편번호</TH>
      <TD><%=dto.getZipcode() %></TD>
    </TR>
      <TR>
      <TH>주소</TH>
      <TD><%=dto.getAddress1() %><br>
      <%=Utility.checkNull(dto.getAddress2()) %></TD>
    </TR>
      <TR>
      <TH>직업</TH>
      <TD>
      직업코드:<%=dto.getJob() %>
      (<%=Utility.getCodeValue(dto.getJob()) %>)</TD>
    </TR>
      <TH>날짜</TH>
      <TD><%=dto.getMdate() %></TD>
    </TR>

  </TABLE>
  
  <DIV class='w3-center'>
    
    <input type='button'   value='정보수정' onclick="Mupdate()">
    <input type='button'   value='사진수정' onclick="updateFile()">
    <input type='button'   value='패스워드 변경' onclick="updatePwForm()">
  </DIV>

 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 