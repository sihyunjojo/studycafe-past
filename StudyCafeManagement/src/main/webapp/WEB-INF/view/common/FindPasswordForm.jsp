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

		<form action="findPasswordForm" method="post">
			<h1>비밀번호 찾기</h1>
			<label for = "user_name">이름: </label>
			<input type="text" name="user_name" id="user_name"
			placeholder="이름을 입력해주세요."><br>
			<label for = "user_id">아이디: </label>
			<input type="text" name="user_id" id="user_id"
				placeholder="아이디를 입력해주세요."><br> <br>
			<input
				type="submit" value="확인"><br> <br>
						<br><a href="/StudyCafeManagement/common/LoginMain">메인화면</a>
		</form>
	</div>
	

</body>
</html>