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
		<header>
		
			<%@include file="../nav.jsp" %>
			
		</header>
	<div class="container">
		<h1> 커뮤니티</h1>
		<hr />
		

		<div>
			
			<%@include file="../board_nav.jsp" %>
			
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
				<label for="board_content" class="col-sm-2 control-label">내용</label>
				<textarea id="board_content" cols = "20" rows = "10" class="form-control" 
				 readonly>${board.board_content }</textarea>
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
				
		</section>
	</div>
</body>
</html>