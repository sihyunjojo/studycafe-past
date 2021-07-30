<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="/StudyCafeManagement/webjars/jquery/3.6.0/jquery.min.js"></script>
<script>
	function gotoBack(){
		location.href = "LoginMain";
	}
	$(document).ready(function(){
		  $("p").click(function(){
		    $(this).hide();
		  });
		});
</script>
<style>
form{
	text-align: center;
	margin: 0 auto;
	
}
.border {
	margin: 0 auto;
	width: 600px;
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
	<form action ="join" method="POST">
	<h1>회원가입</h1>
		<!-- 아이디 -->
		<div class="form-group">
			<label for="user_id">아이디</label><input type="text"
				class="form-control" id="user_id" name="user_id" placeholder="ID"
				required>
			<div class="check_font" id="id_check"></div>
		</div>
		<!-- 비밀번호 -->
		<div class="form-group">
			<label for="user_password">비밀번호</label> <input type="password"
				class="form-control" id="user_password" name="user_password"
				placeholder="PASSWORD" required>
			<div class="check_font" id="password_check"></div>
		</div>
		<!-- 비밀번호 재확인 -->
		<div class="form-group">
			<label for="user_checkpw">비밀번호 확인</label> <input type="password"
				class="form-control" id="user_checkpw" name="user_checkpw"
				placeholder="Confirm Password" required>
			<div class="check_font" id="checkpw_check"></div>
		</div>
		<!-- 이름 -->
		<div class="form-group">
			<label for="user_name">이름</label> <input type="text"
				class="form-control" id="user_name" name="user_name"
				placeholder="Name" required>
			<div class="check_font" id="name_check"></div>
		</div>
		<!-- 성별 -->
		<div class="form-group">
			<label for="user_gender">성별</label> <input type="text"
				class="form-control" id="user_gender" name="user_gender"
				placeholder="gender" required>
			<div class="check_font" id="gender_check"></div>
		</div>
		<!-- 휴대전화 -->
		<div class="form-group">
			<label for="user_phone">휴대전화 ('-' 없이 번호만 입력해주세요)</label> <input
				type="text" class="form-control" id="user_phone" name="user_phone"
				placeholder="Phone Number" required>
			<div class="check_font" id="phone_check"></div>
		</div>
		<!-- 주소 -->
		<div class="form-group">
			<label for="user_phone">주소</label> <input type="text"
				class="form-control" id="user_address" name="user_address"
				placeholder="address" required>
			<div class="check_font" id="address_check"></div>
		</div>
		<!-- 이메일 -->
		<div class="form-group">
			<label for="user_email">이메일</label> <input type="text"
				class="form-control" name="user_email" id="user_email"
				placeholder="E-mail" required>
			<div class="check_font" id="email_check"></div>
		</div>
		<!-- 생년월일 -->
		<div class="form-group required">
			<label for="user_birth">생년월일</label> <input type="text"
				class="form-control" id="user_birth" name="user_birth"
				placeholder="ex) 19980203" required>
			<div class="check_font" id="birth_check"></div>
		</div>
		<br>
		<input type = "submit" value = "가입"/>
		<br><br>
		<button onclick="gotoBack()">취소하기</button>
	</form>
	</div>
	
	<p>If you click on me, I will disappear.</p>
<p>Click me away!</p>
<p>Click me too!</p>
	

</body>
</html>