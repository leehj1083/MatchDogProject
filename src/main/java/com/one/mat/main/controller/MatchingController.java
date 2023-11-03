package com.one.mat.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.main.service.MatchingService;
import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.ProfileDTO;

@Controller
public class MatchingController {
	
	Logger logger = LoggerFactory.getLogger(MatchingController.class);
	@Autowired MatchingService service;

	@RequestMapping(value = "/HomeMatchingList.do")
	public String home() {
		return "home";
	}
	
	// 세션 체크(로그인, 비로그인 다르게)
	// 구독 안했을시 리스트 3개까지만 
	// 구독 했을시 리스트 10까지 보여주고 페이징처리로 다음 리스트 보여주기
	// 리스트 자정을 기준으로 리셋
	// 탈퇴한 유저의 프로필은 리스트 제외
	// 제재 당한 유저의 프로필은 리스트제외
	// 자신의 동주소를 기준으로 성향이 4,3,2,1 개가 일치하는 순으로 리스트 나열
	// 견name, 개age(비공개 가능), 개gender(비공개 가능), 개char, 소개글
	@RequestMapping(value = "/MatchingList.do")
	@ResponseBody
	public Map<String, Object> matching(Model model, HttpSession session) {
		logger.info("MatchingList");
		
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> temp = new HashMap<>();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		int member_idx = dto.getMember_idx();
		logger.info("member_idx="+member_idx);

	 	    if (dto != null) {
	 			ArrayList<ProfileDTO> myProfile = service.MyProfileListDo(member_idx);
	 			List<Map<String, Object>> matchingList = new ArrayList<Map<String,Object>>();
	 			
	 			for (ProfileDTO profileDTO : myProfile) {
	 				 if(profileDTO.getPro_rep().equals("Y")) {
		 			    int pro_idx = profileDTO.getPro_idx();
		 			    logger.info("pro_idx="+pro_idx);
		 			    
		 			    matchingList = service.matchingList(member_idx, pro_idx);
		 			    logger.info("matchingList="+ matchingList);
		 			    temp.put("matchingList", matchingList);
		 			    
		 			    // 성향 정보를 가져옴
		 			    ArrayList<String> charTypeList = service.charType(pro_idx);
	
		 			    // 해당 프로필의 성향 정보를 프로필에 추가
		 			    profileDTO.setCharTypeList(charTypeList);
		 			    
		 			    // 사진 정보를 가져와야 함
		 			    // ArrayList<String> photo_fileNameList = service.photo_fileName(pro_idx);
		 			    // 해당 프로필의 사진 정보를 프로필에 추가해야 함
		 			    // profileDTO.setPhoto_fileNameList(photo_fileNameList);
	
		 			    // 수정된 프로필을 myProfileList에 추가
		 			    // myProfileList.add(profileDTO);
	
		 			    logger.info("성향들:" + charTypeList);
		 			    // logger.info("사진:" + photo_fileNameList);
		 				 }
	 			}
	 			map.putAll(temp);
	 		}
	    
	    return map;    
	}
	// 성향 리스트 요청
	@RequestMapping(value = "/CharTypeList.do")
	@ResponseBody
	public List<String> getCharTypeList(HttpSession session) {
	    MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
	    int member_idx = dto.getMember_idx();
	    ArrayList<ProfileDTO> myProfile = service.MyProfileListDo(member_idx);
	    List<String> charTypeList = new ArrayList<>();
	    
	    // 세션 체크
	    if (dto != null) {
	        for (ProfileDTO profileDTO : myProfile) {
	            if (profileDTO.getPro_rep().equals("Y")) {
	                int pro_idx = profileDTO.getPro_idx();
	                logger.info("pro_idx=" + pro_idx);
	                charTypeList = service.charType(pro_idx);
	            }
	        }
	    }
	    return charTypeList;
	}
 
	// 프로필 리스트 삭제 요청 /HomeDelete.do
//	@RequestMapping(value = "/HomeDelete.do")
//	@ResponseBody
	
	// 매칭보내기 요청 /HomeSend.do
	// 프로필상세보기 이동 요청 /memberDetailList.go
	@RequestMapping(value="/recvMatchingList.jsp")
	public String recvMatchingList() {
		return "recvMatchingList";
	}
}

