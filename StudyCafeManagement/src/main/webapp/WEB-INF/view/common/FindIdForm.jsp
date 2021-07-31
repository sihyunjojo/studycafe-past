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
	font-family: 'Do Hyeon', sans-serif;
	font-size : 20px;
}
h1 {
	font-weight : 900;
	color :	#FF8C0A;
	font-size:70px; 
	font-family: 'Do Hyeon', sans-serif;
}
.border {
	margin: 0 auto;
	height : 2000px;
	background-color:#F5F6F7;
}
input {
	background-color: white; 
	width: 400px;
	height : 50px;
	border : 1px solid #000;
	border-radius: 50px;
}
div {
	padding : 3px;
}
</style>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
</style>
</head>
<body>
		<header>
		
			<%@include file="../nav.jsp" %>
			
		</header>
	<div class="border">

		<form action="findIdForm" method="post">
			<h1>아이디 찾기</h1>
			<label for = "user_name">이름: </label><br>
			<input type="text" name="user_name" id="user_name"
			placeholder="이름을 입력해주세요."><br>
			<label for = "user_phone">전화번호: </label><br>
			<input type="text" name="user_phone" id="user_phone"
				placeholder="휴대전화 ('-' 없이 번호만 입력해주세요)"><br> <br>
			<input
				type="submit" value="확인" style = "background-color : #FFAF00; 
			width : 300px; height : 50px; border : 1px; border-radius: 0%;
			font-family: 'Do Hyeon', sans-serif;
			font-size:20px; "/><br> <br>
						<br><a href="/StudyCafeManagement/common/LoginMain">메인화면</a>
		</form>
	</div>
	

</body>
</html>