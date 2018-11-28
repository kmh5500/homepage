<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../ssi/ssi.jsp" %>

<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
		// 검색 관련 처리
		
	if (col.equals("total")) {
		word = "";
	}
		
	int nowPage = 1;
	int recordPerPage = 5;
		// paging 관련 처리
		
	if (request.getParameter("nowPage") != null) {	
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
		// 처음 가져온 nowPage의 값이 null일 경우 형변환을 시도하면 Exception에러가 날 수 있으므로
		
	int sno = ((nowPage-1)*recordPerPage) + 1;
	int eno = nowPage * recordPerPage;
		// DB에서 가져올 레코드의 첫번호, 끝번호 설정
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);	

	List<BbsDTO> list = bdao.list(map);
	
	int totalRecord = bdao.total(map);
		// 전체 레코드 개수는 col, word 필요
		// 검색 시에도 페이징을 해줘야 하기 때문에
%>
 
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
function bread(bbsno) {
	var url = "./read.jsp";
	url = url + "?bbsno=" + bbsno;
	url = url + "&col=<%=col%>";
	url = url + "&word=<%=word%>";
	url = url + "&nowPage=<%=nowPage%>";
	location.href = url;
}
function fileDown(filename) {
	var url="<%=root%>/download";
	url = url+"?filename="+filename;
	url= url+"&dir=/bbs/storage";
	
	location.href = url;
	
	
}
</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->


<div class="search">

 <form name="frm" method="post" action="./list.jsp">
  <select name="col">
   <option value="wname"
   <%
   if (col.equals("wname")) {
	   out.print("selected");
   }
   %>
   >성명</option>
   <option value="title"
   <%
   if (col.equals("title")) {
	   out.print("selected");
   }
   %>
   >제목</option>
   <option value="content"
   <%
   if (col.equals("content")) {
	   out.print("selected");
   }
   %>
   >내용</option>
   <option value="total">전체 출력</option>  
  </select>

  <input type="text" name="word" value="<%=word %>">
  
  <button>검색</button>
  <button type="button" onclick="location.href='./createForm.jsp'">등록</button>
 </form>

</div>

<div class="container">

<h2><span class="glyphicon glyphicon-th-list"></span>
게시판 목록</h2>

  <table class="table table-hover">
   <thead>
    <TR>
      <TH>번호</TH>
      <TH>성명</TH>
      <TH>제목</TH>
      <TH>조회수</TH>
      <TH>등록일</TH>
      <TH>파일명</TH> 
    </TR>
   </thead>
<%
	if (list.size() == 0) {
%>    
   <tbody>
	<tr>
	 <td colspan="6">
	 등록된 글이 없습니다.
	 </td>
	</tr> 
   </tbody>   
<% 
	}
	else {
		for (int i=0; i<list.size(); i++) {
			BbsDTO dto = list.get(i);
%>
   <tbody>
    <TR>
    	<td><%=dto.getBbsno() %></td>
    	<td><%=dto.getWname() %></td>
    	<td>
    	 <%
    	 for (int r=0; r<dto.getIndent(); r++) {
    		 out.print("&nbsp;&nbsp;");
    	 }
    	 if (dto.getIndent() > 0) {
    		 out.print("<img src='../images/re.jpg'>");
    	 }
    	 %>
		 <a href="javascript:bread('<%=dto.getBbsno() %>')"><%=dto.getTitle() %></a>
		 <%
		 if (Utility.compareDay(dto.getWdate())) {
			 out.print("<img src='../images/new.gif'>");
		 }
		 %>
    	</td>
    	<td><%=dto.getViewcnt() %></td>
    	<td><%=dto.getWdate() %></td>
    	<td>
<%
if (dto.getFilename() != null) { %>
	<a href="javascript:fileDown('<%=dto.getFilename()%>')">
	<span class="glyphicon glyphicon-download-alt"></span>
	</a>

<%
}else {
	out.print("파일 없음");
}
%>    	
    	</td>
    </TR> 
   </tbody>    
<%
		}
	}
%>
  </TABLE>
  
  <DIV class='bottom'>
   <%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
  </DIV>

</div>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>