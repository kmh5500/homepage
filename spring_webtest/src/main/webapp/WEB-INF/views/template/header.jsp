<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


</head>
<body>
<!-- 상단 메뉴 -->




	<div class="header_Bg"><!-- header_Bg -->
			<div id="header"><!-- header -->
				<h1 id="logo"><a href=../../main/main.php ><img src="/images/common/logo.png" width="336" height="108" alt="MOM'S TOUCH CHICKEN&BURGER" /></a></h1>
				<div id="lnb"><!-- lnb -->
					<ul name="object">
<!--
						<li class="first"><a href=../../main/main.php ><img src="/images/common/lnb_01.png" width="27" height="8" alt="Home" /></a></li>
						<li><a href=../../front/login.php ><img src="/images/common/lnb_02.png" width="25" height="10" alt="Login" /></a></li>
						<li><a href=../../front/member_agree.php ><img src="/images/common/lnb_03.png" width="19" height="8" alt="Join" /></a></li>
						<li><a href=../../front/basket.php ><img src="/images/common/lnb_04.png" width="19" height="8" alt="Cart" /></a></li>
						<li class="last"><a href="#"><img src="/images/common/lnb_05.png" width="38" height="10" alt="Sitemap" /></a></li>
-->
					</ul>
				</div><!-- //lnb -->		
				<div id="gnb"><!-- gnb -->
					<ul>
						<li class="li_01" name="object"><a href="/sub/menu/menu_list.html"><img src="/images/common/gnb_01.gif" alt="Menu" /></a></li>
						<li class="li_02" name="object"><a href="/sub/store/store_01_list.html"><img src="/images/common/gnb_02.gif" alt="Store" /></a></li>
						<li class="li_03" name="object"><a href="/sub/franchise/franchise_01.html"><img src="/images/common/gnb_03.gif" alt="Franchise" /></a></li>
						<li class="li_04" name="object"><a href="/sub/customer/customer_01_list.html"><img src="/images/common/gnb_04.gif" alt="Customer" /></a></li>
						<li class="li_05" name="object"><a href="/sub/company/company_01.html"><img src="/images/common/gnb_05.gif" alt="Company" /></a></li>
						<!-- <li class="li_06" name="object"><a href="javascript:movemall();"><img src="/images/common/gnb_06.png" alt="Mom's mall" /></a></li> -->
						<li class="sns_list" name="object"><ul><li><a href="https://www.facebook.com/momstouchmain" target="_blank"><img src="/images/common/facebook_ico.png" alt="페이스북 바로가기"></a></li><li><a href="https://www.instagram.com/momstouch.love/" target="_blank"><img src="/images/common/insta_ico.png" alt="인스타그램 바로가기"></a></li><li><a href="https://www.youtube.com/channel/UCOwRjHPzIh3Xlayb85N1aCQ" target="_blank"><img src="/images/common/youtube_ico.png" alt="유튜브 바로가기"></a></li></ul></li>
					</ul>
				</div><!-- //gnb -->
			</div><!-- //header -->
		</div><!-- //header_Bg -->





<div style="background-color: #EEEEEE;">
<table class="table">
  <tr>
    <td class="td">
        <img class="img" src="${root }/template/images/help.jpg">
    </td>
  </tr>
  
  <tr>
    <td class="td">
   
     <ul class="nav nav-pills">
  <li class="nav-item">
    <a class="nav-link active" href="${root }/">홈</a>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">게시판</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="${root }/bbs/create.do">글 쓰기</a>
      <a class="dropdown-item" href="${root }/bbs/list.do">목록</a>
      <a class="dropdown-item" href="#">Link 3</a>
    </div>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">게시판</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="${root }/board/create.do">글 쓰기</a>
      <a class="dropdown-item" href="${root }/board/list.do">Board 목록</a>
      <a class="dropdown-item" href="#">Link 3</a>
    </div>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">메모</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="${root }/memo/create.do">메모</a>
      <a class="dropdown-item" href="${root }/memo/list.do">목록</a>
      <a class="dropdown-item" href="#">Link 3</a>
    </div>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">이미지 게시판</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="${root }/img/create">이미지 업로드</a>
      <a class="dropdown-item" href="${root }/img/list">목록</a>
      <a class="dropdown-item" href="#">Link 3</a>
    </div>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">Link</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#">Disabled</a>
  </li>

 	<c:choose>
 		<c:when test="${empty id }">
 		    <li class="nav-item"><a class="nav-link" href="${root }/member/agree"> Sign Up</a></li>
  		    <li class="nav-item"><a  class="nav-link" href="${root }/member/login"> Login</a></li>
  		    <li class="nav-item"><a  class="nav-link" href="${root }/member/logout"> Logout</a></li>
 		</c:when>
 		<c:otherwise>	
 			<c:if test="${grade!='A' }">
 			<li class="nav-item"><a  class="nav-link" href="${root }/member/read">Myinfo</a></li>
     	<li class="nav-item"><a  class="nav-link" href="${root }/member/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
  		<li class="nav-item"><a class="nav-link" href="${root }/member/delete">회원 탈퇴</a></li>s
 			</c:if>
 		</c:otherwise>
 	</c:choose>
  
    	
    <c:if test="${not empty id&&grade=='A' }">
    	
     <li id="admin"><a  class="nav-link" href="${root }/admin/list">회원목록</a></li>
     <li id="admin"><a  class="nav-link" href="${root }/team/list">직원목록</a></li>
     <li id="admin"><a  class="nav-link" href="${root }/team/create">직원등록</a></li>
     <li class="nav-item"><a  class="nav-link" href="${root }/member/logout"> Logout</a></li>
  
    </c:if>
 </ul>
    </td> 
  </tr>
 
</table>

</div>
<!-- 상단 메뉴 끝 -->
 
 
 
<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">
