package com.one.mat.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.admin.dto.CompDTO;
import com.one.mat.admin.service.CompService;
import com.one.mat.member.dto.MemberDTO;

@Controller
public class CompController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	CompService service;

	@RequestMapping(value = "/compList.go")
	public String compList(HttpSession session, @RequestParam(value = "adad", required = false) String selectedValue,
			@RequestParam(value = "aaa", required = false) String allButton,
			@RequestParam(value = "bbb", required = false) String boardButton,
			@RequestParam(value = "ccc", required = false) String chattButton,
			@RequestParam(value = "ddd", required = false) String comentButton) {
		session.setAttribute("allButton", allButton);
		session.setAttribute("chattButton", chattButton);
		session.setAttribute("boardButton", boardButton);
		session.setAttribute("comentButton", comentButton);
		session.setAttribute("selectedValue", selectedValue);

		return "compList";
	}



	@RequestMapping(value = "/list2")
	@ResponseBody
	public Map<String, Object> list(HttpSession session, @RequestParam String pagePerNum, @RequestParam String page) {
		logger.info("페이지당 보여줄 게시글 수 : " + pagePerNum);
		logger.info("보여줄 페이지 : " + page);
		String selectedValue = (String) session.getAttribute("selectedValue");
		String allButton = (String) session.getAttribute("allButton");
		String chattButton = (String) session.getAttribute("chattButton");
		String boardButton = (String) session.getAttribute("boardButton");
		String comentButton = (String) session.getAttribute("comentButton");
		logger.info("allButton : " + allButton);
		logger.info("chattButton : " + chattButton);
		logger.info("boardButton : " + boardButton);
		logger.info("comentButton : " + comentButton);
		logger.info("selectedValue : " + selectedValue);

		Map<String, Object> result = null;

	
		if ("1".equals(selectedValue)) {
			
			result = service.list3(pagePerNum, page);
		} else if ("2".equals(selectedValue)) {
		
			result = service.list4(pagePerNum, page);
		} else if ("3".equals(selectedValue)) {
			
			result = service.list5(pagePerNum, page);
		} else if ("b".equals(boardButton)) {
			result = service.list6(pagePerNum, page);
		} else if ("ch".equals(chattButton)) {
			result = service.list7(pagePerNum, page);
		} else if ("cm".equals(comentButton)) {
			result = service.list8(pagePerNum, page);
		}else if (selectedValue == null || "0".equals(selectedValue) || "a".equals(allButton)) {
			result = service.list2(pagePerNum, page);
			
		} 
		

		return result;
	}

	@RequestMapping(value = "/sancHistory.go")
	public String sancHistory(@RequestParam("comp_idx") int compIdx,Model model,HttpSession session) {

		logger.info("compIdx : "+compIdx);
		ArrayList<CompDTO> compList = service.CompList(compIdx);
		model.addAttribute("compList",compList);
		logger.info("compList : "+compList);
		
		return "sancHistory";
	}

	@RequestMapping(value = "/proSuc", method = RequestMethod.POST)
	public String processSuccess(@RequestParam("selectedIds") List<String> selectedIds) {
		logger.info("selectedIds : " + selectedIds);

		List<Integer> idList = new ArrayList<>();

		for (String selectedId : selectedIds) {
			// 문자열에서 배열 및 따옴표를 제거하고 int로 변환
			int id = Integer.parseInt(selectedId.replace("[", "").replace("]", "").replace("\"", ""));
			idList.add(id);
		}

		logger.info("Processed selectedIds : " + idList);

		for (int id : idList) {
			service.changeCheck(id);
		}

		return "redirect:/compList.go";
	}
	@RequestMapping(value ="/compSearch")
	@ResponseBody
	public Map<String, Object> search(HttpSession session, @RequestParam String pagePerNum,
	        @RequestParam String page, @RequestParam String searchType, @RequestParam String searchKeyword) {
	    logger.info("페이지당 보여줄 게시글 수: " + pagePerNum);
	    logger.info("보여줄 페이지: " + page);
	    logger.info("검색타입: " + searchType);
	    logger.info("검색내용: " + searchKeyword);
	    
	    
	    return service.search(pagePerNum,page,searchType,searchKeyword);
	}
	
	@RequestMapping(value = "/compDetail")
	public String compDetail(@RequestParam("comp_idx") int compIdx,HttpSession session,Model model) {
                 logger.info("compIdx : "+compIdx);
                 MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo"); 
     		    int memberIdx = memberDTO.getMember_idx();
     		    logger.info("memberIdx : "+memberIdx);
     		    
     		   CompDTO cpd = new CompDTO();
     		    cpd.setComp_idx(compIdx);
     		    cpd.setMember_idx(memberIdx);
     		    
             service.detailList(cpd,model);
           
 
		return "compDetail";
	}
	

	@RequestMapping("/proRegist.do")
	public String proRegist(@RequestParam Map<String, String> params,HttpSession session,@RequestParam(value = "loginLock_sDate", required = false) String loginLock_sDate,
			@RequestParam(value = "loginLock_eDate", required = false) String loginLock_eDate,
			@RequestParam(value = "member_loginLock", required = false) String member_loginLock
			
			
			) {
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo"); 
		    int memberIdx = memberDTO.getMember_idx();
		    logger.info("memberIdx : "+memberIdx);
		    params.put("memberIdx", String.valueOf(memberIdx));
		    
		logger.info("로그인 여부 : " +member_loginLock);
		
		
		logger.info("parmas : "+params);
		if ("Y".equals(member_loginLock)&&loginLock_sDate != null && loginLock_eDate != null) {
	        service.loginLock(params);
	        service.proRegistUpdate(params);
	   
			
	    }else {
	   	service.proRegistUpdate(params);
    }
		
		
		
		
		return "redirect:/compList.go";
	}
	
	@RequestMapping("/backCompList")
	public String backCompList() {
		
		
		
		return "redirect:/compList.go";
	}

}
