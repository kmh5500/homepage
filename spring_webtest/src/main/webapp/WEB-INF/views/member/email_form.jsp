
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 
 <%
 	
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
<style type="text/css">

li#admin{
float:right;
padding-right: 30px
}
</style>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

 
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
function emailCheck(email){
	if(email==""){
		alert("이메일을 입력해 주세요");
		document.frm.email.focus();
	}else{
	//	var url ="email_proc.jsp";
		var url ="emailCheck";
		$.ajax({
			url:url,
			type:"GET",
			dataType:"text",
			data:{"email":email},
			success:function(data){
				$("#emailCheck").text(data.trim()).css("color","red");
				if(data.trim().indexOf("중복 아님")!=-1)
 				$("#emailCheck").append("<button onclick='use()'>적용</button>");
				
			}
		});
		
<%-- 		<%boolean flag= (boolean)request.getAttribute("flag");%> --%>
		
		
	/* 	url += "?email="+email;
		wr = window.open(url,"이메일중복확인","width=500,height=500");
		wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2); */
		}
	}	
	function use(){
		opener.frm.email.value  = document.frm.email.value;
		self.close()
	}
</script>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="container">Email 중복 확인
<h2>Email 중복 확인</h2>
 

<FORM name='frm' method='POST' action='./email_proc'>
<div class="content">
Email를 입력해주세요.<br><br>
 </div>
  <TABLE class="table">
    <TR>
      <TH>이메일</TH>
      <TD><input type ="text" name ="email" size="20"></TD>
    </TR>
  </TABLE>
  
<div id="emailCheck"></DIV>
  <DIV class='bottom'>
    <input type='button' value='중복확인' onclick="emailCheck(this.form.email.value)">

    <input type='button' value='취소' onclick="window.close()">
  </DIV>
</FORM>

</DIV>
</body>
<!-- *********************************************** -->
</html> 