<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ include file = "../ssi/ssi.jsp" %>

<jsp:useBean id="dao" class="address.addressDAO"/>
<% 

 	
 	int no =  Integer.parseInt(request.getParameter("no"));
 	addressDTO dto=dao.read(no);
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function tlist(){
	var url = "list.jsp";
	location.href=url;
}
</script>
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
<table>
	<tr>
		<th>no</th>
		<td><%=dto.getNo() %></td>
	</tr>	
	<tr>
		<th>이름</th>
		<td><%=dto.getName() %></td>
	</tr>
	<tr>	
		<th>전화번호</th>
		<td><%=dto.getPhone() %></td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td><%=dto.getZipcode() %></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><%=dto.getAddress() %></td>
	</tr>
	<tr>
		<th>상세주소</th>
		<td><%=dto.getAddress2() %></td>
	</tr>
		
</table>
<div class="bottom">
<button type="button" onclick="tlist()">목록</button>
</div>
	<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html> 