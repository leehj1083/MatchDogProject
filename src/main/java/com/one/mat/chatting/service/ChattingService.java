package com.one.mat.chatting.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.one.mat.chatting.dao.ChattingDAO;
import com.one.mat.chatting.dto.ChattingDTO;
import com.one.mat.member.dto.MemberDTO;
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

	public HashMap<String, Object> chattingListDo(String pagePerNum, String page, int memberIdx, int subsType) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		// list 담는 그릇들
		ArrayList<ChattingDTO> chatIdx = new ArrayList<ChattingDTO>();
		ArrayList<ChattingDTO> chatProIdx = new ArrayList<ChattingDTO>();
		ArrayList<ChattingDTO> chatList = new ArrayList<ChattingDTO>();
		
		
		// memberIdx 에서 pro_idx 가지고 오기
		proIdx = dao.proIdx(memberIdx);

		// pro_idx 1과 2 를 넣어서 chat_idx, pro_you, pro_me, pro_idx 담긴 ArrayList chatIdx 에
		// 넣기
		Iterator<ProfileDTO> it = proIdx.iterator();
		while (it.hasNext()) {
			chatIdx = dao.chatIdx(it.next().getPro_idx());
			Iterator<ChattingDTO> its = chatIdx.iterator(); // chatIdx 읽기
			while (its.hasNext()) {
				chatProIdx.add(its.next()); // 프로필 1과 2 합친거 chatProIdx 에 넣기.
			}
		}

		// chat_idx 순서 다시 정렬하기.
		Collections.sort(chatProIdx, new ChattingDTOComparator());

		// 가지고 온 chat_idx 와 pro_idx 를 이용해서 채팅방리스트에 필요한 데이터 불러오기
		// 검색 기능은 getPro_dogName이 "" 일 때만 chatInfoDTO 에 담아줘서 리스트를 뿌리기!!!
		Iterator<ChattingDTO> chatProIt = chatProIdx.iterator();
		while (chatProIt.hasNext()) {
			chatDTO = chatProIt.next(); // 요소 하나 하나 가져오기
			// logger.info("Chat_idx: " +chatDTO.getChat_idx()+", pro_idx :
			// "+chatDTO.getPro_idx());
			chatProInfo = dao.chatProInfo(chatDTO.getPro_idx());
			// 대표프로필 가져와야 해서
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
			} else {
				chatInfoDTO.setMsgTime(chatMsgInfo.getMsgTime());
				chatInfoDTO.setChatMsg_msg(chatMsgInfo.getChatMsg_msg());
				chatInfoDTO.setChatMsg_read(chatMsgInfo.getChatMsg_read());
			}
			chatList.add(chatInfoDTO);
		}

		// 페이징
		int ppn = Integer.parseInt(pagePerNum); // 페이지당 보여줄 게시글 수 5 개씩
		int p = Integer.parseInt(page); // 현재 보여줄 페이지 1

		// logger.info("보여줄 페이지 : "+page+"/"+"pagePerNum : " + pagePerNum);
		// logger.info("chatList.size(): "+chatList.size() + "/ chatList.size()/ppn
		// :"+Math.ceil((double)chatList.size()/ppn));

		int offset = (p - 1) * ppn; // 0 번부터 4번 , 5~ 9번 , 10~ 14번
		int pages = (int) Math.ceil((double) chatList.size() / ppn);
		int endIndex = Math.min(offset + ppn, chatProIdx.size());
		// 페이징에 가지고 올 리스트 개수
		List<ChattingDTO> list = new ArrayList<ChattingDTO>();
		if (offset < endIndex) {
			list = chatList.subList(offset, endIndex); // 0 번부터 5번 이전까지 / 5 번부터 10번 이전까지 ...
			// logger.info("list size : " +list.size());
		} else {
		}
		
		// 세션 권한 체크
		map.put("subsType",subsType);
		// logger.info("pages : " +pages);
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

		// logger.info("chat_DTO : " + chatDTO);

		if (chatDTO == null) {
			result = false; // false 면 접근 불가능
		} else {
			Iterator<ProfileDTO> it = proIdx.iterator();
			while (it.hasNext()) {
				ProfileDTO dto = it.next();
				// logger.info("ProfileDTO : " + dto);
				int pro_idx = dto.getPro_idx(); // 1,2
//				logger.info("getPro_idx : " + pro_idx);
//				logger.info("getPro_recvIdx : " + chatDTO.getPro_recvIdx());
//				logger.info("getPro_sendIdx : " + chatDTO.getPro_sendIdx()); 
				// 내가 회원 1이고 받거나 보내는 프로필이 1이면 true 아니면 false
				if (pro_idx == chatDTO.getPro_recvIdx() || pro_idx == chatDTO.getPro_sendIdx()) {
					result = true;
				}
			}
		}
		return result;
	}

	// chat_idx 로 채팅방 대화창 가지고 오기(채팅 텍스트 + 전송 사진)
	public HashMap<String, Object> chatRoomListDo(int memberIdx, String chat_idx, int subsType) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		int chat_id = Integer.parseInt(chat_idx);
		String dogName = "";

		proIdx = dao.proIdx(memberIdx);
		Iterator<ProfileDTO> it = proIdx.iterator();
		while (it.hasNext()) { // 1일때 2일때
			ProfileDTO proDTO = it.next();
			int pro_idx = proDTO.getPro_idx();
			ChattingDTO toFrom = dao.toFrom(pro_idx, chat_id); // 채팅방 참여하는 나와 상대
			if (toFrom != null) {
				map.put("toFrom", toFrom);
				int chat_me = toFrom.getPro_me();
				int chat_you = toFrom.getPro_you();
				// logger.info("me :"+chat_me);
				// logger.info("you :"+chat_you);
				dao.readCheck(chat_you);
				dogName = dao.getDogName(chat_you);
			}
		}
		ArrayList<ChattingDTO> totalMsg = dao.totalMsg(chat_id); // (채팅 텍스트 + 전송 사진) 가져오기
		
		map.put("subsType", subsType);
		map.put("totalMsg", totalMsg);
		map.put("dogName", dogName);
		return map;
	}

	// 파일 저장 ( 리턴값은 X)
	public HashMap<String, Object> chatPhotoDo(MultipartFile[] photo, String chat_idx, int memberIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int chat_id = Integer.parseInt(chat_idx);
		int uploadPhotoSize = photo.length;
		ArrayList<ChattingDTO> getChatMsgIdx = new ArrayList<ChattingDTO>();

		// member_idx 로 프로필 idx 가지고 오기
		proIdx = dao.proIdx(memberIdx);
		Iterator<ProfileDTO> it = proIdx.iterator();
		while (it.hasNext()) { // 1일때 2일때
			ProfileDTO proDTO = it.next();
			int pro_idx = proDTO.getPro_idx();
			ChattingDTO toFrom = dao.toFrom(pro_idx, chat_id); // 채팅방 참여하는 나와 상대
			if (toFrom != null) {
				int chat_me = toFrom.getPro_me();
				int chat_you = toFrom.getPro_you();
				for (int i = 0; i < photo.length; i++) {
					dao.savePhotoMsg(chat_id, chat_me, chat_you); // 사진이 3개면 3번 insert -> 사진과 연관된 메세지 저장
				}
				// insert 한 chatMsg_idx 2개를 select 로 가지고 와서
				getChatMsgIdx = dao.getChatMsgIdx(chat_id, uploadPhotoSize);
				savePhoto(getChatMsgIdx, photo);
			}
		}

		return map;
	}

	// 사진 테이블에 사진 정보 저장
	private int savePhoto(ArrayList<ChattingDTO> getChatMsgIdx, MultipartFile[] photo) {
		int result = 0;
		String fileName = "";

		for (int i = 0; i < photo.length; i++) {
			int chatMsg_idx = getChatMsgIdx.get(i).getChatMsg_idx();
			MultipartFile p = photo[i];
			fileName = p.getOriginalFilename();
			// logger.info(fileName);
			if (!fileName.equals("")) {
				// 파일 저장
				byte[] arr;
				try {
					arr = p.getBytes();
					Path path = Paths.get(root + fileName);
					Files.write(path, arr);
					// 파일명, chatMsg_idx 를 photo 테이블에 추가
					result = dao.savePhoto(chatMsg_idx, fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	public HashMap<String, Object> chatSaveDo(String content, String chat_idx, int memberIdx) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		int chat_id = Integer.parseInt(chat_idx);

		// member_idx 로 프로필 idx 가지고 오기
		proIdx = dao.proIdx(memberIdx);
		Iterator<ProfileDTO> it = proIdx.iterator();
		while (it.hasNext()) { // 1일때 2일때
			ProfileDTO proDTO = it.next();
			int pro_idx = proDTO.getPro_idx();
			ChattingDTO toFrom = dao.toFrom(pro_idx, chat_id); // 채팅방 참여하는 나와 상대
			if (toFrom != null) {
				int chat_me = toFrom.getPro_me();
				int chat_you = toFrom.getPro_you();
				dao.chatSaveDo(chat_id, chat_me, chat_you, content);
			}
		}
		return map;
	}

	// --------------------------------------------------후기
	// -------------------------------------------------------------------

	public HashMap<String, Object> reviewProfileDo(String pro_idx) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		int pro_id = Integer.parseInt(pro_idx);

		ChattingDTO chatProInfo = dao.chatProInfo(pro_id);
		// 대표프로필 가져와야 해서
		ChattingDTO chatPhotoInfo = dao.chatPhotoInfo(pro_id);

		ArrayList<ChattingDTO> chatList = new ArrayList<ChattingDTO>();
		ChattingDTO chatInfoDTO = new ChattingDTO(); // 하나의 DTO 에 담기

		// logger.info("값:"+chatPhotoInfo.getPhoto_fileName());
		// logger.info(chatProInfo.getBreedType());
		// logger.info(chatProInfo.getPro_dogName());

		if (chatProInfo != null && chatPhotoInfo != null) {
			// logger.info("값:"+chatPhotoInfo.getPhoto_fileName());
			// logger.info(chatProInfo.getBreedType());
			// logger.info(chatProInfo.getPro_dogName());
			chatInfoDTO.setPhoto_fileName(chatPhotoInfo.getPhoto_fileName());
			chatInfoDTO.setBreedType(chatProInfo.getBreedType());
			chatInfoDTO.setPro_dogName(chatProInfo.getPro_dogName());
		}
		// logger.info("새로운 값:" + chatInfoDTO.getBreedType());
		// logger.info(chatInfoDTO.getPhoto_fileName());
		// logger.info(chatInfoDTO.getPro_dogName());

		map.put("dto", chatInfoDTO);

		return map;
	}

	public HashMap<String, Object> reviewLikeDo(int pro_id, int chat_id, int memberIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = dao.reviewLikeDo(pro_id);

		proIdx = dao.proIdx(memberIdx); // memberIdx 에서 pro_idx 를 가지고 오기
		Iterator<ProfileDTO> it = proIdx.iterator();
		while (it.hasNext()) { // 1일때 2일때
			ProfileDTO proDTO = it.next();
			int pro_idx = proDTO.getPro_idx(); // 1일 경우, 2일 경우 값 가지고 오기
			ChattingDTO toFrom = dao.toFrom(pro_idx, chat_id); // 채팅방 번호와 1일 경우, 2일 경우 값이 있는지 체크
			if (toFrom != null) { // null 값이 아니라면
				int chat_me = toFrom.getPro_me();
				int chat_you = toFrom.getPro_you();
				logger.info("me :"+chat_me);
				logger.info("you :"+chat_you);
				int row = dao.reviewSave(chat_id, chat_me, chat_you); // 후기 기록
				map.put("result", row);
			}
		}
		return map;
	}

	public HashMap<String, Object> reviewUnLikeDo(int pro_id, int chat_id, int memberIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int result = dao.reviewUnLikeDo(pro_id);

		proIdx = dao.proIdx(memberIdx); // memberIdx 에서 pro_idx 를 가지고 오기
		Iterator<ProfileDTO> it = proIdx.iterator();
		while (it.hasNext()) { // 1일때 2일때
			ProfileDTO proDTO = it.next();
			int pro_idx = proDTO.getPro_idx(); // 1일 경우, 2일 경우 값 가지고 오기
			logger.info("숫자:"+pro_idx);
			ChattingDTO toFrom = dao.toFrom(pro_idx, chat_id); // 채팅방 번호와 1일 경우, 2일 경우 값이 있는지 체크
			if (toFrom != null) { // null 값이 아니라면
				int chat_me = toFrom.getPro_me();
				int chat_you = toFrom.getPro_you();
				logger.info("me :"+chat_me);
				logger.info("you :"+chat_you);
				int row = dao.reviewSave(chat_id, chat_me, chat_you); // 후기 기록
				map.put("result", row);
			}
		}
		return map;
	}

	public String reviewCheck(String chat_idx, int memberIdx) {
		int chat_id = Integer.parseInt(chat_idx);
		String result = "N";
		proIdx = dao.proIdx(memberIdx); // memberIdx 에서 pro_idx 를 가지고 오기
		Iterator<ProfileDTO> it = proIdx.iterator();
		while (it.hasNext()) { // 1일때 2일때
			ProfileDTO proDTO = it.next();
			int pro_idx = proDTO.getPro_idx(); // 1일 경우, 2일 경우 값 가지고 오기
			ChattingDTO toFrom = dao.toFrom(pro_idx, chat_id); // 채팅방 번호와 1일 경우, 2일 경우 값이 있는지 체크
			if (toFrom != null) { // null 값이 아니라면
				int chat_me = toFrom.getPro_me();
				int chat_you = toFrom.getPro_you();
				ChattingDTO reviewCheck = dao.reviewCheck(chat_id,chat_me);
				if(reviewCheck != null) {
					result = "Y";
				}
//				Integer you = dao.reviewCheck(chat_id,chat_me);
//				if(you != null) {
//					result="Y";
//				}
			}
		}
		return result;
		
	}

}

class ChattingDTOComparator implements Comparator<ChattingDTO> {
	@Override
	public int compare(ChattingDTO chat1, ChattingDTO chat2) {
		return chat2.getChat_idx() - chat1.getChat_idx();
	}
}