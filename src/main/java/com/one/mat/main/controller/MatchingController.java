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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.main.service.MatchingService;
import com.one.mat.member.dto.MatchAllDTO;
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
	
	// 세션 체크(로그인, 비로그인 다르게) (완료)
	// 리스트 10개까지 보여주고 페이징처리로 다음 리스트 보여주기
	// 리스트 자정을 기준으로 리셋
	// 탈퇴한 유저의 프로필은 리스트 제외 (완료)
	// 제재 당한 유저의 프로필은 리스트제외 (완료)
	// 자신의 동주소를 기준으로 성향이 4,3,2,1 개가 일치하는 순으로 리스트 나열 (완료)
	// 동주소, 성별, 견name, 개char, 소개글, 사진 (완료)
	// 성향, 개age,개gender 비공개  리스트는 따로 가져와야함
	
	@RequestMapping(value = "/MatchingList.do")
	@ResponseBody
	public Map<String, Object> matchingListDo(Model model, HttpSession session) {
		logger.info("MatchingList");
		
		Map<String, Object> map = new HashMap<>();
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		
		// 로그인 했을때
		if (dto != null) {
		int member_idx = dto.getMember_idx();
			logger.info("member_idx : "+member_idx);
			ArrayList<ProfileDTO> myProfile = service.MyProfileListDo(member_idx);
			
			for (ProfileDTO profileDTO : myProfile) {
				 if(profileDTO.getPro_rep().equals("Y")) {
				    int pro_idx = profileDTO.getPro_idx();
				    logger.info("pro_idx : "+pro_idx);
				    
				    ArrayList<MatchAllDTO> list = service.matchingList(member_idx, pro_idx);
				    map.put("list", list);
				}
			}
		} else {
		    ArrayList<MatchAllDTO> list = service.unloginedMatchingList();
		    map.put("list", list);
		}
		return map;    
	}
	
	
	// 매칭보내기 요청 /HomeSend.do
	@RequestMapping(value="/HomeSend.do")
	@ResponseBody
	public int homeSendDo(HttpSession session, @RequestBody Map<String, Object> pro_recvidx) {
		logger.info("HomeSend.do");		
		logger.info("homeSendDo/Map pro_recv_idx : " + pro_recvidx);
		Object Obj_pro_recvIdx = pro_recvidx.get("pro_idx");
		String pro_recvIdx = (Obj_pro_recvIdx != null) ? Obj_pro_recvIdx.toString() : null;
		Map<String, String> map = new HashMap<String, String>();

		if (pro_recvIdx != null) {
			map.put("pro_recvIdx", pro_recvIdx);
			logger.info("homeSendDo/map.put pro_recvIdx :"+pro_recvIdx);
			MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			int member_idx = dto.getMember_idx();
			int pro_idx = 0;
			logger.info("member_idx : "+member_idx);
			
			if (dto != null) {
				ArrayList<ProfileDTO> myProfile = service.MyProfileListDo(member_idx);
				for (ProfileDTO profileDTO : myProfile) {
					if(profileDTO.getPro_rep().equals("Y")) {
						pro_idx = profileDTO.getPro_idx();
						map.put("pro_sendIdx", Integer.toString(pro_idx));
						logger.info("homeSendDo/map.put pro_sendIdx : "+pro_idx);
						int pro_sendIdx = pro_idx;
						service.matchingSendAlarm(pro_sendIdx,Integer.parseInt(pro_recvIdx));
					}
				}
			}
		} else {
			logger.info("실패!");
			}
	return  service.homeSend(map);
}
	
// 프로필상세보기 모달창 요청 /memberDetailList.go
	@RequestMapping(value= "/memberDetailList.go")
	public String memberDetailListGO(Model model, HttpSession session,@RequestParam int pro_idx) {
		logger.info("memberDetailListGo");
		Map<String, Object> map = new HashMap<String, Object>();
			logger.info("memberDetailListGo/pro_idx : " + pro_idx);
			       map = service.memberDetailListGO(pro_idx);
			       logger.info("map : "+map);
			       model.addAttribute("map",map);
		return "memberDetailList";
	}

}








