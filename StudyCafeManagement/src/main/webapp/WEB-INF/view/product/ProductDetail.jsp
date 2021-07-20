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
	
	<section id = "content">
		<aside id = "left_main">
<%-- 			<img src = "images/<%=dogVO.getImage() %>" --%>
			class = "productViewImage"/>
		</aside>
		<section id = "right_main">
			<%-- <h1>개 이름: <%=dogVO.getKind() %></h1>
			<h1>개 가격: <%=dogVO.getPrice() %></h1>
			<h1>개 원산지: <%=dogVO.getCountry() %></h1>
			<h1>개 설명: <%=dogVO.getContent() %></h1> --%>
		</section>
	</section>
	
	<div style = "clear: both;"></div>

	</div>
		
</section>

<%-- <%
   if(todayImageList != null && todayImageList.size() > 0){
%> --%>
			
		
	</section>
	
	<footer id = "content" style = "">
		<a href="" style = "float:right" >쇼핑계속하기</a>
<%-- 		<a href="dogCartAdd.dog?id=<%=dogVO.getId()%>" style = "float:right">장바구니담기</a>
 --%>	
 	</footer>
</body>
</html>