
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/> 
<%
	String upDir = application.getRealPath("/member/storage");
	String tempDir = application.getRealPath("/member/temp");
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	String id = upload.getParameter("id");
	String oldfile =UploadSave.encode(upload.getParameter("oldfile"));
	FileItem fileItem = upload.getFileItem("fname");
	String fname =null;
	if(fileItem.getSize()>0){
		UploadSave.deleteFile(upDir,oldfile);
		fname = UploadSave.saveFile(fileItem, upDir);
	}
	Map map = new HashMap();
	map.put("id", id);
	map.put("fname", fname);

	boolean flag =dao.updateFile(map); 
	
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
<script type="text/javascript">
function read() {
	var url ="read.jsp";
	url=url+"?id=<%=id%>";
	
	location.href=url;
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">사진변경</DIV>
 <div class="content">
 <%
 if(flag){
	 out.print("사진변경 했습니다.");
 }else{
	 out.print("사진변경을 실패했습니다.");
 }
 %>
</div>
  <%if(flag){ %>
  <DIV class='bottom'>
    <input type='button' value='나의정보' onclick="read()">
    <%}else{ %>
    <input type='button' value='다시시도' onclick="history.back()">
  <%} %>
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 