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

</head>
<body>
		<header>
		
			<%@include file="../nav.jsp" %>
			
		</header>
	<div class="container">

		<h1> 게시판</h1>
		<hr />

		<div>
			
			<%@include file="../board_nav.jsp" %>
			
		</div>
		<section id="container">
			<form action="BoardUpdate" method = "POST">
			`	<input type = "hidden" name = "board_number" value = "${board.board_number }">
				<input type = "hidden" name = "page" value = "${cri.page }">
				<input type = "hidden" name = "perPageNum" value = "${cri.perPageNum }">
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
					<input type = "submit" class="update_btn btn btn-warning" value = "글수정">			
				</div>			
			</form>
		</section>
	</div>
</body>
</html>