<%@ page contentType="text/html; charset=UTF-8" %> 

<%@ include file="/ssi/ssi.jsp" %>

<%

/* 
	TeamDAO dao= new TeamDAO(); */
	//boolean dflag= (boolean)request.getAttribute("dflag");
	//boolean flag= (boolean)request.getAttribute("flag");
	

	
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
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function tlist(){
	var url ="list";
	location.href=url;
	
	
}
</script>
</head> 
<body> 
<div id ="title">처리결과</div>
<div>
<c:choose>
	<c:when test="${dflag=='true' }">
	답변글이 있어 삭제할수 없습니다.
	</c:when>
	<c:when test="${flag=='true' }">
	삭제했습니다.
	</c:when>
	<c:otherwise>
	삭제 실패했습니다.
	</c:otherwise>
</c:choose>

</div>
<div id="bottom">
<button onclick="tlist()">목록</button>
</div>
</body> 
</html> 