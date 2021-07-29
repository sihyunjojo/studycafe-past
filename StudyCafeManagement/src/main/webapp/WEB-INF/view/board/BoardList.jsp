<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>Insert title here</title>
<style type="text/css">
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

	<div class="container">

		<h1> 게시판</h1>
		
		<hr />
		
		<div>
			<ul>
				<li><a href="BoardInsert">글쓰기</a></li>
				<li><a href="/StudyCafeManagement/common/LoginMain">메인화면</a></li>
			</ul>
		</div>
		<section>
			<table class="table table-hover">
				<thead>
					<tr><th>번호</th>	<th>제목</th>	<th>글쓴이</th><th>작성일</th><th>조회수</th></tr>
				</thead>
				
				<c:forEach var="board" items="${boardList }">
					<tr>
						<td>${board.board_number }</td>
						<td><a href="BoardDetail?board_number=${board.board_number }&user_id=${sessionScope.user_id}
							&writer=${board.user_id }">${board.board_title}</a></td>
						<td>${board.user_id}</td>
						<td>${board.board_time}</td>
						<td>${board.board_readcount}</td>
					</tr>
				</c:forEach>
				
			</table>
			<div class="search row">
					<form action="BoardSearch" method="POST">
						<div class="col-xs-2 col-sm-2">
							<select name="search_option" class="form-control">
								<option value="board_title">제목</option>
								<option value="board_user_id">글쓴이</option>
							</select>
						</div>
						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
							
								<input type="text" name="keyword" class="form-control"/>
								<span class="input-group-btn">
									<input type="submit" value="검색" class="btn btn-default"/>
								</span>
							</div>
						</div>
					</form>
						
			</div>
		</section>
	</div>
</body>
</html>