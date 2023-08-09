package kr.or.ddit.controller.jhs.haruter;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.service.bmk.IHarustoryService;
import kr.or.ddit.vo.bmk.BoardVO;
import kr.or.ddit.vo.bmk.ReplyVO;
import kr.or.ddit.vo.jhs.BellVO;

public class HaruterEcho extends TextWebSocketHandler{
	
	@Inject
	private IHarustoryService service;
	
	private List<WebSocketSession> custom = new ArrayList<>();
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession wsession) throws Exception {
		custom.add(wsession);
	}

	@Override
	protected void handleTextMessage(WebSocketSession wsession, TextMessage message) throws Exception {
		BellVO bellVo = BellVO.converMessage(message.getPayload());
	
		List<BoardVO> bvo = new ArrayList<BoardVO>();
		bvo = service.getMyStoryListBell(bellVo.getYou());			
		
		List<ReplyVO> rvo = new ArrayList<ReplyVO>();
		
		for(BoardVO vo : bvo) {
			List<ReplyVO> tempVO = service.boardBellCount(vo.getBoard_no());
			for(ReplyVO tempReplyVO : tempVO) {
				rvo.add(tempReplyVO);
			}
		}

		for(WebSocketSession session : custom) {
			if(bellVo.getMessage().equals("NO")) {			
				if(wsession.getId().equals(session.getId())) {			
						// 하루피드에 댓글을 단 사람
						if(rvo.size() > 0) { 
							for(ReplyVO tempVO : rvo) {	
								String status = "";
								if(tempVO.getCcg_b004().equals("자유게시판")) {
									status = "status1";
								}else if(tempVO.getCcg_b004().equals("모임게시판")) {
									status = "status3";								
								}
								session.sendMessage(new TextMessage(
										 status + ":<div id='echo-reply' class='echo-count' data-board="+tempVO.getBoard_no()+">"
												+ "				<span><span style='color: #53b12e;'>"+tempVO.getMem_nicknm()+"</span>님이 댓글을 달았습니다.</span>"
												+ "</div>"));
							}
						}else if(rvo.size() <= 0) {
							session.sendMessage(new TextMessage(
									  "status2:<div id='no-echo-reply'>"
									+ "				<span>알림이 없습니다.</span>"
									+ "		   </div>"));
						}
			}
	
			// 누가 댓글을 달았을 때 해당 게시판 사용자에게 알림이 가게 한다.
			}
//			if(bellVo.getMessage().equals("OK")) {				
//				if(!wsession.getId().equals(session.getId())) {
//					Map<String, Object> map1 = session.getAttributes();
//					String memberId = (String) map1.get("aeId");
//					
//					if(memberId.equals(bellVo.getYou())) {					
//						
//						for(ReplyVO tempVO : rvo) {	
//							String status = "";
//							if(tempVO.getCcg_b004().equals("자유게시판")) {
//								status = "status1";
//							}else if(tempVO.getCcg_b004().equals("모임게시판")) {
//								status = "status3";								
//							}
//							session.sendMessage(new TextMessage(
//									status + ":<div id='echo-reply' class='echo-count' data-board="+tempVO.getBoard_no()+">"
//											+ "				<span><span style='color: #53b12e;'>"+tempVO.getMem_nicknm()+"</span>님이 댓글을 달았습니다.</span>"
//											+ "</div>"));
//						}						
//						break;
//					}
//				}
//			}
		}
	}
		


	@Override
	public void afterConnectionClosed(WebSocketSession wsession, CloseStatus status) throws Exception {
		
	}
}
