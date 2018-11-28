<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    boolean flag=(Boolean)request.getAttribute("flag");
    boolean pflag=(Boolean)request.getAttribute("pflag");
    String col =(String)request.getAttribute("col");
    String word =(String)request.getAttribute("word");
    String nowPage =(String)request.getAttribute("nowPage");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function listb(){
	var url="list.do";
	url+="?col=<%=col%>";
	url+="&word=<%=word%>";
	url+="&nowPage=<%=nowPage%>";
	
	location.href=url;
}

</script>
</head>
<body>
<%
if(!pflag){
	out.print("비밀번호 오류입니다.<BR><BR>");
}else if(flag){
	out.print("수정을 성공했습니다.<BR><BR>");
}else
	{out.print("수정을 실패했습니다.<BR><BR>");}
%>
<%if(flag){ %>
<button onclick="listb()">목록</button>
<%}else if(pflag==false|| flag==false){ %>
<button onclick="history.back()">다시시도</button>
<%} %>
</body>
</html>