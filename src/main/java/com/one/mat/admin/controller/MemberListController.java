package com.one.mat.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.mat.admin.service.MemberListService;
import com.one.mat.member.dto.MemberDTO;

@Controller
public class MemberListController {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberListService service;
	
	@RequestMapping(value="/memberList.go")
	public String memberList() {
		return "memberList";
	}
	
	@RequestMapping(value="/memberList.do")
	@ResponseBody
	public HashMap<String, Object> memberList(Model model, HttpSession session) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
		if(dto != null && dto.getSubsType_code()==4) {
			result.put("success", 1);
			ArrayList<MemberDTO> list = service.memberList();
			result.put("list", list);
			result.put("size", list.size());
		}else {
			result.put("success", -1);
		}		
		return result;
	}
	
	
}
