package com.one.mat.member.controller;

import java.util.ArrayList;
import java.util.Arrays;
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

import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.ProfileDTO;
import com.one.mat.member.service.RegProfileService;

@Controller
public class RegProfileController {
	private String p_fileName;
	private int bt_code = -1;
	private int proIdx;
	 private int charType1;
	 private int charType2;
	 private int charType3;
	 private int charType4;
	 private String ph_1;
	 private String ph_2;
	 private String ph_3;
	 private String ph_4;
	 private String ph_5;
	 private String ph_6;
	 private String ph_7;
	 private String ph_8;
	 private String ph_9;
	 
	

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
		
		    MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo"); 
		    int memberIdx = memberDTO.getMember_idx();
		    logger.info("Member Index: " + memberIdx);
		if(ph_1 !=""){service.photos1(ph_1);} 
		if(ph_2 !=""){service.photos2(ph_2);}
		if(ph_3 !=""){service.photos3(ph_3);}
		if(ph_4 !=""){service.photos4(ph_4);}
		if(ph_5 !=""){service.photos5(ph_5);}
		if(ph_6 !=""){service.photos6(ph_6);}
		if(ph_7 !=""){service.photos7(ph_7);}
		if(ph_8 !=""){service.photos8(ph_8);}
		if(ph_9 !=""){service.photos9(ph_9);}
		
		service.proReq(memberDTO);
		
	
		
	

		return "home";
	}
	

   
	@RequestMapping("/regProfile")
	public String Home(Model model, HttpSession session) {
		
		ArrayList<ProfileDTO> list = service.list();
		model.addAttribute("list", list);
		logger.info("list  ="+list);
		
		
		
		ArrayList<ProfileDTO> list2 = service.list2();
		model.addAttribute("list2", list2);
		logger.info("list2 : "+list2);
		
		
		

		return "regProfile";
	}

	@RequestMapping(value = "/profileSave.do")
	public String writemyProfile(@RequestParam Map<String, String> params,Model model, HttpSession session) {
		
		
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
		    
		    MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginInfo"); 
		    int memberIdx = memberDTO.getMember_idx();
		    logger.info("Member Index: " + memberIdx);

		    params.put("memberIdx", String.valueOf(memberIdx));
		    logger.info("params : " + params);
		    
		    String photo1 = params.get("photos");
		    ph_1 = photo1;
		    String photo2 = params.get("photos2");
		    ph_2 = photo2;
		    String photo3 = params.get("photos3");
		    ph_3 = photo3;
		    String photo4 = params.get("photos4");
		    ph_4 = photo4;
		    String photo5 = params.get("photos5");
		    ph_5 = photo5;
		    String photo6 = params.get("photos6");
		    ph_6 = photo6;
		    String photo7 = params.get("photos7");
		    ph_7 = photo7;
		    String photo8 = params.get("photos8");
		    ph_8 = photo8;
		    String photo9 = params.get("photos9");
		    ph_9 = photo9;
		    
		   
		    
		return service.writemyProfile(params);
		
		
		

	}

	@RequestMapping("/compTypeList.do")
	public String compTypeList(Model model) {
		
		ArrayList<ProfileDTO> compList = service.compList();
		model.addAttribute("compList", compList);
		logger.info("compList : "+compList);

		return "comp";
	}

}
