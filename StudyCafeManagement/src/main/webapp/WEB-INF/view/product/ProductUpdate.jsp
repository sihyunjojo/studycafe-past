<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
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
   
     aside#aside { margin-left: 60px; margin-top: 20px; float:left; width:180px; height:600px; }
   
    section#container {}
			section#content { margin: 20px; float:center; width:700px; }
			aside#aside { float:left; width:180px; }
			section#container::after { content:""; display:block; clear:both; }	
			
	section h1{
			 font-size :30px;
	}	
				
   section#container { }
   
   aside#aside h3 { font-size:30px; margin-bottom:20px; text-align:center; }
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
         <h7 style ="color:white; margin:3px; font-size:40px; font-weight:bold;">베이직 스터디 카페</h7>
        <div class="cafe_menus">
                    <img src="" class="logo_image" width="40" height="40" >
                    <a href="/" class="Seat" >좌석</a>
                    <a href="/" class="Product" >상품</a>
                    <a href="/" class="Community" >커뮤니티</a>
                    <a href="/" class="Board" >공지사항</a>
                    <a href="/" class="Message" >메시지</a>
            </div>

        </div>
    </header>
    
    
   <section id = "container">
 
 	<aside id="aside">
				<h3>카테고리</h3>
			<hr>
			<br>
				<ul>
					
					<li><a href="/shop/list?c=100&l=1">과자</a>
				
						<ul class="low">
							<li><a href="/shop/list?c=101&l=2">베스트과자</a></li>
							<li><a href="/shop/list?c=102&l=2">달콤한과자</a></li>
							<li><a href="/shop/list?c=103&l=2">그냥과자</a></li>
						</ul>
						
					</li>
					<li><a href="/shop/list?c=200&l=1">빵</a></li>
					<li><a href="/shop/list?c=300&l=1">음료</a></li>
						<ul class="low">
								<li><a href="/shop/list?c=101&l=2">탄산음료</a></li>
								<li><a href="/shop/list?c=102&l=2">주스</a></li>
								<li><a href="/shop/list?c=103&l=2">음류수</a></li>
							</ul>
					<li><a href="/shop/list?c=400&l=1">커피</a></li>
					<li><a href="/shop/list?c=400&l=1">티,스무디</a></li>
					<li><a href="/shop/list?c=400&l=1">기타</a></li>
					
				</ul>
			<br>
			<hr>
			<br>
	</aside>
	
	<section class = "content">
	<form action="ProductUpdate" method = "POST">
		<input type = "hidden" name = "prod_number" value = "${product.prod_number }">
		<table>
		
		<h3>상품 수정 </h3>
			<hr>
		<tr>
				<td>상품 이름</td>
				<td><input type="text" name="prod_name" value = "${product.prod_name}"></td>
			</tr>
			<tr>
				<td>상품 타입</td>
				<td><input type="text" name="prod_type" value = "${product.prod_type}"/></td>
			</tr>
			<tr>
				<td>상품 수량</td>
				<td><input type="text" name="prod_amount" value = "${product.prod_amount }"/></td>
			</tr>
			<tr>
				<td>상품 가격</td>
				<td><input type="text" name="prod_price" value = "${product.prod_price }"/></td>
			</tr>
			<tr>
				<td><label for = "prod_content">상품 내용 </label> </td>
					<td>
					<textarea rows="20" cols= "40" id = prod_content name = "prod_content" value = "${product.prod_content }"></textarea>
				</td>
			</tr>
			<tr>
				<td>상품 이미지 경로</td>
				<td><input type="file" name="prod_image" readonly = "readonly" /></td>
			</tr>
			
			<tr>	
			</tr>
			
		</table>
				<input type="submit" value="상품 수정"> 
	</form>
	</section>
	
	
	
</section>

<%-- <%
   if(todayImageList != null && todayImageList.size() > 0){
%> --%>
	
	
		<footer id = "content" style = "">		
			<input type="submit" value="상품 취소">		

 		</footer>
</body>
</html>