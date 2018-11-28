<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>




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

div {
	text-align: center;
	margin-top: 100px;
}
</style>
<script type="text/javascript">
function mlist() {
	var url = "./list.do";
	url = url + "?col=${param.col}";
	url = url + "&word=${param.word}";
	url = url + "&nowPage=${param.nowPage}";
	location.href = url;
}
</script>
</head>
<body>

<div>
<c:choose>
	<c:when test="${flag }">메모를 삭제 했습니다.</c:when>
	<c:otherwise>메모를 삭제 했습니다.</c:otherwise>
</c:choose>

<br>
 <input type="button" value="목록" onclick="mlist()">
</div>

</body>
</html>