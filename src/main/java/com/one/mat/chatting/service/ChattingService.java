package com.one.mat.chatting.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.chatting.dao.ChattingDAO;
import com.one.mat.chatting.dto.ChattingDTO;
import com.one.mat.member.dto.ProfileDTO;

@Service
public class ChattingService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ChattingDAO dao;
	
	private String root = "C:/upload/";
	
	ArrayList<ProfileDTO> proIdx = new ArrayList<ProfileDTO>();
	ChattingDTO chatDTO = new ChattingDTO();
	ChattingDTO chatProInfo = new ChattingDTO();
	ChattingDTO chatPhotoInfo = new ChattingDTO();
	ChattingDTO chatMsgInfo = new ChattingDTO();
	
	public HashMap<String, Object> chattingListDo(String pagePerNum, String page, int memberIdx) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ChattingDTO> chatIdx = new ArrayList<ChattingDTO>();
		ArrayList<ChattingDTO> chatProIdx = new ArrayList<ChattingDTO>();
		ArrayList<ChattingDTO> chatList = new ArrayList<ChattingDTO>();
		
		
		
		// memberIdx 에서 pro_idx 가지고 오기
		proIdx = dao.proIdx(memberIdx);
		
		// pro_idx 1과 2 를 넣어서 chat_idx, pro_you, pro_me, pro_idx 담긴 ArrayList chatIdx 에 넣기
		Iterator<ProfileDTO> it = proIdx.iterator();
		while(it.hasNext()) {
			chatIdx = dao.chatIdx(it.next().getPro_idx()); 
			Iterator<ChattingDTO> its = chatIdx.iterator(); // chatIdx 읽기
			while(its.hasNext()) {
				chatProIdx.add(its.next()); // 프로필 1과 2 합친거 chatProIdx 에 넣기.
			}
		}
		
		 // 가지고 온 chat_idx 와 pro_idx 를 이용해서 채팅방리스트에 필요한 데이터 불러오기
		// 검색 기능은 getPro_dogName이 "" 일 때만 chatInfoDTO 에 담아줘서 리스트를 뿌리기!!!
		Iterator<ChattingDTO> chatProIt = chatProIdx.iterator();
		while(chatProIt.hasNext()) {
			chatDTO = chatProIt.next(); // 요소 하나 하나 가져오기
			// logger.info("Chat_idx: " +chatDTO.getChat_idx()+", pro_idx"+chatDTO.getPro_idx());
			chatProInfo = dao.chatProInfo(chatDTO.getPro_idx());
			chatPhotoInfo = dao.chatPhotoInfo(chatDTO.getPro_idx());
			chatMsgInfo = dao.chatMsgInfo(chatDTO.getChat_idx());
			String myDogName = dao.myDogName(chatDTO.getPro_me());
			
//			logger.info("dto"+chatMsgInfo); -- 가져오는 것 자체가 null 이 떴던 것.. 데이터가 null 인줄
//			logger.info("dto"+chatMsgInfo.getMsgTime());
	
			ChattingDTO chatInfoDTO = new ChattingDTO(); // 하나의 DTO 에 담기
			
			chatInfoDTO.setMyDogName(myDogName);
			chatInfoDTO.setPro_me(chatDTO.getPro_me());
			chatInfoDTO.setPro_you(chatDTO.getPro_you());
			chatInfoDTO.setChat_idx(chatDTO.getChat_idx());
			chatInfoDTO.setPhoto_fileName(chatPhotoInfo.getPhoto_fileName());
			chatInfoDTO.setBreedType(chatProInfo.getBreedType());
			chatInfoDTO.setPro_dogName(chatProInfo.getPro_dogName());
			if (chatMsgInfo == null) { // 만약 chatMsgInfo 가 값이 없어서 null 이면 공백 문자 들어오게 처리
				chatInfoDTO.setMsgTime(" ");
				chatInfoDTO.setChatMsg_msg(" ");
				chatInfoDTO.setChatMsg_read(" ");
			}else {
				chatInfoDTO.setMsgTime(chatMsgInfo.getMsgTime());
				chatInfoDTO.setChatMsg_msg(chatMsgInfo.getChatMsg_msg());
				chatInfoDTO.setChatMsg_read(chatMsgInfo.getChatMsg_read());
			}
			chatList.add(chatInfoDTO);
		}
		
//		logger.info("chatList size : " + chatList.size());
//		logger.info("chatProIdx size : " + chatProIdx.size());
//		
//		logger 찍으려고...
//		Iterator<ChattingDTO> itss = chatList.iterator();
//		while(itss.hasNext()) {
//			ChattingDTO dos = itss.next();
//			logger.info(
//					dos.getPhoto_fileName()+"/"+
//					dos.getBreedType()+"/"+
//					dos.getPro_dogName()+"/"+
//					dos.getMsgTime()+"/"+
//					dos.getChatMsg_msg()+"/"+
//					dos.getChatMsg_read()
//					);
//		}
				
		int ppn = Integer.parseInt(pagePerNum); // 페이지당 보여줄 게시글 수 5 개씩
		int p = Integer.parseInt(page); // 현재 보여줄 페이지 1
		
		logger.info("보여줄 페이지 : "+page+"/"+"pagePerNum : " + pagePerNum);
		logger.info("chatList.size(): "+chatList.size() + "/ chatList.size()/ppn :"+Math.ceil((double)chatList.size()/ppn));
		
		int offset = (p-1)*ppn; // 0 번부터 4번 , 5~ 9번 , 10~ 14번
		int pages =(int) Math.ceil((double)chatList.size()/ppn);
		int endIndex = Math.min(offset + ppn, chatProIdx.size());
		// 페이징에 가지고 올 리스트 개수
		List<ChattingDTO> list = new ArrayList<ChattingDTO>(); 
		if (offset < endIndex) {
           list = chatList.subList(offset, endIndex); // 0 번부터 5번 이전까지 / 5 번부터 10번 이전까지 ...
           logger.info("list size : " +list.size());
        }else {}
		
		logger.info("pages : " +pages);
		
		map.put("currPage", p);
		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", list);
		
		
		
		return map;
	}
	
	
	
	
	// 로그인 제제때문에 정보 가져오기
	public boolean chattingRoomGo(String chat_idx, int memberIdx) {
		
		int chat_id = Integer.parseInt(chat_idx);
		boolean result = false;
		ChattingDTO chatDTO = dao.chattingRoomGo(chat_id);
		
		logger.info("chat_DTO : " + chatDTO);
		
		if(chatDTO == null) {
			result = false; // false 면 접근 불가능 
		}else {
			Iterator<ProfileDTO> it = proIdx.iterator();
			while(it.hasNext()) {
				ProfileDTO dto = it.next();
				logger.info("ProfileDTO : " + dto);
				int pro_idx = dto.getPro_idx(); // 1,2
//				logger.info("getPro_idx : " + pro_idx);
//				logger.info("getPro_recvIdx : " + chatDTO.getPro_recvIdx());
//				logger.info("getPro_sendIdx : " + chatDTO.getPro_sendIdx()); 
				// 내가 회원 1이고 받거나 보내는 프로필이 1이면 true 아니면 false 		
				if(pro_idx == chatDTO.getPro_recvIdx() || pro_idx == chatDTO.getPro_sendIdx()) {
					result = true; }
			}
		}
		return result;
	}
	
	// chat_idx 로 채팅방 대화창 가지고 오기
	public HashMap<String, Object> chatRoomListDo(int memberIdx, String chat_idx) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int chat_id = Integer.parseInt(chat_idx);
		
		// memberIdx 에서 pro_idx 가지고 오기 -- 1,2
		proIdx = dao.proIdx(memberIdx);
		ArrayList<ChattingDTO> chatMsg = dao.chatRoomListDo(chat_id); // 채팅방 메세지 담기
		// 채팅에 참여하는 나와 상대 불러오기
		ChattingDTO toFrom = new ChattingDTO();
		Iterator<ProfileDTO> it = proIdx.iterator();
		while(it.hasNext()) {
			ProfileDTO proDTO = it.next();
			int pro_idx = proDTO.getPro_idx();
			toFrom = dao.toFrom(pro_idx,chat_id);
			logger.info("toFrom : " +toFrom);
			if(toFrom != null) {
				map.put("toFrom", toFrom);
			}
		}

		logger.info("chatMsg : " +chatMsg);
		
		map.put("chatMsg", chatMsg);
		
		// toFrom 은 dto
		// chatMsg 는 ArrayList
		
		return map;
	}
	
	

	public int chatSaveDo() {
		return dao.chatSaveDo();
	}






}
