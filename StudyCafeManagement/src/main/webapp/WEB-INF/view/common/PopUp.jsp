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
</head>
<body>
	팝업창입니다.
	<form>
		<label><input type=checkbox id="option">오늘 하루 보지 않기</label>
		<button onclick="closeWin()">닫기</button>
	</form> 
</body> 
</html>