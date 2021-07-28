<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_insert_form(){
		location.href = "BoardInsert";
	}
</script>
</head>
<body>
	<hr>
	<form action="BoardSearch" method="POST">
		<select name="search_option">
			<option value="board_title">제목</option>
			<option value="board_user_id">글쓴이</option>
		</select> <input type="text" name="keyword"> <input type="submit"
			value="검색">
	</form>
	<hr>

	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회수</th>

		</tr>
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
	<br>
	<input type="button" value="글쓰기" onclick="fn_insert_form()">
		<br><a href="/StudyCafeManagement/common/LoginMain">메인화면</a>

</body>
</html>