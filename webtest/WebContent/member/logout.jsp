
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %> 
 <% 
request.setCharacterEncoding("utf-8"); 
session.invalidate();//모든 세션변수 제거
 
response.sendRedirect("../index.jsp");
 
%> 
 