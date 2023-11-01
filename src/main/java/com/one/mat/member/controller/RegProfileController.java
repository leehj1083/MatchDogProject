package com.one.mat.member.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.ProfileDTO;
import com.one.mat.member.service.RegProfileService;

@Controller
public class RegProfileController {
	private String p_fileName;
	private int bt_code = -1;
	 private int charType1;
	 private int charType2;
	 private int charType3;
	 private int charType4;
	 
	

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	RegProfileService service;
	

	@RequestMapping("/home2")
	public String home2(@RequestParam Map<String, String> params,HttpSession session) {
		Map<String, Integer> charTypeMap = new HashMap<>();
		String[] charTypes = (String[]) session.getAttribute("charTypes");
		 charType1 = Integer.parseInt(charTypes[0]);
	     charType2 = Integer.parseInt(charTypes[1]);
	     charType3 = Integer.parseInt(charTypes[2]);
	     charType4 = Integer.parseInt(charTypes[3]);
		
		logger.info("charType1 : " +charType1);
		logger.info("charType2 : " +charType2);
		logger.info("charType3 : " +charType3);
		logger.info("charType4 : " +charType4);
		logger.info("charTypes : "+Arrays.toString(charTypes));
		logger.info("bt_code = "+bt_code);
		
	
		
		 charTypeMap.put("charType1", Integer.parseInt(charTypes[0]));
		 charTypeMap.put("charType2", Integer.parseInt(charTypes[1]));
		 charTypeMap.put("charType3", Integer.parseInt(charTypes[2]));
		 charTypeMap.put("charType4", Integer.parseInt(charTypes[3]));
		 
		logger.info("charTypeMap : "+charTypeMap);
		
		service.breedTypeSave(bt_code);
		service.charSave(charTypeMap);
	

		return "home";
	}
   
	@RequestMapping("/regProfile")
	public String Home(Model model, HttpSession session) {
		ArrayList<ProfileDTO> list = service.list();
		model.addAttribute("list", list);
		ArrayList<ProfileDTO> list2 = service.list2();
		model.addAttribute("list2", list2);
		
		  MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo"); 
		    int memberIdx = memberDTO.getMember_idx();
		    logger.info("Member Index: " + memberIdx);
		    
		   
		  
		
		
		
		

		return "regProfile";
	}

	@RequestMapping(value = "/profileSave.do")
	public String writemyProfile(@RequestParam Map<String, String> params,Model model, HttpSession session) {
		logger.info("params : " + params);
		
		  String charTypeValues = params.get("charType_code");
		  p_fileName = params.get("photos");
		  logger.info("p_FileName : "+p_fileName);
		  
		   
		    String[] charTypes = charTypeValues.split(",");
		    
		    for (String charType_code : charTypes) {
		       
		        logger.info("CharType value: " + charType_code); 
		    }
		    session.setAttribute("charTypes", charTypes);

		    
		    String breedTypeCode = params.get("breedType_code");
		    bt_code = Integer.parseInt(breedTypeCode);
		    
		 
          
		    
		    
		return service.writemyProfile(params);
		
		
		

	}

	@RequestMapping("/open")
	public String charlist(Model model) {
		ArrayList<ProfileDTO> list = service.list();
		logger.info("list : " + list);
		model.addAttribute("list", list);

		return "list";
	}

}
