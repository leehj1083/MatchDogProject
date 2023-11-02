package com.one.mat.chatting.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Optional;

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
	
	ArrayList<ProfileDTO> proIdx = new ArrayList<ProfileDTO>();
	ArrayList<ChattingDTO> chatIdx = new ArrayList<ChattingDTO>();
	ArrayList<ChattingDTO> chatProIdx = new ArrayList<ChattingDTO>();
	ArrayList<ChattingDTO> chatList = new ArrayList<ChattingDTO>();
	ChattingDTO chatDTO = new ChattingDTO();
	ChattingDTO chatProInfo = new ChattingDTO();
	ChattingDTO chatPhotoInfo = new ChattingDTO();
	ChattingDTO chatMsgInfo = new ChattingDTO();
	

	public HashMap<String, Object> chattingListDo(String page, String pagePerNum, int memberIdx) {
		
		int ppn = Integer.parseInt(pagePerNum); // 페이지당 보여줄 게시글 수 5 개씩
		int p = Integer.parseInt(page); // 현재 보여줄 페이지 1		
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자
		// offset : limit n 개부터 offset m 번부터 n 개 가져와라 할 때 사용. 1:0 -> 2:5 -> 3:10 -> 4:15 -> 5:20
		int offset = (p-1)*ppn;
		
		
		// memberIdx 에서 pro_idx 가지고 오기
		proIdx = dao.proIdx(memberIdx);
		ArrayList<ChattingDTO> chatList = new ArrayList<ChattingDTO>();
		
		// pro_idx 를 이용해서 chat_idx 와 pro_idx 를 한꺼번에 가지고 오기.
		Iterator<ProfileDTO> it = proIdx.iterator();
		while(it.hasNext()) {
			chatIdx = dao.chatIdx(it.next().getPro_idx());
			Iterator<ChattingDTO> its = chatIdx.iterator();
			while(its.hasNext()) {
				chatProIdx.add(its.next());
			}
		}
		
		int pages = (int) Math.ceil(chatProIdx.size()/ppn);
		
		logger.info(pages+"");
		
		 // 가지고 온 chat_idx 와 pro_idx 를 이용해서 채팅방리스트에 필요한 데이터 불러오기
		Iterator<ChattingDTO> chatProIt = chatProIdx.iterator();
		while(chatProIt.hasNext()) {
			chatDTO = chatProIt.next(); // 요소 하나 하나 가져오기
//			logger.info("Chat_idx: " +chatDTO.getChat_idx()+", pro_idx"+chatDTO.getPro_idx());
			chatProInfo = dao.chatProInfo(chatDTO.getPro_idx());
			chatPhotoInfo = dao.chatPhotoInfo(chatDTO.getPro_idx());
			chatMsgInfo = dao.chatMsgInfo(chatDTO.getChat_idx());
			
//			logger.info("dto"+chatMsgInfo); -- 가져오는 것 자체가 null 이 떴던 것.. 데이터가 null 인줄
//			logger.info("dto"+chatMsgInfo.getMsgTime());
//			logger.info(
//				chatPhotoInfo.getPhoto_fileName()+","+
//				chatProInfo.getBreedType()+","+
//				chatProInfo.getPro_dogName()
//			);
			
			chatDTO = new ChattingDTO();
			
			chatDTO.setPhoto_fileName(chatPhotoInfo.getPhoto_fileName());
			chatDTO.setBreedType(chatProInfo.getBreedType());
			chatDTO.setPro_dogName(chatProInfo.getPro_dogName());
			if (chatMsgInfo != null) {
				chatDTO.setMsgTime("");
				chatDTO.setChatMsg_msg("");
				chatDTO.setChatMsg_read("");
			}else {
				chatDTO.setMsgTime(chatMsgInfo.getMsgTime());
				chatDTO.setChatMsg_msg(chatMsgInfo.getChatMsg_msg());
				chatDTO.setChatMsg_read(chatMsgInfo.getChatMsg_read());
			}
			chatList.add(chatDTO);
		}
		
		logger.info("chatList : " + chatList);
		logger.info("chatList : " + chatList.size());
		logger.info("chatList : " + chatList.size());
		
		Iterator<ChattingDTO> finall = chatProIdx.iterator();
		while(finall.hasNext()) {
			ChattingDTO c = finall.next(); // 요소 하나 하나 가져오기
			logger.info(
					c.getPhoto_fileName()+","+
					c.getBreedType()+","+
					c.getPro_dogName()
					);

				
			
		}
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("currPage", p);
		//map.put("pages", pages); // 만들 수 있는 총 페이지 수
		//map.put("list", list);		
		return map;
	}
		
		public void chattingLoomGo(int memberIdx) {
			// TODO Auto-generated method stub		
		}
		
	public ArrayList<ChattingDTO> chatRoomListDo() {
		return dao.chatRoomListDo();
	}

	public int chatSaveDo() {
		return dao.chatSaveDo();
	}


}
