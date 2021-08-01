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

		<h1> 공지사항</h1>
		<hr />

		<div>
		
			<%@include file="../notice_nav.jsp" %>
		
		</div>

		
		<section id="container">
			<form action="NoticeUpdate?user_id=${sessionScope.user_id}&page=${cri.page }&perPageNum=${cri.perPageNum }" method = "POST">
			`	<input type = "hidden" name = "notice_number" value = "${notice.notice_number }">
				<div class="form-group">
					<label for="notice_title" class="col-sm-2 control-label">제목</label>
					<input type = "text" name = "notice_title" class="form-control"
					value = "${notice.notice_title }" required/>		
				</div>
				<div class="form-group">
					<label for="notice_title" class="col-sm-2 control-label">내용</label>
					<textarea name = "notice_content" cols = "20" rows = "10" class="form-control" 
					required>${notice.notice_content }</textarea>
				</div>
				<div>
					<input type = "submit" class="update_btn btn btn-warning" value = "글수정">			
				</div>			
			</form>
		</section>
	</div>
</body>
</html>