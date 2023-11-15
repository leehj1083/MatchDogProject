package com.one.mat.member.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.one.mat.admin.dto.CompDTO;
import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.PhotoDTO;
import com.one.mat.member.dto.ProfileDTO;
import com.one.mat.member.service.RegProfileService;

@Controller
public class RegProfileController {
	String redirectURL = "";
	 
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	RegProfileService service;

	@RequestMapping("/chattcompTypeList.do")
	public String compTypeList(Model model,@RequestParam(name = "comp_idfNum", required = false) String chattId,@RequestParam(name="comp_reportIdx", required = false)String reportId, HttpSession session) {
		
		session.setAttribute("reportId", reportId);
		session.setAttribute("chattId", chattId);
		
		logger.info("reportId : "+reportId);
		logger.info("chattId : "+chattId);
		
		ArrayList<CompDTO> compList = service.compList();
		model.addAttribute("compList", compList);
		logger.info("compList : "+compList);

		return "chattingcomp";
	}
	@RequestMapping("/commentcompTypeList.do")
	public String commentcompTypeList(@RequestParam(name = "reply_id", required = false) String replyId,Model model,HttpSession session) {
		
		session.setAttribute("replyId", replyId);
		
		logger.info("replyId : "+replyId);
		
		ArrayList<CompDTO> compList = service.compList();
		model.addAttribute("compList", compList);
		logger.info("compList : "+compList);

		return "commentcomp";
	}
	@RequestMapping("/boardcompTypeList.do")
	public String boardcompTypeList(@RequestParam(name = "board_id", required = false) String boardId, Model model,HttpSession session) {
		
		session.setAttribute("boardId", boardId);
		 logger.info("board_id: " + boardId);
		
		ArrayList<CompDTO> compList = service.compList();
		model.addAttribute("compList", compList);
		logger.info("compList : "+compList);

		return "boardcomp";
	}
	
	@RequestMapping("/chattingcompSave.do")
	public String chattingcompSave(@RequestParam Map<String, String> params, HttpSession session,HttpServletRequest request) {
		String currentRequestURI = request.getRequestURI();
		
		 MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo"); 
		 String chattIdStr = (String) session.getAttribute("chattId");
		 int chattId = Integer.parseInt(chattIdStr);
		 String reportIdStr = (String) session.getAttribute("reportId");
		 int reportId = Integer.parseInt(reportIdStr);
		 
		 int memberIdx = memberDTO.getMember_idx();
		    
		    logger.info("Member Index: " + memberIdx);
		    logger.info("chattId: " + chattId);
		    logger.info("reportId: " + reportId);
		    
		params.put("chattId", String.valueOf(chattId));
		params.put("reportId", String.valueOf(reportId));
		params.put("memberIdx", String.valueOf(memberIdx));
	    logger.info("params : " + params);
	    
	    
	   
	    
	    
	    String photo = params.get("photo");
      	session.setAttribute("photo", photo);
	    service.chattingcompSave(params);
	    
	  
	    if (currentRequestURI.contains("/chattingcompSave.do")) {
	        redirectURL = "redirect:/chattingList.go";
	    } else if (currentRequestURI.contains("/commentcompSave.do")) {
	        redirectURL = "redirect:/boardList.go";
	    } else if (currentRequestURI.contains("/boardcompSave.do")) {
	        redirectURL = "redirect:/boardList.go";
	    }
		
		
		
		// 일단은 신고를 하고나면 신고한 위치에 따라 돌아가는 요청을 다르게 설정 일단은 다시 신고창으로 들어가게 하였음 
		return "redirect:/compHistory"; 
		
	}
	@RequestMapping("/boardcompSave.do")
	public String boardcompSave(@RequestParam Map<String, String> params, HttpSession session,HttpServletRequest request) {
		String currentRequestURI = request.getRequestURI();
		 MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo"); 
		    int memberIdx = memberDTO.getMember_idx();
		    String boardIdStr = (String) session.getAttribute("boardId");

		 // 문자열을 정수로 변환
		 int boardId = Integer.parseInt(boardIdStr);
		    
		    logger.info("boardId : "+boardId);
		    logger.info("Member Index: " + memberIdx);
		    
		
		params.put("memberIdx", String.valueOf(memberIdx));
		params.put("boardId", String.valueOf(boardId));
	    logger.info("params : " + params);
	   
	    
	    
	    String photo = params.get("photo");
      	session.setAttribute("photo", photo);
	    service.boardcompSave(params);
	    
	    if (currentRequestURI.contains("/chattingcompSave.do")) {
	        redirectURL = "redirect:/chattcompTypeList.do";
	    } else if (currentRequestURI.contains("/commentcompSave.do")) {
	        redirectURL = "redirect:/boardList.go";
	    } else if (currentRequestURI.contains("/boardcompSave.do")) {
	        redirectURL = "redirect:/boardList.go";
	    }
		
		
		
		// 일단은 신고를 하고나면 신고한 위치에 따라 돌아가는 요청을 다르게 설정 일단은 다시 신고창으로 들어가게 하였음 
		return "redirect:/compHistory"; 
		
	}
	
	@RequestMapping("/commentcompSave.do")
	public String commentcompSave(@RequestParam Map<String, String> params, HttpSession session,HttpServletRequest request) {
		String currentRequestURI = request.getRequestURI();
		 MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo"); 
		    int memberIdx = memberDTO.getMember_idx();
		    logger.info("Member Index: " + memberIdx);
		    
		    String replyIdStr = (String) session.getAttribute("replyId");

			
			 int replyId = Integer.parseInt(replyIdStr);
		
		params.put("memberIdx", String.valueOf(memberIdx));
		params.put("replyId", String.valueOf(replyId));
	    logger.info("params : " + params);
	   
	    
	    
	    String photo = params.get("photo");
      	session.setAttribute("photo", photo); 
	    service.commentcompSave(params);
	    
	    if (currentRequestURI.contains("/chattingcompSave.do")) {
	        redirectURL = "redirect:/chattcompTypeList.do";
	    } else if (currentRequestURI.contains("/commentcompSave.do")) {
	        redirectURL = "redirect:/boardList.go";
	    } else if (currentRequestURI.contains("/boardcompSave.do")) {
	        redirectURL = "redirect:/boardList.go";
	    }
		

		// 일단은 신고를 하고나면 신고한 위치에 따라 돌아가는 요청을 다르게 설정 일단은 다시 신고창으로 들어가게 하였음 
		return "redirect:/compHistory"; 
		
	}
	
     @RequestMapping("/compHistory")
     public String compHistory(HttpSession session, HttpServletRequest request) {
    	 String currentRequestURI = request.getRequestURI();
    	 
    	 MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo"); 
		    int memberIdx = memberDTO.getMember_idx();
		    logger.info("Member Index: " + memberIdx);
		    String photo = (String) session.getAttribute("photo");
		    logger.info("photo :" + photo);
		 service.compPhoto(photo);
    	 service.historySave(memberIdx);
    	 
    	 
    	
    	 return redirectURL;
     }
     
     
	//	@RequestMapping("/memberDetailList")
	//	public String memberDetail(Model model,HttpSession session) {
	//		ArrayList<ProfileDTO> list = service.charlist();
	//		ArrayList<PhotoDTO> list2 = service.memberDetailListPhoto();
	//		model.addAttribute("list", list);
	//		model.addAttribute("list2"+ list2);
	//		logger.info("list  ="+list);
	//		logger.info("list2 : "+list2);
	//		service.memberDetail(model);
	//		return "memberDetailList";
	//	}
     
    // ----------------------------------regProfile --------------------------------
     
     @RequestMapping("/regProfile")
 	public String Home(Model model, HttpSession session) {
    	 
//    	 String page = "login";
//    	 MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
//    	 
//    	 if(dto == null) {
//    		 model.addAttribute("msg","로그인이 필요한 서비스입니다.");
//    	 }else {
    		 ArrayList<ProfileDTO> list = service.list();
    		 model.addAttribute("list", list);
    		 logger.info("list  ="+list);
    		 
    		 ArrayList<ProfileDTO> list2 = service.list2();
    		 model.addAttribute("list2", list2);
    		 logger.info("list2 : "+list2);
    		 
    		 String page="regProfile";
//    	 }
 		
 		
 		return page;
 	}
     
     
     @RequestMapping(value = "/profileSave.do")
 	public String profileSaveDo(Model model, HttpSession session,
 			@RequestParam Map<String, String> params,
 			@RequestParam(value = "selectedCharTypesCode", required = false) String selectedCharTypesCode,
 			// 세연 추가 코드
 			MultipartFile[] uploadFiles, @RequestParam String[] dataIndex, @RequestParam String delPhotoName){
 		
 		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
 		int member_idx = dto.getMember_idx();
    	 
    	 String page = "login";
    	 
    	 service.profileSaveDo(params,selectedCharTypesCode,uploadFiles,dataIndex,member_idx);

 		if (session.getAttribute("loginInfo") == null) {
 			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
 		} else {
 			/* service.MyProfileModList(pro_idx, model); */
 			
 			//service.myProfileModUpdateDo(params);

 			// 세연 추가 코드
 			//service.photoInsert(uploadFiles,pro_idx,dataIndex,delPhotoName);
 			page = "home";
 		}
 		return page;
 	}
     
     
     
     

}
