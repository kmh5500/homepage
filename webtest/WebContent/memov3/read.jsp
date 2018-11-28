<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO" />

<%
int memono = Integer.parseInt(request.getParameter("memono")); 

dao.updateViewcnt(memono);
	// 조회수 증가

MemoDTO dto = dao.read(memono);
	// 번호로 조회한 내용 dto에 할당 
	
String content = dto.getContent();
content = content.replaceAll("\r\n", "<br>");
	// content 변수에 조회한 내용을 담고
	// 입력값 중 엔터들을 <br>태그로 바꿔주어 브라우저에서 한 줄 띄워서 출력되게끔
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
div{
text-align: center; 
   margin-top: 20px; 
   margin-bottom: 20px;
}
table{
   width: 60%;
   margin: 0 auto;
}
table,th,td{
border:1px solid black;
border-collapse:collapse;
}
th,td{
padding:10px
}
</style> 

<script type="text/javascript">
function mcreate() {
	var url = "./createForm.jsp";
	location.href = url;
}

function mupdate(memono) {
	var url = "./updateForm.jsp";
	url += "?memono=" + memono;
	url = url + "&col=<%=request.getParameter("col") %>";
	url = url + "&word=<%=request.getParameter("word") %>";
	url = url + "&nowPage=<%=request.getParameter("nowPage") %>";	
	location.href = url;
}

function mdelete(memono) {
	var url = "./deleteForm.jsp";
	url += "?memono=" + memono;
	url = url + "&col=<%=request.getParameter("col") %>";
	url = url + "&word=<%=request.getParameter("word") %>";
	url = url + "&nowPage=<%=request.getParameter("nowPage") %>";
	location.href = url;
}

function mlist() {
	var url = "./list.jsp";
	url = url + "?col=<%=request.getParameter("col") %>";
	url = url + "&word=<%=request.getParameter("word") %>";
	url = url + "&nowPage=<%=request.getParameter("nowPage") %>";
	location.href = url;
}

function mreply() {
	var url = "./replyForm.jsp";
	url = url + "?memono=<%=memono %>";
	location.href = url;
}
</script>
</head> 
<body> 

<jsp:include page="/menu/top.jsp"/>

<div>조회</div>
<table>
 <tr>
  <th>제목</th>
  <td>
   <%=dto.getTitle() %>
  </td>
 </tr>
 <tr>
  <th>내용</th>
  <td>
   <%=content %>
  </td>
 </tr>
 <tr>
  <th>조회수</th>
  <td>
   <%=dto.getViewcnt() %>
  </td>
 </tr>
 <tr>
  <th>등록일</th>
  <td>
   <%=dto.getWdate() %>
  </td>
 </tr>
</table>

<div>
 <input type="button" value="등록" onclick="mcreate()">
 <input type="button" value="수정" onclick="mupdate('<%=dto.getMemono()%>')">
 <input type="button" value="삭제" onclick="mdelete('<%=dto.getMemono()%>')">
 <input type="button" value="목록" onclick="mlist()">
 <button onclick="mreply()">답변</button>
</div>

<jsp:include page="/menu/bottom.jsp"/>

</body> 
</html>