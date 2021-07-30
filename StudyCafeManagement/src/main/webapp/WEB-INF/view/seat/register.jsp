<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function showBtn(id){
		var num = document.getElementById("seatNum");
		num.value = id;
	}

</script>
<style>
button {
	width: 50px;
	height: 50px;
	color: white;
}

#btnDiv {
	text-align: center;
}

.redBackground {
	background-color: red;
}

.greenBackground {
	background-color: green;
}
</style>
</head>
<body>
		<header>
		
			<%@include file="../nav.jsp" %>
			
		</header>
	<h1>좌석 예약</h1>

	<div id="btnDiv">

		<c:forEach var="seat" items="${seatList }" varStatus="status">
			<button id="${status.count }" onclick="showBtn(id);"
				class=" <c:choose> 
			<c:when test='${seat.seat_res == "T"}'>redBackground</c:when>
			<c:otherwise>greenBackground</c:otherwise>
			</c:choose>	">
				${status.count }</button>

			<c:if test="${status.count % 2 ==0}">
				&emsp;
			</c:if>
			<c:if test="${status.count % 20 ==0}">
				<br>
			</c:if>
			<c:if test="${status.count % 40 ==0}">
				<br>
				<br>
			</c:if>


		</c:forEach>

	</div>

	<br>
	<br>
	<br>

	<form method="post" name="seatForm">
		<label>좌석 번호 : </label><input type="text" name="seatNum" id="seatNum">
		<input type="hidden" name="user_id" value="${sessionScope.user_id}" />
		
		<br> <input type="submit" value="예약"
			onclick="javascript: seatForm.action='reserve';" /> <input
			type="submit" value="반환"
			onclick="javascript: seatForm.action='return';" />

	</form>



	<a href="/StudyCafeManagement/common/LoginMain">뒤로가기</a>

</body>
</html>