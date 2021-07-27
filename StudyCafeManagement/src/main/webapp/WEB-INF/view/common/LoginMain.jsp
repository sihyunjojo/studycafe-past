<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html> 

<html>
<head>
<meta charset="UTF-8">
<title>베이직 스터디 카페입니다.</title>
<style>
.idInput {
	font-size: 30px;
	line-height: 35px;
	position: relative;
	width: 100%;
	height: 35px;
	padding: 16px 0px 12px;
	color: #000;
	border: 1x solid #6E6E6E;
	background: #fff;
	-webkit-appearance: none;
}

.passwdInput {
	font-size: 30px;
	line-height: 35px;
	position: relative;
	top: 10px;
	width: 100%;
	height: 35px;
	padding: 16px 0px 12px;
	color: #000;
	border: 1x solid #6E6E6E;
	background: #fff;
	-webkit-appearance: none;
}

.LoginButton {
	width: 100%;
	height: 54px;
	line-height: 52px;
	font-size: 18px;
	font-weight: 700;
	margin: 20px 0 0 0;
}

#loginFormArea {
	width: 500px;
	height: 500px;
	margin: 10px;
	text-align: center;
}

header {
	background-color: blueviolet;
	height: 150px;
	padding: 5px;
	margin: 5px;
	text-align: center;
}

header a {
	font-size: 30px;
	font-weight: bold;
	color: white;
	padding: 25px;
	margin: auto;
	text-decoration: none;
}

section {
	width: 100%;
	float: left; /*띄우다 문서나 사진이 있을때 그림을 오른쪽 정렬이나 문서 배치 할때 사용  */
	padding: 5px;
}

div.cafe_menus {
	font-size: 80px;
	font-weight: bold;
}

div {
	font-size: 35px;
	font-weight: normal;
}

.section-container {
	width: 1500px;
	height: 1200px;
	margin: auto;
	display: grid;
	align-items: stretch;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	grid-template-rows: 1fr 1fr;
	gap: 20px; /* 자식요소간의 간격 */
}

.temp-box {
	width: 100%;
	height: 100%;
	font-size: 30px;
	font-weight: bold;
	border: 1px solid #dee3eb;
	text-align: center;
}

.temp-box:nth-child(1) {
	/* background: yellow; */
	grid-column: 1/3;
	grid-row: 1/2;
}

.temp-box:nth-child(2) {
	/* background: yellow; */
	grid-column: 3/4;
	grid-row: 1/2;
}

.temp-box:nth-child(3) {
	/* background: yellow; */
	grid-column: 4/5;
	grid-row: 1/2;
}

.temp-box:nth-child(4) {
	/* background: yellow; */
	grid-column: 1/3;
	grid-row: 2/3;
}

.temp-box:nth-child(5) {
	/* background: yellow; */
	grid-column: 3/5;
	grid-row: 2/3;
}

table.type02 {
	border-collapse: collapse;
	text-align: center;
	font-size: 20px;
	line-height: 1.5;
	margin: 20px 10px;
}

table.type02 tr {
	width: 300px;
	height: 40px;
	font-size: 25px;
	padding: 10px;
	margin: auto;
	vertical-align: top;
}

table.type02 td {
	width: 500px;
	padding: 10px;
	font-weight: normal;
	vertical-align: top;
}

table.type01 {
	border-collapse: collapse;
	text-align: left;
	font-size: 20px;
	line-height: 1.5;
	border: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-right: 1px solid #ccc;
	margin: 20px 10px;
}

table.type01 th {
	width: 200px;
	padding: 10px;
	vertical-align: top;
	border-right: 1px solid #ccc;
}

table.type01 td {
	width: 700px;
	height: 30px;
	padding: 10px;
	font-weight: normal;
	border-right: 1px solid #ccc;
	vertical-align: top;
}

table.type01 .even {
	background: #efefef;
}

tbody {
	padding: 50px;
}

header, section {
	text-aligen: center;
}
</style>

<script>
	function gotoProduct() {
		location.href = "ProductList";
	}
	function fn_res_form() {
		location.href = "/StudyCafeManagement/seat/register?user_id=${sessionScope.user_id}";
	}
	var noticeCookie = getCookie("name");
	if(noticeCookie != "value"){
	    window.open("popUp", "mainPopUp", "width=500, height=650, status=no, scrollbars= 0, toolbar=0, menubar=no");
	}
	function getCookie(name) {
		var found = false
		var start, end
		var i = 0
		
		while(i <= document.cookie.length) {
			start = i
			end = start + name.length
			
			if(document.cookie.substring(start, end) == name) {
				found = true
				break
			}
			i++
		}
		
		if(found==true) {
			start = end + 1
			end = document.cookie.indexOf(";", start)
			if(end < start)
				end = document.cookie.length
				return document.cookie.substring(start, end)
		}
		return ""
	}
</script>

</head>
<body>


	<header> 
		<div class="nav_container">
			 <a href = "/StudyCafeManagement/common/LoginMain">
         		<h7 style ="color:white; margin:3px; font-size:40px; font-weight:bold;">베이직 스터디 카페</h7>
        	 </a>
			<div class="cafe_menus">
				<img src="/StudyCafeManagement/resources/images/logo.jpg" class="logo_image" width="40" height="40">
				  <a href="/StudyCafeManagement/seat/register?user_id=${sessionScope.user_id}" class="Seat">좌석</a> 
					<a href="/StudyCafeManagement/product/ProductList" class="Product">상품</a> 
					<a href="/StudyCafeManagement/board/BoardList" class="Community">커뮤니티</a>
					<a href="/StudyCafeManagement/notice/NoticeList?user_id=${sessionScope.user_id}" class="Notice">공지사항</a>
					<a href="/" class="Message">메시지</a>
			</div>

		</div>
	</header>
	<section>
		<div class="section-container">
			<div class="temp-box">
				커뮤니티
				<hr>


				<%-- 	<%
			if (count == 0) {
		%> --%>


		<table class="type01">
				<tr>
			    	<th scope="row">글번호</th>
			    	<th scope="row">제목</th>
					<th scope="row">글쓴이</th>
					<th scope="row">작성일</th>
					<th scope="row">조회수</th>
				</tr>
			<c:forEach var="board" items="${boardList }">
				<tr>
		  			<td class="even">${board.board_number }</td>
					<td class="even"><a href="/StudyCafeManagement/board/BoardDetail?board_number=${board.board_number }&user_id=${sessionScope.user_id}
					&writer=${board.user_id }">${board.board_title}</a></td>
					<td class="even">${board.user_id}</td>
					<td class="even">${board.board_time}</td>
					<td class="even">${board.board_readcount}</td>
			    </tr>
		  	</c:forEach>
  		</table>



			</div>

			<div class="temp-box">
				좌석
				<hr>
				<img src="/StudyCafeManagement/resources/images/seat.JPG" class="Seat_image" width=230px height=230px
					style="margin: 50px;"> <input type="button" value="예약"
					onclick="fn_res_form()"
					style="float: center; margin: 50px; font-size: 50px;">

			</div>

			<div class="temp-box">
				로그인
				<hr>
				<section id="loginFormArea">
					<c:choose>
						<c:when test="${sessionScope.user_id == null}">
						<form action="login" method = "POST">
							<fieldset>
								<label for = "id"></label>
								<input type="text" id="id" name="id" class="idInput" placeholder="아이디" maxlength="41" value=""><br>
								<label for = "passwd"></label>
								<input type = "password" id = "password" name = "password" class="passwdInput" placeholder="비밀번호" maxlength="41" value=""/><br>
								<input type = submit class="LoginButton" value = "로그인"/><br>
									<a href="findIdForm">아이디 찾기</a>
									<span class="bar" aria-hidden="true">|</span>
									<a href="findPasswordForm">비밀번호 찾기</a>
									<br>
									<span class="bar" aria-hidden="true"></span>
									<a href="JoinForm">회원가입</a>
								</fieldset>
							</form>
						</c:when>
						<c:otherwise>
							<br>${sessionScope.user_name}님이 로그인중입니다.<br>
							<h2>${sessionScope.user_name}(${sessionScope.user_id})님
								환영합니다.</h2>
							<a href="${path}/StudyCafeManagement/common/logout">로그아웃</a>
							<br>
						</c:otherwise>
					</c:choose>
				</section>
			</div>

			<div class="temp-box">
				공지사항
				<hr>


				<%-- 	<%
			if (count == 0) {
		%> --%>


				<table class="type01">
				<tr>
			    	<th scope="row">글번호</th>
			    	<th scope="row">제목</th>
					<th scope="row">글쓴이</th>
					<th scope="row">작성일</th>
					<th scope="row">조회수</th>
				</tr>
			<c:forEach var="notice" items="${noticeList }">
				<tr>
		  			<td class="even">${notice.notice_number }</td>
					<td class="even"><a href="/StudyCafeManagement/notice/NoticeDetail?notice_number=${notice.notice_number }&user_id=${sessionScope.user_id}">${notice.notice_title}</a></td>
					<td class="even">${notice.user_id}</td>
					<td class="even">${notice.notice_time}</td>
					<td class="even">${notice.notice_readcount}</td>
			    </tr>
		  	</c:forEach>
  		</table>

			</div>

			<div class="temp-box">
				상품 - BEST
				<hr>

				<table class="type02">
					<tr
						style="border-bottom: 1px solid #ccc; border-top: 1px solid #ccc; border-color: black;">
						<div>
							<td><img src="" class="logo_image" width="150" height="200">
							</td>
							<td><img src="" class="logo_image" width="150" height="200">
							</td>
							<td><img src="" class="logo_image" width="150" height="200">
							</td>
							<td><img src="" class="logo_image" width="150" height="200">
							</td>
						</div>
					</tr>
					<tr>
						<td style="font-weight: bold;">BEST1</td>
						<td style="font-weight: bold;">BEST2</td>
						<td style="font-weight: bold;">BEST3</td>
						<td style="font-weight: bold;">BEST4</td>
					</tr>
					<tr>
						<td>이름1</td>
						<td>이름2</td>
						<td>이름3</td>
						<td>이름4</td>
					</tr>
					<tr>
						<td>가격1</td>
						<td>가격2</td>
						<td>가격3</td>
						<td>가격4</td>
					</tr>
				</table>


			</div>

		</div>
	</section>

	<%--   <section>
    

     <table border = "1">
      <tr>
         <th>번호</th>
         <th>제목</th>
         <th>등록자</th>
         <th>작성일</th>
      </tr>
      <c:forEach var = "board" items = "${boardList }">
         <tr>
         <td>${board.seq }</td>
         <td><a href = "board_detail.do?seq=${board.seq }">${board.title}</a></td>
         <td>${board.writer}</td>
         <td>${board.regdate}</td>
         </tr>
      </c:forEach>
   </table>
   
   <table>
 <div class="top_btns">
 
        <button class="board_management_btn top_btn">
            카테고리/게시판 관리
        </button>
        <button class="report_management_btn top_btn">
            신고 리스트 관리
        </button>
        <button class="user_management_btn top_btn">
            회원 관리
        </button>
    </div>
    </table>
</section> --%>
</body>
</html>