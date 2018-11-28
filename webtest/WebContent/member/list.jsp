
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/> 


 <%
 	String col= Utility.checkNull(request.getParameter("col"));
 	String word= Utility.checkNull(request.getParameter("word"));
 	if(col.equals("total")){
 		word="";
 	}
 	//페이징
 	int nowPage	=1;
 	int recordPerPage=5;
 	if(request.getParameter("nowPage")!=null){
 		nowPage=Integer.parseInt(request.getParameter("nowPage"));
 	}
 	//db에서 가져올 순번
 	int sno= ((nowPage-1)*recordPerPage)+1;
 	int eno= nowPage* recordPerPage;
 	
 	Map map= new HashMap();
 	map.put("col", col);
 	map.put("word", word);
 	map.put("sno", sno);
 	map.put("eno", eno);
 	
 	int total= dao.total(map);
 	List<MemberDTO> list =dao.list(map);
 	
 	String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
 			
 	
 	
 
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
search{
text-align center;
margin: 3px auto;
}
</style> 
<script type="text/javascript">
function read(id) {
	url="read.jsp";
	url = url+"?id="+id;
	
	location.href=url;
}

</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원목록</DIV>
 <div class="search">
<FORM name='frm' method='POST' action='./list.jsp'>
  <select name="col">
  	<option value="id">아이디
  	<%if(col.equals("id")) out.print("selected"); %></option>
  	<option value="email">이메일
  	<%if(col.equals("email")) out.print("selected"); %></option>
  	<option value="mname">성명
  	<%if(col.equals("mname")) out.print("selected"); %></option>
  	<option value="total">전체출력</option>
  </select>
  <input type="text" name ="word" value= "<%=word %>">
  <button>검색</button>
  <button onclick="location.href='./createForm.jsp'">회원가입</button>
  </FORM>
  </div>
  
  <div class="container">
  <h2><span class="glyphicon glyhicon-th-list"></span>
  회원 목록
  </h2>
 <%
 	for(int i=0;i<list.size();i++){
 		MemberDTO dto= list.get(i);
 %>
  <TABLE class="table table-hover">
    <TR>
    	<td rowspan="5" style="width: 20%"><img src='./storage/<%=dto.getFname()%>' width="200px" heigh="200px"> </td>
      <TH style="width: 20%">아이디</TH>
      <TD style="width: 50%">
      <a href="javascript:read('<%=dto.getId()%>')"> 
      <%=dto.getId() %></a></TD>
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
      <TH>주소</TH>
      <TD><%=Utility.checkNull(dto.getAddress1()) %><br>
      <%=Utility.checkNull(dto.getAddress2()) %></TD>
    </TR>
     
    
  </TABLE>
  <%} %>
  <DIV class='bottom'>
  <%=paging %>
    <input type='submit' value=''>
    <input type='button' value='' onclick="location.href=''">
  </DIV>
</div>

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 