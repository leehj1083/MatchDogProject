package com.one.mat.matchList.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.matchList.dao.MatchListDAO;
import com.one.mat.matchList.dto.MatchListDTO;
import com.one.mat.member.dto.ProfileDTO;

@Service
public class MatchListService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	MatchListDAO dao;
	
	ArrayList<MatchListDTO> matProIdx = new ArrayList<MatchListDTO>();
	MatchListDTO matListDTO = new MatchListDTO();

	// 요청받은 리스트 뿌리기
	public HashMap<String, Object> recvMatchingListDo(String pagePerNum, String page, int memberIdx) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ProfileDTO> proIdx = dao.proIdx(memberIdx); // 프로필 가져오기
		
		Iterator<ProfileDTO> it = proIdx.iterator();
		while (it.hasNext()) {
			ArrayList<MatchListDTO> proSendIdx = dao.proSendIdx(it.next().getPro_idx());
			Iterator<MatchListDTO> its = proSendIdx.iterator(); // 나한테 요청 보낸 프로필 얻기
			while (its.hasNext()) {
				matProIdx.add(its.next()); // 프로필 1과 2 합친거 chatProIdx 에 넣기.
			}
		}
		// 숫자가 큰 순부터(최신순부터) 정렬하기(match_idx 사용)
		Collections.sort(matProIdx, new MatchListDTOComparator());
		
		Iterator<MatchListDTO> its = matProIdx.iterator();
		while(its.hasNext()) {
			MatchListDTO dto = its.next(); // pro_sendIdx, match_reg 가지고 오기
			dto.getPro_sendIdx();
			// p.pro_idx,pt.photo_fileName, bt.breedType, p.pro_dogName 가지고 오기
			MatchListDTO ProInfo = dao.proInfo(dto.getPro_sendIdx());
			
			
			// 담을 그릇
			MatchListDTO matDTO = new MatchListDTO();
			
			matDTO.setMatch_req(dto.getMatch_req());
			matDTO.setPro_idx(ProInfo.getPro_idx());
			matDTO.setPro_dogName(ProInfo.getPro_dogName());
			matDTO.setBreedType(ProInfo.getBreedType());
			matDTO.setPhoto_fileName(ProInfo.getPhoto_fileName());
			
		}
		
		
		
		// TODO Auto-generated method stub
		return map;
	}
	
	
}

class MatchListDTOComparator implements Comparator<MatchListDTO> {
	@Override
	public int compare(MatchListDTO chat1, MatchListDTO chat2) {
		return chat2.getMatch_idx() - chat1.getMatch_idx();
	}
}





