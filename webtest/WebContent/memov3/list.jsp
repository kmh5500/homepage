<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>

<jsp:useBean id="dao" class="memo.MemoDAO"/>

<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if (col.equals("total")) {
		word = "";
	}
	
	int nowPage = 1;
	int recordPerPage = 5;
	
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int sno = (nowPage-1)*recordPerPage + 1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<MemoDTO> list = dao.list(map);
	
	int totalRecord = dao.total(map);
%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<script type="text/javascript">
function read(memono) {
	//alert(memono);
	 	// 잘 작동하는지 확인만 한 것
	var url = "./read.jsp";
	 	// 변수 선언 후 이동할 url주소 할당
	url = url + "?memono=" + memono;
		// url에 [?memono=숫자값]이 추가될 수 있게끔 할당
		// url 주소 안에는 빈 공간이 없게끔 해야 함
	url = url + "&col=<%=col %>";
	url = url + "&word=<%=word %>";
	url = url + "&nowPage=<%=nowPage %>";
	location.href = url;
		// javascript에서 url을 요청 보내는 문법
}
</script>

<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 

div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

table {
	width: 60%;
	margin: 0 auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
}

a:LINK {
color:#000000;
text-decoration: none;
}
a:VISITED {
color:#000000;
text-decoration: none;
}
a:HOVER {
color:#ff0000;
text-decoration: none;
}
a:ACTIVE {
color:#000000;
text-decoration: none;
}

.search {
	margin: 5px auto;
}
</style> 

</head> 

<body> 
<jsp:include page="/menu/top.jsp"/>

<div>메모 목록</div>

<div class="search">

<form method="post" action="./list.jsp">
 <select name="col">
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
 
 <input type="text" name="word">
 <button>검색</button>
 <button type="button" onclick="location.href='./createForm.jsp'">등록</button>
</form>

</div>

<table>
 <tr>
  <th>번호</th>
  <th>제목</th>
  <th>날짜</th>
  <th>조회수</th>
  <th>grpno</th>
  <th>indent</th>
  <th>ansnum</th>
 </tr>
<% if (list.size() == 0) { %>
 <tr>
  <td colspan="7">등록된 메모가 없습니다.</td>
 </tr>
<% } 
   else { 
 	for (int i=0; i<list.size(); i++) { 
 		MemoDTO dto = list.get(i);
%>
 <tr>
  <td><%=dto.getMemono() %></td>
  <td>
   <%
   		for (int r=0; r<dto.getIndent(); r++) {
   			out.print("&nbsp;&nbsp;");
   		}
   		if (dto.getIndent() > 0) {
   			out.print("<img src='../images/re.jpg'>");
   		}
   %>
   <a href="javascript:read('<%=dto.getMemono()%>')">
    <%=dto.getTitle() %>
   </a>
  </td>
  <td><%=dto.getWdate() %></td>
  <td><%=dto.getViewcnt() %></td>
  <td><%=dto.getGrpno() %></td>
  <td><%=dto.getIndent() %></td>
  <td><%=dto.getAnsnum() %></td>
 </tr>
<%
     } // for-end
   } // else-end
%>
</table>

<div>
 <%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
</div>

<jsp:include page="/menu/bottom.jsp"/>

</body> 
</html>