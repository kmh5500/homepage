<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%
	String root = request.getContextPath();
	String id=(String)session.getAttribute("id");
	String grade=(String)session.getAttribute("grade");


%>
<!DOCTYPE html> 
<html> 
<head>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title> 
<!-- <style type="text/css">
ul#menu li{
display : inline;
}
ul#menu li a{
background-color: black;
color:white;
padding : 10px 20px;
text-decoration:none;
border-radius:4px 4px 0 0;
}
ul#menu li a:hover{
background-color: orange;
}
.table{
width: 100%;
} 
.table,.td{
border-style: none;
}
</style>
 -->
<style type="text/css">
li#admin{
float:right;
padding-right: 30px
}
</style>
</head>
<body>
<!-- 상단 메뉴 -->
<div style="background-color: #EEEEEE;">
<table class="table">
  <tr>
    <td class="td">
       <a href="https://www.amazon.co.jp/"><img 
        src="<%=root %>/menu/images/main.jpg" width='100%' height='150%'></a>
    </td>
  </tr>
  
  <tr>
    <td class="td">
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=root%>/index.jsp">WebTest</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="<%=root%>/index.jsp">Home</a></li>
      <%if(id!=null){ %>
      <li><a href="<%=root%>/member/deleteForm.jsp">회원 탈퇴</a></li>
      <li><a href="<%=root%>/member/logout.jsp">로그아웃</a></li>
      <%} %>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" 
      href="#">게시판 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=root%>/bbs/createForm.jsp">생성</a></li>
          <li><a href="<%=root%>/bbs/list.jsp">목록</a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" 
      href="#">메모 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=root%>/memov3/createForm.jsp">생성</a></li>
          <li><a href="<%=root%>/memov3/list.jsp">목록</a></li>
        </ul>
      
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" 
      href="#">이미지 게시판 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=root%>/img/createForm.jsp">생성</a></li>
          <li><a href="<%=root%>/img/list.jsp">목록</a></li>
        </ul>
      
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
    <%if(id==null){ %>
      <li><a href="<%=root%>/member/agreement.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="<%=root%>/member/loginForm.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    <%}else{ %>
        <li><a href="<%=root%>/member/read.jsp"><span class="glyphicon glyphicon-user"></span> Myinfo</a></li>
      <li><a href="<%=root%>/member/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>

    <%} %>
    <%if(id!=null && grade.equals("A")){ %>
     <li id="admin"><a href="<%=root %>/admin/list.jsp">회원목록</a></li>
    <%} %>
    </ul>
  </div>
</nav>
    </td> 
  </tr>
 
</table>
</div>
<!-- 상단 메뉴 끝 -->
 
 
 
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">

