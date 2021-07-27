<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>장바구니 상품 리스트</title>

<script type="text/javascript">
	function fn_insert_form(){
		location.href = "BoardInsert";
	}
</script>
<style>
body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
		a { color:#05f; text-decoration:none; }
		
		h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
		ul, lo, li { margin:0; padding:0; list-style:none; }
		
 header {
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
   
     aside#aside { margin-left: 60px; margin-right: 200px; float:left; width:200px; height:650px; }
   
    section#container {}
			section#content { margin: 50px; float:center; width:1700px; height:650px; }
			aside#aside { float:left; width:180px; }
			section#container::after { content:""; display:block; clear:both; }	
			
	section h1{
			 font-size :30px;
	}	
			
	h3 { font-size:30px; margin-bottom:20px; text-align:center; }	
	
   section#container { }
   
   aside#aside h3 { font-size:30px; margin-bottom:20px;  text-align:center;  }
		aside#aside li { font-size:16px; text-align:center; }
		aside#aside li a { color:#000; display:block; padding:10px 0; }
		aside#aside li a:hover { text-decoration:none; background:#eee; }
		
		aside#aside li { position:relative; }
		aside#aside li:hover { background:#eee; } 		
		aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
		aside#aside li:hover > ul.low { display:block; }
		aside#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
		aside#aside li:hover > ul.low li a:hover { background:#fff;}
		aside#aside li > ul.low li { width:180px; }
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
					<a href="/" class="Message">메시지</a>
			</div>

		</div>
	</header>
     
    
   <section id="container">
		<div id="container_box">
		
		<aside id="aside">
				<h3>장바구니</h3>
				<hr>
			</aside>
			
			<section id = "content">

		   <c:if test="${empty cartProductList }">
		      <h1>등록된 장바구니 상품 정보가 없습니다.< /h1>
		   </c:if>
	  <c:if test="${not empty cartProductList }">  
	  
      <h3>장바구니 상품 목록</h3>
      <hr>
      
          <td><input type="hidden" name="user_id"
			value="${sessionScope.user_id}" /></td>
			
			
      <td><input type="hidden" name="user_id"
			value="${sessionScope.user_id}" /></td>
      <table>
		<td>
		<c:forEach var = "cartProduct" items = "${cartProductList}" varStatus="status">
	         <!-- varStatus : forEach 블록에서 반복 상태를 저장하는 속성 -->
				
				<td>
				<tr>
<%-- 	            <a href="ProductDetail?prod_number=${product.prod_number}">
	            <img src = "images/${product.prod_image }" class = "productImage"/></a> --%>
	            </tr>
				<br><tr>상품 번호: ${cartProduct.prod_number }</tr>
				<br><tr><a href="ProductDetail?prod_number=${cartProduct.prod_number}">
				상품명 : ${cartProduct.prod_name }</a></tr>
				<br><tr>가격 : ${cartProduct.prod_price }원 </tr>
				<br>
				
				</td>
				 <c:if test="${(status.index + 1) % 5 == 0}">
			     </c:if>
		</c:forEach>
		</td>		
		</c:if>  
	</section>			
			
	</div>
</section>
    
</body>
</html>