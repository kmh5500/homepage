<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ include file = "../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="team.TeamDAO"/>
<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	if(col.equals("total")){
		word = "";
		}
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	 
	List<TeamDTO> list = dao.list(map);
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
function read(no){
	//alert(no);
	var url = "read.jsp";
	url= url+"?no="+no;
	location.href=url;
}
function update(no){
	//alert(no);
	var url="updateForm.jsp";
	url= url+"?no="+no;
	location.href=url;
	
}
function del(no){
	//alert(no);
	if(confirm("정말 삭제하시겠습니까?")){
		var url = "delete.jsp";
		url = url+"?no="+no;
		
		location.href=url;
	}
}
function reply(no) {
	var url= "replyForm.jsp";
	url= url+"?no="+no;
	
	location.href=url;
}
</script>

</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="title">팀 목록</div>
<div class="search">
<form method="POST" action="./list.jsp">
<select name="col">
 <option value="name">이름</option>
 <option value="address">주소</option>
 <option value="skill">보유기술</option>
 <option value="phone">전화번호</option>
 <option value="total">전체 </option>
</select>
<input type="text" name="word">
<input type="submit" value="검색">
</form>
</div>
<table >
<tr>
	<th>번호</th>
	<th>이름</th>
	<th>성별</th>
	<th>전화번호</th>
	<th>보유기술</th>
	<th>수정/삭제/답변</th>
	<th>grpno</th>
	<th>indent</th>
	<th>ansnum</th>
</tr>
<%
for(int i=0; i<list.size();i++){
	TeamDTO dto = list.get(i);
	
%>
<tr>
<%-- 	<td><a href="javascript:read('<%=rs.getInt("memono") %>')"><%=rs.getString("title") %><a/></td> --%>
	<td><%= dto.getNo() %></td>
<%-- 	<td><%= dto.getName() %></td> --%>
	<td>
	<%
		for(int r=0;r<dto.getIndent();r++)out.print("&nbsp&nbsp");
		
		if(dto.getIndent()>0)out.print("<img src='../images/re.jpg'>");
	%>


	<a href="javascript:read('<%=dto.getNo() %>')"><%=dto.getName()%><a/></td>
	<td><%= dto.getGender() %></td>
	<td><%= dto.getPhone() %></td>
	<td><%= dto.getSkills() %></td>
	<td><a href="javascript:update('<%=dto.getNo() %>')" >수정</a>
	/
	<a href="javascript:del('<%=dto.getNo() %>')"> 삭제</a>
	/<a href="javascript:reply('<%=dto.getNo()%>')">답변 </a>
	</td>
	<td><%=dto.getGrpno() %></td>
	<td><%=dto.getIndent() %></td>
	<td><%=dto.getAnsnum() %></td>
</tr>
<%
}

 %>
</table>
<div class="bottom">
<button></button>

<button type="button" onclick="location.href='./createForm.jsp'">등록</button>
</div>
<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html> 