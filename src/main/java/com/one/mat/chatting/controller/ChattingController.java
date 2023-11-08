package com.one.mat.chatting.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.async.DeferredResult;
import org.springframework.web.multipart.MultipartFile;

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
	
	// 채팅방 리스트 페이지로 이동 ( 세션 체크 )
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
			page = "chattingList";
		}
		// + 프로필 없으면 프로필 등록 페이지로
		return page;
	}
	
	
	// 채팅방 리스트 뿌려주기
	@RequestMapping(value="/chattingList.do")
	@ResponseBody
	public HashMap<String, Object> chattingListDo(@RequestParam String pagePerNum, @RequestParam String page, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		int memberIdx = dto.getMember_idx();
		// logger.info(dto.getMember_idx()+","+dto.getMember_id()+","+dto.getMember_loginLock());
		 logger.info("보여줄 페이지 : "+page+"/"+"pagePerNum : " + pagePerNum);
		 
		return service.chattingListDo(pagePerNum,page,memberIdx);
	}
	
	// ----------------------------------------------------- 채팅룸 -------------------------------------------------------------------
	
	// 채팅방 접근권한
	@RequestMapping(value="/chattingRoom.go")
	public String chattingRoomGo(Model model, HttpSession session, @RequestParam String chat_idx) {
		
		String page = "login";
		int memberIdx = 0;
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo"); // 세션의 로그인 정보를 가져오기
		boolean result = service.chattingRoomGo(chat_idx, memberIdx);
		
		if(dto != null) {
			memberIdx = dto.getMember_idx();
		}
		// 로그인 안했을 때
		if(dto == null) {
			model.addAttribute("msg","로그인해주세요.");
		}else if(dto.getMember_loginLock().equals("Y")) { // 제재당한 회원일 때
			model.addAttribute("msg","제재당한 회원입니다.");
		}else if(dto.getMember_quit().equals("Y")) { // 탈퇴한 회원일 때
			model.addAttribute("msg","탈퇴한 회원입니다.");
		}else if(!(result)) { // 다른 채팅방에 멋대로 접근할 때 막기
			model.addAttribute("msg","접근할 수 없는 회원입니다.");
		}else { // 정상 로그인 시
			model.addAttribute("chat_idx",chat_idx);
			page = "chattingRoom";
		}
		return page;
	}
	
	// 채팅방 주고받은 정보 띄우기
	@RequestMapping(value="/chatRoomList.do")
	@ResponseBody
	public HashMap<String, Object> chatRoomListDo(HttpSession session, @RequestParam String chat_idx) {
		logger.info("chat_idx : "+ chat_idx);
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		int memberIdx = dto.getMember_idx();
		return service.chatRoomListDo(memberIdx,chat_idx);
	}
	
	// 사진 파일 저장
	@RequestMapping(value="/chatPhoto.do")
	@ResponseBody
	public HashMap<String, Object> chatPhotoDo(HttpSession session, @RequestParam MultipartFile[] photo, @RequestParam String chat_idx){
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		int memberIdx = dto.getMember_idx();
		logger.info("photo : "+photo.length);
		logger.info("chat_idx : "+chat_idx);

		return service.chatPhotoDo(photo,chat_idx,memberIdx);
	}
	
	// 채팅 입력
	@RequestMapping(value="/chatSave.do")
	@ResponseBody
	public HashMap<String, Object> chatSaveDo(HttpSession session, @RequestParam String content,@RequestParam String chat_idx){
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		int memberIdx = dto.getMember_idx();
		return service.chatSaveDo(content,chat_idx,memberIdx);
	}
	
	
	// ---------------------------------------------------------------- 후기 -----------------------------------------------------------------
	
	// 후기 등록
	@RequestMapping(value="/review.go")
	public String review(Model model, HttpSession session, @RequestParam String pro_idx, @RequestParam String chat_idx) {
		
		String page = "login";
		int memberIdx = 0;
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo"); // 세션의 로그인 정보를 가져오기
		boolean result = service.chattingRoomGo(chat_idx, memberIdx);
		
		if(dto != null) {
			memberIdx = dto.getMember_idx();
		}
		// 로그인 안했을 때
		if(dto == null) {
			model.addAttribute("msg","로그인해주세요.");
		}else if(dto.getMember_loginLock().equals("Y")) { // 제재당한 회원일 때
			model.addAttribute("msg","제재당한 회원입니다.");
		}else if(dto.getMember_quit().equals("Y")) { // 탈퇴한 회원일 때
			model.addAttribute("msg","탈퇴한 회원입니다.");
		}else if(!(result)) { // 다른 채팅방에 멋대로 접근할 때 막기
			model.addAttribute("msg","접근할 수 없는 회원입니다.");
		}else { // 정상 로그인 시
			model.addAttribute("chat_idx",chat_idx);
			model.addAttribute("pro_idx",pro_idx);
			page = "review";
		}
		return page;
	}
	
	@RequestMapping(value="/reviewProfile.do")
	@ResponseBody
	public HashMap<String, Object> reviewProfileDo(@RequestParam String pro_idx) {
		return service.reviewProfileDo(pro_idx);
	}
	

	
}
