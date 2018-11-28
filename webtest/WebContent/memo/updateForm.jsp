<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%  request.setCharacterEncoding("utf-8"); 
int memono = 
Integer.parseInt(request.getParameter("memono"));
    
String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
    String user="soldesk";
    String password="1234";
    String driver="oracle.jdbc.driver.OracleDriver";
 
Class.forName(driver);
 
Connection con = 
DriverManager.getConnection(url, user, password);
 
StringBuffer sql = new StringBuffer();
sql.append(" select memono, title, content ");
sql.append(" from memo ");
sql.append(" where memono=? ");
 
PreparedStatement pstmt = 
con.prepareStatement(sql.toString());
pstmt.setInt(1, memono);
 
ResultSet rs = pstmt.executeQuery();
if(rs.next()){
 
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
}
div{
  text-align: center; 
  margin-top: 20px; 
  margin-bottom: 20px;
}
table{
  width: 50%;
  margin: 0 auto;
}
table,th,td{
border:1px solid black;
border-collapse:collapse;
}
 
</style> 
</head> 
<body> 
<jsp:include page ="/menu/top.jsp"/>
<div>수정</div>
<form name="frm" method="POST" 
action="./updateproc.jsp"
onsubmit="return input(this)">
<input type="hidden" name="memono" value="<%=memono %>">
<table>
<tr>
<th>제목</th>
<td>
<input type="text" name="title" size="30" 
value="<%=rs.getString("title")%>"/>
</td>
</tr>
<tr>
<th>내용</th>
<td>
<textarea rows="10" cols="30" name="content">
<%=rs.getString("content") %>
</textarea>
</td>
</tr>
</table>
<div>
<input type="submit" value="수정">
</div>
</form>
<jsp:include page="/menu/bottom.jsp"/> 

</body> 
</html> 
<%
 }
if(rs!=null)rs.close();
if(pstmt!=null)pstmt.close();
if(con!=null)con.close();
 
%>
 