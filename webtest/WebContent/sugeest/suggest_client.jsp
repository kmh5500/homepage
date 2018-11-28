
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String root = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
#suggest {
	display: block;
	postion: static;
	left: 0px;
	top: 30px;
	color: #000000;
	background: #EAEAEA;
	width: 500px"
}
</style>


<script type="text/javascript" src="../ajax/httpRequest.js"></script>
<script type="text/javascript">
var checkFirst = false;
var lastKeyword='';
var loopSendKeyword=false;

function startSuggest(){
	if(checkFirst==false){
		setTimeout("sendKeyword()",500);
		loopSendKeyword = true;
	}
	checkFirst= true;
}
function sendKeyword(){
	if(loopSendKeyword == false)return;
	var keyword= document.search.keyword.value;
	
	if(keyword==''){
		lastKeyword='';
		hide('suggest');
	}else if(keyword != lastKeyword){
		lastKeyword =keyword;
		var params ="keyword="+encodeURIComponent(keyword);
		sendRequest("<%=root%>/suggest", params, response, 'post');
	}setTimeout("sendKeyword();",500);
	
}
function response() {
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
 
// 응답 문자열 추출
			var resultText = httpRequest.responseText;
 
//  3|자바001,자바002,자바003
			var result = resultText.split('|');
 
// 갯수, 문자열을 정수로 변환
			var count = parseInt(result[0]);
 
			var keywordList = null;
 
				if (count > 0) {
// ,를 구분한 1차원 배열 생성
						keywordList = result[1].split(',');
 
						var html = '';
						html += "등록된 쿼리 목록(선택하세요.)<br>";
 
//  alert('keywordList.length: ' + keywordList.length);
						for (var i = 0; i < keywordList.length; i++) {
 
//log("keywordList[i]: " + keywordList[i]); 
 
// 특수 문자 표현: " --> \", \ --> \\            
									html += "<a href=\"javascript:select('"
								+ keywordList[i] + "')\">" + keywordList[i]
								+ "</a><br>";
// alert(html);
								}
 
// 목록을 출력할 DIV 태그
								var listView = document.getElementById('suggestList');
								 
								// DIV 태그 값 저장
								listView.innerHTML = html;
								 
								// 목록을 가지고 있는 DIV 태그 출력
								show('suggest');
								} else {
								hide('suggest');
								}
						} else {
						alert("에러 발생: " + httpRequest.status);
						}
				}
	}

function frmSend(f){
	f.submit();
}
function select(selectedKeyword){
	document.search.keyword.value =selectedKeyword;
	
	loopSendKeyword =false;
	checkFirst =false;
	hide('suggest');
	
}
</script>
</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->


	<FORM name='search' method='POST' action='./suggest_proc.jsp'>
		<input type="text" name="keyword" id="keyword" size="70"
			onkeydown="startSuggest()" /> 
			<input type='button' value='검색'
			onclick="frmSend(this.form)" />

		<div id="suggest">
			<div id="suggestList"></div>
		</div>

	</FORM>


	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
