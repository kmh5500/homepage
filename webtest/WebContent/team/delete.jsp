<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="team.TeamDAO"/>
<%
	 int no =Integer.parseInt(request.getParameter("no"));
/* 
	TeamDAO dao= new TeamDAO(); */
	boolean dflag= dao.chenkRefnum(no);
	boolean flag = false;
	if(!dflag){
		flag =dao.delete(no);
	}
	
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
	var url ="list.jsp";
	location.href=url;
	
	
}
</script>
</head> 
<body> 
<div id ="title">처리결과</div>
<div>
<%	
	if(flag==false){
 		out.print("답변글이 있어 삭제할수 없습니다.");
 	}else if(flag){
 		out.print("글을 삭제했습니다.");
 	}else{
 		out.print("글 삭제를 실패했습니다.");
 	}

%>
</div>
<div id="bottom">
<button onclick="tlist()">목록</button>
</div>
</body> 
</html> 