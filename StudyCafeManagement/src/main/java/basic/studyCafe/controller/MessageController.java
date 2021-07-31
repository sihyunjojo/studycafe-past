package basic.studyCafe.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@ServerEndpoint(value="/echo")
public class MessageController {
	
	private static final List<Session> sessionList = 
			new ArrayList<Session>();
	private static final Logger logger = 
			LoggerFactory.getLogger(MessageController.class);
	public void WebSocketChat() {
		System.out.println("웹소켓 객체생성");
	}
	@RequestMapping(value="message/Chat")
	public ModelAndView getChatViewPage(ModelAndView mav, 
			@RequestParam(defaultValue="null") String user_id,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(user_id.equals("null")) {
			out.println("<script>alert('경고!! 로그인이 필요합니다');history.back()</script>");
			out.flush();			
		}else {
			mav.setViewName("message/Chat");	
		}
		return mav;
	}
	
	@OnOpen
	public void onOpen(Session session) {
		logger.info("Open session id:"+session.getId());
		sessionList.add(session);
	}
	
	private void sendAllSessionToMessage(Session self, String message) {
		try {
			for(Session session : MessageController.sessionList) {
				if(!self.getId().equals(session.getId())) {
					session.getBasicRemote().sendText(message);
				}
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	@OnMessage
	public void onMessage(String message, Session session) {
		logger.info("Message From "+message.split(":")[1]+": "+message.split(":")[0]);
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("me : "+message.split(":")[1]);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		sendAllSessionToMessage(session, message);
	}
	
	@OnError
	public void onError(Throwable e, Session session) {
		
	}
	
	@OnClose
	public void onClose(Session session) {
		logger.info("Session "+session.getId()+" has ended");
		sessionList.remove(session);
	}

}
