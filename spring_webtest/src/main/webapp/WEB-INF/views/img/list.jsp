
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
.search{
	width:80%;
	text-align: center;
	margin: 2px auto;
}	
</style> 
<script type="text/javascript">
function iread(no){
	var url = "read";
	url = url + "?no="+no;
	/* url = url + "&col="+col;
	url = url + "&word="+word;
	url = url + "&paging="+paging; */
	location.href = url;
}

</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 <div class="search">
<form action="./list" method="post">
 <select name="col">
 	<option value="No"
	<c:if test="${col =='name'}">selected</c:if>>No</option>
 	<option value="title"

 	<c:if test="${col=='title' }">selected</c:if>>
 	>제목</option>
 	<option value="total">전체</option>
  </select>
  <input type="text" name="word" value="${word}">
  <button>검색</button>
  <button type="button" onclick="location.href='create'">등록</button>
  </form>
 </div>
 
<DIV class="container">
<span class=""></span>
<h2>목록</h2>

  <TABLE class="table table-hover">
    <TR>
      <TH>No</TH>
      <TH>Img</TH>
      <TH>제목</TH>
      <TH>조회수</TH>
      <TH>등록일</TH>
    </TR>
    
    
    <c:choose>
    	<c:when test="${empty list}">
	    	<tr>
			    <td colspan="8">
				등록된 글이 없습니다.
				</td>
			</tr>
    	</c:when>
    	<c:otherwise>
    		
    
    	

   
   	<c:forEach var="dto" items="${list }">
        	&nbsp;&nbsp;
        	
    <TR>
    	<td>${dto.no}</td>
		<c:choose>
			<c:when test="${dto.indent==0}">
							
    	<td>
 
    	<img src='${root }/img/storage/${dto.fname}' width="200px" height = "200px">
    	</td>
			</c:when>

			<c:otherwise>
    			<td><img src='${root}/images/re.png' width="100px" height = "100px"></td>
			
			</c:otherwise>
		
		</c:choose>
		
    	<td><a href="javascript:iread('${dto.no}')">${dto.title}</a></td>
    	<td>${dto.viewcnt}</td>
    	<td>${dto.wdate}</td>
    </TR> 
   			</c:forEach>
       	</c:otherwise>
    
    </c:choose>
   

  </TABLE>
  <DIV class='bottom'>
   
    ${paging}
   
  </DIV>
  
</DIV>

<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 