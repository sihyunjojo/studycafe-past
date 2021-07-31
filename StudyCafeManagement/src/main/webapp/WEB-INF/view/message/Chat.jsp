<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='/webjars/bootstrap/3.3.7/css/bootstrap.min.css'>
<title>Insert title here</title>
<style>
/* .messageTotalFrame{
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
 */

</style>
</head>
<body>
		<header>
		
			<%@include file="../nav.jsp" %>
			
		</header>
<h1>메시지</h1><br><br>
<div class="container">
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="portlet-title">
						<h4><i class="fa fa-circle text-green">채팅방</i></h4>
						<hr>
					</div>
					<div class="clearfix"></div>
				</div>
				<div id="chat" class="panel-collapse collapse in">
					<div id="messages" class="portlet-body chat-widget" style="overflow-y : auto; width:auto; height:500px;">
				    </div>
				    <div class="portlet-footer">
				    	<div class="row">
				    		<div class="form-group col-xs-4">
				    		</div>
				    	</div>
				    	<div class="row" style="height:90px">
				    		<div class="form-group col-xs-10">
				    			<br><br>
				    			<input type="text" id="sender" value="${sessionScope.user_id}"
								style="display: none;">
				    			<textarea style="height:80px;" id="messageinput" class="form-control" 
				    			placeholder="메시지를 입력하세요." maxlength="100%">
				    			</textarea>
				    		</div>
				    		<div class="form-group col-xs-2">
				    			
				    			<button type="button" class="btn btn-default pull-right" onclick="send();">보내기
				    			</button>
				    			<div class="clearfix"></div>
				    			<br><br>
				    		</div>
				    		<div class="form-group col-xs-2">
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