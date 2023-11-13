package com.one.mat.matchList.service;

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

import com.one.mat.alarm.dto.AlarmDTO;
import com.one.mat.chatting.dto.ChattingDTO;
import com.one.mat.matchList.dao.MatchListDAO;
import com.one.mat.matchList.dto.MatchListDTO;
import com.one.mat.member.dto.ProfileDTO;

@Service
public class MatchListService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	MatchListDAO dao;
	
	// 요청받은 리스트 뿌리기
	public HashMap<String, Object> recvMatchingListDo(String pagePerNum, String page, int memberIdx, int subsType) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ProfileDTO> proIdx = dao.proIdx(memberIdx); // 프로필 1,2 가져오기
		
		ArrayList<MatchListDTO> matList = new ArrayList<MatchListDTO>();
		ArrayList<MatchListDTO> MatchingList = new ArrayList<MatchListDTO>();
		
		Iterator<ProfileDTO> it = proIdx.iterator();
		while (it.hasNext()) {
			ProfileDTO dto = it.next(); // 1 일떄 , 2 일때 
			ArrayList<MatchListDTO> proSendIdx = dao.proSendIdx(dto.getPro_idx()); // 값 3개 2개
			ArrayList<MatchListDTO> timeInfo = dao.timeInfo(dto.getPro_idx()); // 값 3개 2개
			for (int i = 0; i < proSendIdx.size(); i++) {
				
				MatchListDTO matListDTO = new MatchListDTO();
				
				matListDTO.setMatch_idx(proSendIdx.get(i).getMatch_idx());
				matListDTO.setPro_sendIdx(proSendIdx.get(i).getPro_sendIdx());
				matListDTO.setPro_recvIdx(proSendIdx.get(i).getPro_recvIdx());
				matListDTO.setMatch_succeed(proSendIdx.get(i).getMatch_succeed());
				matListDTO.setMatchTime(timeInfo.get(i).getMatchTime());

				matList.add(matListDTO);
			}
		}
		

		// 숫자가 큰 순부터(최신순부터) 정렬하기(match_idx 사용)
		Collections.sort(matList, new MatchListDTOComparator());
		
		Iterator<MatchListDTO> its = matList.iterator();
		while(its.hasNext()) {
			MatchListDTO dto = its.next(); // pro_sendIdx 가지고 오기
			String matSucceed = dto.getMatch_succeed();
			
			// 채팅방 오픈을 위한 match_idx 가지고 오기
			int matIdx = dto.getMatch_idx();
			// 프로필 사진
			String photo_fileName = dao.photoInfo(dto.getPro_sendIdx());
			// p.pro_idx,bt.breedType, p.pro_dogName 가지고 오기
			MatchListDTO ProInfo = dao.proInfo(dto.getPro_sendIdx());
			// 성향 가지고 오기
			ArrayList<String> charInfo = dao.charInfo(dto.getPro_sendIdx());
			// 어떤 개한테 온 매칭인지 확인하기 위해 갖고옴
			String myDogName = dao.myDogName(dto.getPro_recvIdx());
			
			// 담을 그릇
			MatchListDTO matDTO = new MatchListDTO();
			
				
			if(ProInfo != null && myDogName != null && charInfo != null 
					&& matSucceed.equals("N")) {
			matDTO.setMyDogName(myDogName);
			matDTO.setMatch_idx(matIdx);
			matDTO.setMatchTime(dto.getMatchTime());
			matDTO.setPro_idx(ProInfo.getPro_idx());
			matDTO.setPro_dogName(ProInfo.getPro_dogName());
			matDTO.setBreedType(ProInfo.getBreedType());
			matDTO.setPhoto_fileName(photo_fileName);
			matDTO.setCharType(charInfo);
			MatchingList.add(matDTO);
			}
			// ArrayList 에 담기
		}
		
		// 페이징
		int ppn = Integer.parseInt(pagePerNum); // 페이지당 보여줄 게시글 수 5 개씩
		int p = Integer.parseInt(page); // 현재 보여줄 페이지 1

		// logger.info("보여줄 페이지 : "+page+"/"+"pagePerNum : " + pagePerNum);
		// logger.info("chatList.size(): "+chatList.size() + "/ chatList.size()/ppn
		// :"+Math.ceil((double)chatList.size()/ppn));

		int offset = (p - 1) * ppn; // 0 번부터 4번 , 5~ 9번 , 10~ 14번
		int pages = (int) Math.ceil((double) MatchingList.size() / ppn);
		int endIndex = Math.min(offset + ppn, MatchingList.size());
		// 페이징에 가지고 올 리스트 개수
		List<MatchListDTO> list = new ArrayList<MatchListDTO>();
		if (offset < endIndex) {
			list = MatchingList.subList(offset, endIndex); // 0 번부터 5번 이전까지 / 5 번부터 10번 이전까지 ...
			// logger.info("list size : " +list.size());
		} else {
		}

		// logger.info("pages : " +pages);
		map.put("subsType", subsType);
		map.put("currPage", p);
		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("matList",list);
		return map;
	}

	public int chatOpen(int match_idx) {
		
		int chat_idx = 0;
		int result = 0;
		//match_idx 에 채팅이 여러개 생성됬는지 여부
		//ArrayList<Integer> chatDuplication = dao.chatDuplication(match_idx);
		//if(chatDuplication.size() < 1) {
		int row = dao.sendOpen(match_idx);
		
		if(row != 0) {
			result = dao.chatOpen(match_idx);
		}
		if(result != 0) {
			chat_idx = dao.chatMove(match_idx);
		}
		
		List<AlarmDTO> alarmList = new ArrayList<AlarmDTO>();
		alarmList = dao.selectSendRecvIdx(match_idx);
		int pro_sendIdx = 0;
		int pro_recvIdx = 0;
		for (AlarmDTO alarmDTO : alarmList) {
			pro_sendIdx = alarmDTO.getPro_sendIdx();
			pro_recvIdx = alarmDTO.getPro_recvIdx();
		}
		dao.newChattingRoomAlarm(pro_sendIdx, pro_recvIdx );	
		return chat_idx;
	}

	
	// 세션체크
	public HashMap<String, Object> adminCheckDo(int memberIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int admin = dao.adminCheckDo(memberIdx);
		logger.info("admin 값 :"+admin);
		map.put("admin", admin);
		
		return map;
	}
	
	
}

class MatchListDTOComparator implements Comparator<MatchListDTO> {
	@Override
	public int compare(MatchListDTO chat1, MatchListDTO chat2) {
		return chat2.getMatch_idx() - chat1.getMatch_idx();
	}
}






