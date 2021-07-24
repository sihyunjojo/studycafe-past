<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
</head>
<body>
	<hr>
	<form action="NoticeSearch?user_id=${sessionScope.user_id}" method="POST">
		<select name="search_option">
			<option value="notice_title">제목</option>
			<option value="notice_user_id">글쓴이</option>
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
		<c:forEach var="notice" items="${noticeList }">
			<tr>
				<td>${notice.notice_number }</td>
				<td><a href="NoticeDetail?notice_number=${notice.notice_number }&user_id=${sessionScope.user_id}">${notice.notice_title}</a></td>
				<td>${notice.user_id}</td>
				<td>${notice.notice_time}</td>
				<td>${notice.notice_readcount}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
		<br><a href="/StudyCafeManagement/common/LoginMain">메인화면</a>

</body>
</html>