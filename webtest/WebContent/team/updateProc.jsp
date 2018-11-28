
<%@ page contentType="text/html; charset=UTF-8" %>
	<%@ include file = "../ssi/ssi.jsp" %>
	
	
	<jsp:useBean id="dao" class="team.TeamDAO"/>
	<jsp:useBean id="dto" class="team.TeamDTO"/>
	<jsp:setProperty property="*" name="dto"/>
<%
	
/* 	int no = Integer.parseInt(request.getParameter("no"));
	String hobby = request.getParameter("hobby");
	String phone = request.getParameter("phone");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	String address2 = request.getParameter("address2");
	String[] skill = request.getParameterValues("skills");
	//String skills = request.getParameter("skills");
	
		TeamDTO dto= new TeamDTO();
				dto.setNo(no);
				dto.setSkill(skill);
				dto.setPhone(phone);
				dto.setHobby(hobby);	
				dto.setZipcode(zipcode);	
				dto.setAddress(address);	
				dto.setAddress2(address2);	
				
				TeamDAO dao= new TeamDAO(); */
				boolean flag = dao.update(dto);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	font-size: 20px;
}

</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function tlist() {
	var url = "list.jsp";
	
	location.href=url;
	
}
</script>
</head>
<body>
	<div id="title">입력 내용</div>
	<div>
		
		<%if(flag){
			out.print("팀정보가 수정 되었습니다");
		}else out.print("팀정보 수정이 실패했습니다");
		
		%>

	</div>
	<div id="bottom">
		<button onclick="tlist()">목록</button>
	</div>
</body>
</html>