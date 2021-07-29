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
	height: 2000px;
	background-color:#FFEAD0;
}
input {
	background-color: white; 
	width: 400px;
	height : 50px;
	border : 1px solid #000;
	border-radius: 50px;
}
div {
	padding : 5px;
}
h5{
	font-family: 'Do Hyeon', sans-serif;
	font-size : 30px;
}
</style>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
</style>
</head>
<body>
	<div class="border">

		<form>
			<h1>아이디 찾기</h1>
			<br><h5>회원님의 아이디는</h5><br>
			<h4 style="color: green; 
			font-family: 'Do Hyeon', sans-serif; 
			font-size : 30px;">${forIdMember.user_id }</h4><br>
			<h5>입니다.</h5>
						<br><a href="/StudyCafeManagement/common/LoginMain">메인화면</a>
		</form>
	</div>
	

</body>
</html>