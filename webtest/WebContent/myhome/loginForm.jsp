
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %> 
<%   
/*----쿠키설정 내용시작----------------------------*/
String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
String c_id_val = ""; // ID 값
 
Cookie[] cookies = request.getCookies(); 
Cookie cookie=null; 
 
if (cookies != null){ 
 for (int i = 0; i < cookies.length; i++) { 
   cookie = cookies[i]; 
 
   if (cookie.getName().equals("c_id")){ 
     c_id = cookie.getValue();     // Y 
   }else if(cookie.getName().equals("c_id_val")){ 
     c_id_val = cookie.getValue(); // user1... 
   } 
 } 
} 

/*----쿠키설정 내용 끝----------------------------*/
 
%> 
<!DOCTYPE html> 
<html> 

<meta charset="UTF-8"> 
<title></title> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<head> 
<link href="/webtest/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="./top.jsp"/><br>
<!-- *********************************************** -->
<DIV class="title">로그인</DIV>
 
<FORM name='frm' method='POST' action='<%=root %>/myhome/loginProc.jsp'>
  <TABLE>
    <TR>
      <TH class="w3-bar-item w3-red w3-mobile">아이디</TH>
      <TD><input  type="text" name="id"  value='<%=c_id_val %>'>
        <% 
       if (c_id.equals("Y")){  // id 저장 상태라면 
       %>   
         <input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장 
       <% 
       }else{ %> 
         <input type='checkbox' name='c_id' value='Y' > ID 저장 
       <% 
       } 
       %> 
      </TD>
    </TR>
    <TR>
      <TH class="w3-bar-item w3-red w3-mobile">비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
    <TR>
      <TD colspan="2" style="text-align: center">  
      <A href="<%=root %>/myhome/idfine.jsp">아이디</A> 
      /
     <A href="<%=root %>/myhome/pwfine.jsp"> 비밀번호 찾기</A>
     </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='로그인'>
    <input type='button' value='회원가입' 
    onclick="location.href='agreement.jsp'">
  </DIV>
</FORM>
 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 