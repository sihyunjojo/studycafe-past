<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	header{
         background-color:#FFA500;
         height:120px;
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
					<a href="/StudyCafeManagement/message/Chat?user_id=${sessionScope.user_id}" class="Message">메시지</a>
					<h3 style = "display:inline">id = ${sessionScope.user_id}</h3>
					
				</div>

			</div>