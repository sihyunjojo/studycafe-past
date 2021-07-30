<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.messageTotalFrame{
text-align: center;
}
input{
width: 100px;
height: 50px;
}
button{
width: 100px;
height: 100px;

}
header{
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

</style>
</head>
<body>
		<header>
		
			<%@include file="../nav.jsp" %>
			
		</header>
<h1>메시지</h1><br><br>
<div class="messageTotalFrame">
		<button type="button" onclick="openSocket();">입장</button><br><br>
		
		<input type="text" id="sender" value="${sessionScope.user_id}"
		style="display: none;">
		<input type="text" id="messageinput">
		<button type="button" onclick="send();">보내기</button><br><br>
		
		<button type="button" onclick="closeSocket();">나가기</button>
	<!-- Server responses get written here -->
	<div id="messages"></div>
</div>

	<script type="text/javascript">
	var ws;
	var messages=document.getElementById("messages");
	
	function openSocket(){
		if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
				writeResponse("${sessionScope.user_id}" + "님이 이미 채팅방에 입장하셨습니다.");
				return;
		}else{
			writeResponse("${sessionScope.user_id}" + "님이 채팅방을 입장하였습니다.");	
		}
		//웹소켓 객체 만드는 코드
		ws=new WebSocket("ws://localhost:8088/StudyCafeManagement/echo");
		
		ws.onopen=function(event){
			if(event.data === undefined) return;
		};
		ws.onmessage=function(event){
			writeResponse(event.data);
		};
		ws.onclose=function(event){
			writeResponse("${sessionScope.user_id}" + "님이 채팅방을 퇴장하셨습니다.");
		}
	}
	
	function send(){
		var text=document.getElementById("sender").value+" : "+
		document.getElementById("messageinput").value;
		ws.send(text);
		text="";
	}
	function closeSocket(){
		ws.close();
		setTimeout(openSocket, 5000);
	}
	
	function writeResponse(text){
		messages.innerHTML += "<br/>" + text;
	}
	</script>
</body>
</html>