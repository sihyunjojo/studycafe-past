<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>Insert title here</title>
<style>
	li {list-style: none; display: inline; padding: 6px;}
	header{
         background-color:blueviolet;
         height:150px;
         padding:5px;
         margin:5px;
         text-align: center;
   			}
	header a{
      font-size :30px;
      font-weight: bold;
      color:white;
      padding:25px;
      margin:auto;
      text-decoration:none;
		   }
</style>
</head>
<body>
	<div class="container">
		<header>
			<div class="nav_container">
				<a href = "/StudyCafeManagement/common/LoginMain">
         			<h7 style ="color:white; margin:3px; font-size:40px; font-weight:bold;">베이직 스터디 카페</h7>
        	 	</a>
				<div class="cafe_menus">
					<img src="/StudyCafeManagement/resources/images/logo.jpg" class="logo_image" width="40" height="40">
					<a href="/StudyCafeManagement/seat/register" class="Seat">좌석</a> 
					<a href="/StudyCafeManagement/product/ProductList" class="Product">상품</a> 
					<a href="/StudyCafeManagement/board/BoardList" class="Community">커뮤니티</a>
					<a href="/StudyCafeManagement/notice/NoticeList?user_id=${sessionScope.user_id}" class="Notice">공지사항</a>
					<a href="/StudyCafeManagement/message/Chat?user_id=${sessionScope.user_id}" class="Message">메시지</a>
					<h3 style = "display:inline">id = ${sessionScope.user_id}</h3>
					
				</div>

			</div>		
		
		</header>
		<h1> 게시판</h1>
		<hr />

		<div>
			<ul>
				<li><a href="BoardList">글목록보기</a></li>
				<li><a href="/StudyCafeManagement/common/LoginMain">메인화면</a></li>
			</ul>
		</div>
		
		<section id="container">
			<form action="BoardUpdate" method = "POST">
			`	<input type = "hidden" name = "board_number" value = "${board.board_number }">
				<div class="form-group">
					<label for="board_title" class="col-sm-2 control-label">제목</label>
					<input type = "text" name = "board_title" class="form-control"
					value = "${board.board_title }" required/>		
				</div>
				<div class="form-group">
					<label for="board_title" class="col-sm-2 control-label">내용</label>
					<textarea name = "board_content" cols = "20" rows = "10" class="form-control" 
					required>${board.board_content }</textarea>
				</div>
				<div>
					<input type = "submit" class="update_btn btn btn-warning value = "글수정">			
				</div>			
			</form>
		</section>
	</div>
</body>
</html>