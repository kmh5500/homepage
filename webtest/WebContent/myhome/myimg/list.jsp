
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 
  <jsp:useBean id="dao" class="img.ImgDAO"/>
 
 <%
 
 
/*  	String col="title";
	String word= "스트"; */
 	String col=Utility.checkNull(request.getParameter("col"));
	String word=Utility.checkNull(request.getParameter("word")); 
	
	if(col.equals("total")) word="";
	//paging관련
	int nowPage =1;
	int recordPerPage=4;
	if(request.getParameter("nowPage")!=null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	//db에서 가져올 레코드의 순번
	int sno =((nowPage-1)*recordPerPage)+1;
	int eno =nowPage * recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	List<ImgDTO> list = dao.list(map);
	int totalRecord =dao.total(map);
 %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">


<script type="text/javascript">
function iread(no){
	var url = "read.jsp";
	url = url + "?no="+no;
	location.href = url;
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/myhome/top.jsp"/><br>
<!-- *********************************************** -->
  <div class="w3-center">
<form action="./list.jsp" method="post">
 <select name="col">
 	<option value="No"
 	<%if(col.equals("No"))out.print("selected"); %>>No</option>
 	<option value="title"
 	<%if(col.equals("title"))out.print("selected"); %>>제목</option>
 	<option value="content"
 	<%if(col.equals("content"))out.print("selected"); %>>내용</option>
 	<option value="total">전체</option>
  </select>
  <input type="text" name="word" value="<%=word%>">
  <button>검색</button>
  <button type="button" onclick="location.href='createForm.jsp'">등록</button>
  </form>
 </div>
  
<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
  <!-- First Photo Grid-->
  <h2>목록</h2>
  <div class="w3-row-padding w3-padding-16 w3-center" id="food">
  
  
   <%-- <% if(list.size()==0) {  %>
    <tr>
	    <td colspan="8">
		등록된 글이 없습니다.
		</td>
	</tr>
<%}else {for(int i = 0 ;i <list.size();i++){  ImgDTO dto = list.get(i);%> --%>
  
  
  
<%for(int i = 0 ;i <list.size();i++){  ImgDTO dto = list.get(i);%>
    <div class="w3-quarter">
      <img src='./storage/<%=dto.getFname()%>' alt="Sandwich" style="width:100%">
      <h3><a href="javascript:iread('<%=dto.getNo() %>')"><%=dto.getTitle() %></a></h3>
      <p><%=dto.getContent() %></p>
    </div>
    
  <%} %>
  
 </div>
  <DIV class='bottom'>
   
    <%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
   
  </DIV>
 </div>
<!-- *********************************************** -->
<jsp:include page="/myhome/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 