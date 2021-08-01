<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='/webjars/bootstrap/3.3.7/css/bootstrap.min.css'>
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
.container {

}
.form-group{
	text-align: center;
	margin: 0 auto;
	font-family: 'Do Hyeon', sans-serif;
	font-size : 20px;
}
body {
	background-color:#F5F6F7;
	margin: 0 auto;
}
button{
	background-color : #FFAF00; 
	width : 300px; height : 50px; border : 1px; border-radius: 0%;
	font-family: 'Do Hyeon', sans-serif;
	font-size:20px; 
}
.chat {
	overflow-y : auto; width:auto; height:500px;
	text-align: center;
	margin: 0 auto;
	font-family: 'Do Hyeon', sans-serif;
	font-size : 20px;
}
</style>
</head>
<body>
		<header>
		
			<%@include file="../nav.jsp" %>
			
		</header>
<div class="container">
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="form-group">
						<h1><i class="fa fa-circle text-green">채팅방</i></h1>
						<hr>
					</div>
					<div class="clearfix"></div>
				</div>
				<div id="chat" class="panel-collapse collapse in">
					<div id="messages" class = "chat">
				    </div>
				    <div class="portlet-footer">
				    	<div class="row" style="height:90px">
				    		<div class="form-group">
				    			<br><br>
				    			<input type="text" id="sender" value="${sessionScope.user_id}"
								style="display: none;">
				    			<textarea placeholder="메시지를 입력하세요." style="height:80px; width:600px;
				    			margin: 0 auto;	font-family: 'Do Hyeon', sans-serif; font-size : 20px;" id="messageinput">
				    			</textarea>
				    		</div>
				    		<div class="form-group">
				  
				    			<button type="button" class="btn btn-default pull-right" onclick="send();">보내기
				    			</button>
				    			<div class="clearfix"></div>
				    			<br><br>
				    		</div>
				    		<div class="form-group">
				    			<button type="button" onclick="openSocket();">입장</button>&emsp;
								<button type="button" onclick="closeSocket();">나가기</button>
				    			<div class="clearfix"></div>								
				    		</div>
				    	</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	}
	
	function writeResponse(text){
		messages.innerHTML += "<br/>" + text;
	}
	</script>
</body>
</html>