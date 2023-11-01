package com.one.mat.chatting.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.chatting.dao.ChattingDAO;
import com.one.mat.chatting.dto.ChattingDTO;
import com.one.mat.main.dto.MatchingDTO;

@Service
public class ChattingService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ChattingDAO dao;

	public HashMap<String, Object> chattingListDo(String page, String pagePerNum, int memberIdx) {
		
		// memberIdx 에서 pro_idx 가지고 오기
		ArrayList<ProfileDTO> proIdx = dao.proIdx(memberIdx);
		ArrayList<MatchingDTO> matIdx = new ArrayList<MatchingDTO>();
		ArrayList<Integer> matNum = new ArrayList<Integer>();
		ArrayList<ChattingDTO> chatList = new ArrayList<ChattingDTO>();
		
		// pro_idx 를 이용해서 매칭수락한 리스트 가지고 오기
		Iterator<ProfileDTO> it = proIdx.iterator();
		while(it.hasNext()) {
			matIdx = dao.matIdx(it.next().getPro_idx());
			Iterator<MatchingDTO> its = matIdx.iterator();
			while(its.hasNext()) {
				matNum.add(its.next().getPro_idx());
			}
		}
		
		//이 리스트들의 닉네임이랑 이거저거 불러오기
		Iterator<Integer> matNumIt = matNum.iterator();
		while(matNumIt.hasNext()) {
			//chatList = dao.chatList(matNumIt.next());
		}
		
		matNumIt = matNum.iterator();
		
		
	
		
		int ppn = Integer.parseInt(pagePerNum); // 페이지당 보여줄 게시글 수 5 개씩
		int p = Integer.parseInt(page); // 현재 보여줄 페이지 1		
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자
		// offset : limit n 개부터 offset m 번부터 n 개 가져와라 할 때 사용.
		// 1:0 -> 2:5 -> 3:10 -> 4:15 -> 5:20
		int offset = (p-1)*ppn;
		
		// ArrayList<ChattingDTO> list = dao.chattingListDo(ppn,offset,memberIdx);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//int pages = dao.totalPage(p); // 총 페이지 개수
		//logger.info("만들수 있는 총 페이지 갯수 : "+pages);
		
		// 만약 현재 보고 있는 페이지가, 총 페이지 수 보다 크면 현재페이지를 총 페이지수로 변경한다.
//		if(p>pages) {
//			p = pages;
//		}		
		map.put("currPage", p);
		//map.put("pages", pages); // 만들 수 있는 총 페이지 수
		//map.put("list", list);		
		return map;
	}

	public ArrayList<ChattingDTO> chatRoomListDo() {
		return dao.chatRoomListDo();
	}

	public int chatSaveDo() {
		return dao.chatSaveDo();
	}


}
