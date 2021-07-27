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

	$(window).bind("beforeunload", function(e) {
		if ($("#option").is(":checked")) {
			setCookie("name", "value");
		}
	});

	function closeWin() {
		if ($("#option").is(":checked")) {
			setCookie("name", "value");
			window.close();
		}
	}
</script>
</head>
<body>
	팝업창입니다.
	<form>
		<input type=checkbox value="option"> 
	</form> 
</body> 
</html>