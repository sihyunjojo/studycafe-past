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
 	   
    
   <section id="container">
		<div id="container_box">
		
		 	
<aside id="aside">
				<h3>장바구니</h3>
				<hr>
				
</aside>	   

		<section id = "content">
   <%-- <%
      if(cartList == null || cartList.size() == 0) { 
   %> --%>
   <c:if test="${empty cartList }">
      <h1>등록된 장바구니 항목이 없습니다.</h1>
   </c:if>
   <%-- <%
      }
      else{   
   %> --%>
      <c:if test="${not empty cartList }">
      <h1>장바구니목록</h1>
      <form action="dogCartRemove.dog" method = "POST" name = "myForm">
      <table>
      <tr class = "tr_title">
          <td>
            <input type="checkbox" name = "allDelete" id = "allDelete"
            onclick = "checkAll()"/>
         </td>
         <td>번호</td>
         <td>상품이미지</td>
         <td>상품명</td>
         <td>가격</td>
         <td>수량</td>
      </tr>
      <c:set var = "num" value = "${0 }"></c:set>
         <%-- <%
            int num = 1;
            for(int i = 0;i < cartList.size();i++) {
         %> --%>
         <c:forEach var = "cart" items = "${cartList }">
         <c:set var = "num" value = "${num + 1 }"></c:set>
         
      <tr>
      <td>
            <input type="checkbox" name = "delete1" 
            value = "${cart.kind }"/>
         </td>
          <td>${num}</td>
         <td><img src = "images/${cart.image }"
         class = "cartImage"/></td>
         <td>${cart.kind }</td>
         <td>${cart.price }</td>
         <td>
         <a href = "javascript:upQty('dogCartQtyUp.dog?kind=${cart.kind }')"><img src = "images/up.jpg" class = "upDownImage"/></a><br>
         ${cart.qty }개<br>
         <a href = "javascript:checkQty('${cart.kind }', ${cart.qty })"><img src = "images/down.jpg" class = "upDownImage"/></a><br>
         </td>         
         
         
      </tr>
      
      </tr>
      </c:forEach>
         <%-- <%
      }
       %> --%>
       <tr>
          <td colspan = "6" style = "text-align: right ;font-size: x-Large;">
          ${totalMoney}원
          </td>
       </tr>
       <tr>
          <td colspan = "6" style = "text-align: right ;font-size: x-Large;">
             <input type = "submit" value = "삭제"/>
          </td>
       </tr>
      </table>
      </form>
      </c:if>
      <%-- <%
      }
      %> --%>
</section>


<%-- <%
   if(todayImageList != null && todayImageList.size() > 0){
%> --%>
			
		</div>
	</section>

    
     
<footer id = "content" style = "">
		<a href="" style = "float:right" >쇼핑 계속하기</a>
<%-- 		<a href="dogCartAdd.dog?id=<%=dogVO.getId()%>" style = "float:right">장바구니담기</a>
 --%>	
 	</footer>

</body>
</html>