package com.one.mat.myPage.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.ProfileDTO;
import com.one.mat.myPage.service.MyProfileService;


@Controller
public class MyProfileController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyProfileService service;


	
	//리스트 불러오기
	@RequestMapping(value = "/myProfileList.do")
	public String myProfileListDo(Model model, HttpSession session) {
		logger.info("프로필 list 요청 받음");
		String page = "login";
		String msg = "로그인이 필요한 서비스입니다.";
		if (session.getAttribute("loginInfo") != null) { // 로그인 했을 경우만 내용을 실행
			page = "myProfile";
			msg = "";
			MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			int idx = dto.getMember_idx();
			logger.info("idx="+idx);
			service.MyProfileListDo(idx, model);
		}
		model.addAttribute("msg", msg);
		return page;
	}
	
	@RequestMapping(value = "/myProfileMod.go")
	public String myProfileModGo(Model model, HttpSession session, @RequestParam int pro_idx) {
		String page = "login";
		logger.info("pro_idx"+pro_idx);
		if (session.getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		} else {
			service.MyProfileModList(pro_idx, model);
			ArrayList<ProfileDTO> charTypeList=service.charTypeList();
			ArrayList<ProfileDTO> breedTypeList=service.breedTypeList();
			logger.info("charTypeList:"+charTypeList);
			logger.info("breedTypeList:"+breedTypeList);
			model.addAttribute("charTypeList", charTypeList);
			model.addAttribute("breedTypeList", breedTypeList);
				
			
			page = "myProfileMod";
		}

		return page;
	}
	
	@RequestMapping(value = "/myProfileModUpdate.do")
	public String myProfileModUpdateDo(Model model, HttpSession session,
			@RequestParam Map<String, String> params,
			@RequestParam(value = "selectedCharTypesCode", required = false) String selectedCharTypesCode
			) {
		int pro_idx = Integer.parseInt(params.get("pro_idx"));
		String pro_dogName = params.get("pro_dogName");
		int breedType_code = Integer.parseInt(params.get("breedType_code"));
		int pro_dogAge = Integer.parseInt(params.get("pro_dogAge"));
		String pro_dogGender = params.get("pro_dogGender");
		String pro_dogDesc = params.get("pro_dogDesc");
		logger.info("pro_idx:"+pro_idx);
		logger.info(pro_dogName);
		logger.info("breedType_code:"+breedType_code);
		logger.info("pro_dogAge : "+pro_dogAge);
		logger.info(pro_dogGender);
		logger.info("pro_dogDesc:"+pro_dogDesc);
		logger.info("selectedCharTypesCode:"+selectedCharTypesCode);
		String[] charTypeCodes = selectedCharTypesCode.split(",");
		logger.info("charTypeCodes:"+charTypeCodes);
		int charType1 = 0;	
	    int charType2 = 0;	    
	    int charType3 = 0;    
	    int charType4 = 0;
	      
	    if (charTypeCodes.length >= 1) {
	        charType1 = Integer.parseInt(charTypeCodes[0]);
	    }

	    if (charTypeCodes.length >= 2) {
	        charType2 = Integer.parseInt(charTypeCodes[1]);
	    }

	    if (charTypeCodes.length >= 3) {
	        charType3 = Integer.parseInt(charTypeCodes[2]);
	    }

	    if (charTypeCodes.length >= 4) {
	        charType4 = Integer.parseInt(charTypeCodes[3]);
	    }
	    logger.info("charType1:"+charType1);
	    logger.info("charType2:"+charType2);
	    logger.info("charType3:"+charType3);
	    logger.info("charType4:"+charType4);
	    
	    String page = "login";

		
		
		if (session.getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		} else {
			/* service.MyProfileModList(pro_idx, model); */

			service.myProfileModUpdateDo(params);
			service.charTypeSave(pro_idx, charType1, charType2, charType3, charType4);

			page = "redirect:/myProfileList.do";
		}

		return page;
	}
	
/*
	@RequestMapping(value= "char.go")
	public String charGo(Model model, HttpSession session, String pro_idx) {
		if (session.getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
		} else {
			ArrayList<ProfileDTO> charTypeList=service.charTypeList();
			model.addAttribute("charTypeList", charTypeList);
		}
		return "char";
	}
	
*/

	
	
@RequestMapping(value="/myProfileOpen.do")
@ResponseBody
public HashMap<String, Object> myProfileOpenDo(HttpSession session,
		@RequestParam int openType_code, @RequestParam String toggleValue,
		@RequestParam int pro_idx){
	HashMap<String, Object> result = new HashMap<String, Object>();
	logger.info("pro_idx:"+pro_idx);
	logger.info("openType_code:"+openType_code);
	logger.info(toggleValue);
	
	if(session.getAttribute("loginInfo") == null) {
		result.put("login", false);
	}else {
		result.put("login", true);
		service.myProfileOpenDo(pro_idx, openType_code, toggleValue);

	}
	
	return result;
}


@RequestMapping(value="/myProfileRep.do")
@ResponseBody
public HashMap<String, Object> myProfileRepDo(HttpSession session,
		@RequestParam int pro_idx){
	HashMap<String, Object> result = new HashMap<String, Object>();
	logger.info("pro_idx:"+pro_idx);
	
	if(session.getAttribute("loginInfo") == null) {
		result.put("login", false);
	}else {
		result.put("login", true);
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		int idx = dto.getMember_idx();
		logger.info("idx="+idx);
		service.myProfileRepDo(pro_idx, idx);

	}
	
	return result;
}

	


	

	@RequestMapping(value="myProfileDel.do")
	@ResponseBody
	public HashMap<String, Object> myProfileDelDo(HttpSession session,
			@RequestParam int pro_idx){
		HashMap<String, Object> result = new HashMap<String, Object>();
		logger.info("pro_idx:"+pro_idx);
		
		if(session.getAttribute("loginInfo") == null) {
			result.put("login", false);
		}else {
			result.put("login", true);
			service.myProfileDelDo(pro_idx);

		}
		
		return result;
	}

	
	
	
	
}