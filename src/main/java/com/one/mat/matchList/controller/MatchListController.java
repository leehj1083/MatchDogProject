package com.one.mat.matchList.controller;

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
import org.springframework.web.multipart.MultipartFile;

import com.one.mat.matchList.service.MatchListService;
import com.one.mat.member.dto.MemberDTO;

@Controller
public class MatchListController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	MatchListService service;
	
	// 사진 모달창 이동 요청
	@RequestMapping(value="/photoUpload.go")
	public String photoUploadGo() {
		return "test";
	}
	
	// 사진 모달창 이동 요청
	@RequestMapping(value="/test.go")
	public String testGo() {
		return "test2";
	}
	
	@RequestMapping(value="/test.do")
	@ResponseBody
	public HashMap<String, Object> chatPhotoDo(HttpSession session, @RequestParam MultipartFile[] photos){
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int memberIdx = dto.getMember_idx();
//		logger.info("photo : "+photos.length);
//		logger.info("photo : "+photos);
		
		for (MultipartFile photo : photos) {
            if (!photo.isEmpty()) {
                String fileName = photo.getOriginalFilename();
                logger.info("Received file: " + fileName);
                // 여기에서 파일을 저장하거나 다른 작업을 수행할 수 있습니다.
            }
        }

		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 //매칭받은 리스트 페이지로 이동
	@RequestMapping(value="/recvMatchingList.go")
	public String recvMatchingListGo(Model model,HttpSession session) {
		String page = "login";
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		if(dto == null) { // 로그인 안했을 때
			model.addAttribute("msg","로그인해주세요.");
		}else if(dto.getMember_loginLock().equals("Y")) { // 제재당한 회원일 때
			model.addAttribute("msg","제재당한 회원입니다.");
		}else if(dto.getMember_quit().equals("Y")) { // 탈퇴한 회원일 때
			model.addAttribute("msg","탈퇴한 회원입니다.");
		}else { // 정상 로그인 시
			page = "recvMatchingList";
		}
		// + 프로필 없으면 프로필 등록 페이지로
		return page;
	}
	
	// 매칭받은 리스트 뿌려주기
	@RequestMapping(value="/recvMatchingList.do")
	@ResponseBody
	public HashMap<String, Object> recvMatchingListDo(HttpSession session ,@RequestParam String pagePerNum, @RequestParam String page) {
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		int memberIdx = dto.getMember_idx();
		int subsType = dto.getSubsType_code();
		return service.recvMatchingListDo(pagePerNum,page,memberIdx,subsType);
	}
	
	// 채팅방 생성하기
	@RequestMapping(value="/chatOpen.do")
	public String chatOpen(Model model, @RequestParam String match_idx) {
		logger.info("match_idx:"+match_idx);
		int match_id = Integer.parseInt(match_idx);
		int chat_idx = service.chatOpen(match_id);
		if(chat_idx != 0) {
			model.addAttribute("chat_idx",chat_idx);
			return "chattingRoom";
		}
		return "redirect:/chattingRoom?chat_idx=" + chat_idx;
	}

}
