package com.one.mat.chatting.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.mat.chatting.dto.ChattingDTO;
import com.one.mat.chatting.service.ChattingService;
import com.one.mat.member.dto.MemberDTO;

@Controller
public class ChattingController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ChattingService service;
	
	@RequestMapping(value="/")
	public String index() {
		return "login";
	}
	
	// 채팅방 페이지로 이동
	@RequestMapping(value="/chattingList.go")
	public String chattingListGo(Model model,HttpSession session) {
		String page = "login";
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		if(dto == null) { // 로그인 안했을 때
			model.addAttribute("msg","로그인해주세요.");
		}else if(dto.getMember_loginLock().equals("Y")) { // 제재당한 회원일 때
			model.addAttribute("msg","제재당한 회원입니다.");
		}else if(dto.getMember_quit().equals("Y")) { // 탈퇴한 회원일 때
			model.addAttribute("msg","탈퇴한 회원입니다.");
		}else { // 정상 로그인 시
			page = "test3";
		}
		// + 프로필 없으면 프로필 등록 페이지로
		return page;
	}
	
//	@RequestMapping(value="/chattingList.do")
//	public HashMap<String, Object> chattingListDo(@RequestParam String pagePerNum, @RequestParam String page, HttpSession session) {
//		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
//		int memberIdx = dto.getMember_idx();
//		logger.info(dto.getMember_idx()+","+dto.getMember_id()+","+dto.getMember_loginLock());
//		logger.info("보여줄 페이지 : "+page);
//		return service.chattingListDo(pagePerNum,page,memberIdx);
//	}
//	
//	@RequestMapping(value="/chattingRoom.go")
//	public String chattingLoomGo() {
//		return "test";
//	}
//	
//	@RequestMapping(value="/chatRoomList.do")
//	public HashMap<String, Object> chatRoomListDo(){
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		ArrayList<ChattingDTO> chatList = service.chatRoomListDo();		
//		return map;
//	}
//	
//	@RequestMapping(value="/chatSave.do")
//public HashMap<String, Object> chatSaveDo(){
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		int row = service.chatSaveDo();
//		return map;
//	}
	

	
}
