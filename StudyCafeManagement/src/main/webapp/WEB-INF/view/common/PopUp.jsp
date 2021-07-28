<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function setCookie(name, value) {
		var todayDate = new Date();
		todayDate.setHours(24);
		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ todayDate.toGMTString() + ";";
	}
	function closeWin() {
		if (document.getElementById("option").checked) {
			setCookie("name", "value");
			window.close();
		}
	}
</script>
<style>
div{
text-align: center;
}
label{
position: absolute; left: 0px; bottom: 0px;
}
button{
position: absolute; right: 0px; bottom: 0px;
}
img{
width: 30px; height:30px;
}
h1{
background: red;
}
</style>
</head>
<body>
<div>
<h3>베이직<img src="/StudyCafeManagement/resources/images/logo.jpg">스터디카페</h3>
<br><br>
<h1>안내드립니다</h1><br>
<p>최근 [베이직 스터디카페]의 특허 및 디자인등록 제품을 모방하는 업체가 많이 있습니다.</p><br>
<p>이는 타인의 [지식재산권]을 도용하는 범죄행위로 법적 책임을 지고, 추후 영업 제한과 거액의 손해배상 법적조치
가 따르게 됩니다.</p><br>
<p>현재 본사는 이미 받은 법원의 승소판결문을 바탕으로 점진적으로 단속하여 가맹점보호에 최선을 다하고 있습니다.</p>
</div>
	<form>
		<label><input type=checkbox id="option">오늘 하루 보지 않기</label>
		<button onclick="closeWin()">닫기</button>
	</form> 
</body> 
</html>