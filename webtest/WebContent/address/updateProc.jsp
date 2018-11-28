<%@page import="address.addressDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="address.addressDAO"/>
<jsp:useBean id="dto" class="address.addressDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%


	boolean flag = dao.update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function alist() {
		var url = "list.jsp";
		location.href = url;
	}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div class="title">수정 결과</div>
	<div>
		<%
			if (flag) {
				out.print("수정 완료 하였습니다.");
			} else {
				out.print("수정 실패했습니다.");
			}
		%>
	</div>
	<div class="bottom">
		<button onclick="location.href='createForm.jsp'">계속등록</button>
		<button onclick="alist()">목록</button>
	</div>
	<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>
