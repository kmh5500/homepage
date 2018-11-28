<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="address.addressDAO"/>
	<%
	
		List<addressDTO> list = dao.list();
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
<link href="<%=root%>/css/style.css" rel="Stylesheet">

<script type="text/javascript">
function read(no) {
	var url ="read.jsp";
	url=url+"?no="+no;
	location.href=url;
}
function update(no) {
	var url ="updateForm.jsp";
	url=url+"?no="+no;
	location.href=url;
}
function del(no) {
	if(confirm("정말 삭제 하시겠습니까?")){
	var url ="delete.jsp";
	url=url+"?no="+no;
	location.href=url;}
}
function reply(no) {
	url = "replyForm.jsp";
	url=url+"?no="+no;
	
	location.href=url;
			
	
}

</script> 
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="title">목록</div>
<div></div>

<table>
	<tr>
		<th>NO</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>수정/삭제</th>
	
	</tr>
	
	<%
	for(int i=0;i<list.size();i++){
		addressDTO dto= list.get(i);
	%>
	<tr>
		<td><%=dto.getNo() %></td>
		<td>
		<%for(int r=0;r<dto.getIndent();r++) {
     		out.print("&nbsp;&nbsp;");
     	}
     	if(dto.getIndent()>0)out.print("<img src='../images/re.jpg'>");
      	%>
		<a href="javascript:read('<%=dto.getNo() %>')"><%=dto.getName() %></a></td>
		<td><%=dto.getPhone() %></td>
		<td><%=dto.getAddress() %></td>
		<td><a href="javascript:update('<%=dto.getNo() %>')">수정</a>/
		<a href="javascript: del('<%=dto.getNo() %>')">삭제</a>/
		<a href="javascript: reply('<%=dto.getNo() %>')">답변</a>
		</td>
		

	</tr>
	<% } %>
</table>
<div class="bottom">
<button type="button" onclick="location.href='./createForm.jsp'">등록</button>

</div>
	<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html> 