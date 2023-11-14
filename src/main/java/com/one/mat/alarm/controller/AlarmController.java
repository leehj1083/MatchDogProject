package com.one.mat.alarm.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.mat.alarm.service.AlarmService;
import com.one.mat.member.dto.MemberDTO;

@Controller
public class AlarmController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired AlarmService service;
		
	// 매칭 요청시 알람
	// (* 매칭 요청 시 요청자의 닉네임과 요청시간 + 매칭신청에 대한 문구가 알람에 표시된다.  )
	
	// 매칭 수락시 알람
	// (* 내가 매칭 요청을 수락했을 시 매칭 상대방에게 닉네임과 + 매칭되었습니다 문구의 알람이 간다 )
	// 확인하지 않은 알람수 표시
	// (* 알람이 왔을 때 클릭시 해당 페이지로 이동한다 )
	
	// 알람 모달창 요청
	@RequestMapping(value= "/alarmList.go")
	public String alarmListGo(Model model, HttpSession session) {
		logger.info("alarmListGo");
		
		MemberDTO dto = (MemberDTO) session.getAttribute("loginInfo");
			 // 로그인 했을때
	 	    if (dto != null) {
	 	   	int member_idx = dto.getMember_idx();
	 			logger.info("member_idx : "+member_idx);
	 			service.alarmListGo(model, member_idx);
	 			
	 		}
	 	    return "alarm";
		}
}
