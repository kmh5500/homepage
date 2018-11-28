
<%@ page contentType="text/html; charset=UTF-8" %> 
 
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
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
<h2>
<%
request.setCharacterEncoding("UTF-8");
 
String keyword = request.getParameter("keyword");
 
//------------------------------------------------------
// 한글 문자셋 검색
// ------------------------------------------------------
// findCharSet(keyword);
// ------------------------------------------------------
        
out.println("keyword:" + keyword);
%>
</h2>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 