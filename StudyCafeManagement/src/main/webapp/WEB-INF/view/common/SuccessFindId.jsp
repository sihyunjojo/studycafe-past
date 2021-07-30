<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
form{
	text-align: center;
	margin: 0 auto;
}

.border {
	margin: 0 auto;
	width: 400px;
	height: 500px;
	border: 1px solid #000;
	border-radius: 10%;
}


input {
	width: 300px;
}
</style>
</head>
<body>
		<header>
		
			<%@include file="../nav.jsp" %>
			
		</header>
	<div class="border">

		<form>
			<h1>아이디 찾기</h1>
			<br><h5>회원님의 아이디는</h5><br>
			<h4 style="color: green;">${forIdMember.user_id }</h4><br>
			<h5>입니다.</h5>
						<br><a href="/StudyCafeManagement/common/LoginMain">메인화면</a>
		</form>
	</div>
	

</body>
</html>