
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %> 
 <jsp:useBean id="dto" class="bbs.BbsDTO"/>


<%-- <jsp:setProperty name="dto" property="*"/> --%>
	<!-- enctype으로 받아오면 setProperty 사용 불가 -->

<%
	String tempDir = application.getRealPath("myhome/bbs/temp");
	String upDir = application.getRealPath("myhome/bbs/storage");
	
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(upload.getParameter("passwd"));
	
	FileItem fileItem = upload.getFileItem("filename");
	
	int filesize = (int)fileItem.getSize();
	
	String filename = null;
	
	if (filesize > 0) {
		filename = UploadSave.saveFile(fileItem, upDir);				
	}
	
	dto.setFilename(filename);
	dto.setFilesize(filesize);

	boolean flag = bdao.create(dto);
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">

<script type="text/javascript">
function blist() {
	var url = "./list.jsp";
	
	location.href = url;
}
</script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">


</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/myhome/top.jsp"/><br>
<!-- *********************************************** -->
 
<DIV class="w3-center">등록 결과</DIV>

<div class="w3-center">
<%
	if (flag) {
		out.print("등록이 성공 했습니다.");
	}
	else {
		out.print("등록이 실패 했습니다.");
	}
%>
</div>
  
  <DIV class="w3-center">
    <input type="button" value='계속 등록' onclick="location.href='createForm.jsp'">
    <input type="button" value='목록' onclick="blist()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/myhome/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 