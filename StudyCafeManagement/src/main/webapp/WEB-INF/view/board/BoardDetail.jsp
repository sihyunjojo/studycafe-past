<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
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
<script>
	function fn_board_update(){
		location.href = "BoardUpdate?board_number=${board.board_number}";
	}	
	function fn_board_delete(){
		location.href = "BoardDelete?board_number=${board.board_number}";
	}
	
</script>
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
			<div class="form-group">
				<label for="board_number" class="col-sm-2 control-label">번호</label>
				<input type="text" id="board_number" class="form-control" 
				value="${board.board_number }" readonly />
			</div>
			<div class="form-group">
				<label for="board_title" class="col-sm-2 control-label">제목</label>
				<input type="text" id="board_title" class="form-control" 
				value="${board.board_title }" readonly />
			</div>
			<div class="form-group">
				<label for="user_id" class="col-sm-2 control-label">등록자</label>
				<input type="text" id="user_id" class="form-control" 
				value="${board.user_id }" readonly />
			</div>
			<div class="form-group">
				<label for="board_time" class="col-sm-2 control-label">작성일</label>
				<fmt:parseDate value="${board.board_time }" var="today" pattern="yyyy-MM-dd">
				</fmt:parseDate>
				<fmt:formatDate value="${today }" pattern="yyyy-MM-dd" />
			</div>
			
			<div>
				<button type="button" class="update_btn btn btn-warning" 
				onclick="fn_board_update();">글수정</button>
				<button type="button" class="delete_btn btn btn-danger"
				onclick="fn_board_delete();">글삭제</button>
			</div>
				
		</section>
	</div>
</body>
</html>