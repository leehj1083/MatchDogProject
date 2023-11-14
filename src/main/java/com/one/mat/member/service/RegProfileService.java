package com.one.mat.member.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.one.mat.admin.dto.CompDTO;
import com.one.mat.member.dao.RegProfileDAO;
import com.one.mat.member.dto.MemberDTO;
import com.one.mat.member.dto.PhotoDTO;
import com.one.mat.member.dto.ProfileDTO;

@Service
public class RegProfileService {

	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	RegProfileDAO dao;

	public ArrayList<CompDTO> compList() {
		return dao.compList();
	}

	public void chattingcompSave(Map<String, String> params) {

		CompDTO dto = new CompDTO();

		String memberIdxStr = params.get("memberIdx");
		int memberIdx = Integer.parseInt(memberIdxStr);
		dto.setMember_idx(memberIdx);

		String compStr = params.get("compType_code");
		int compType_code = Integer.parseInt(compStr);
		dto.setCompType_code(compType_code);
		
		String reportIdStr =params.get("reportId");
		int reportId = Integer.parseInt(reportIdStr);
		dto.setComp_reportIdx(reportId);
		
		String chattIdStr = params.get("chattId");
		int chattId = Integer.parseInt(chattIdStr);
		dto.setComp_idfNum(chattId);

		dto.setComp_content(params.get("comp_content"));

		dao.chattingcompSave(dto);

	}

	public void compPhoto(String photo) {
		
		dao.compPhoto(photo);
		
	}

	public void boardcompSave(Map<String, String> params) {
		CompDTO dto = new CompDTO();

		String memberIdxStr = params.get("memberIdx");
		int memberIdx = Integer.parseInt(memberIdxStr);
		dto.setMember_idx(memberIdx);
		
		String boardIdStr = params.get("boardId");
		int boardId = Integer.parseInt(boardIdStr);
		dto.setBoard_id(boardId);
	
		
		String compStr = params.get("compType_code");
		int compType_code = Integer.parseInt(compStr);
		dto.setCompType_code(compType_code);

		dto.setComp_content(params.get("comp_content"));
		
		dao.boardcompSave(dto);
		
	}

	public void commentcompSave(Map<String, String> params) {
		
		CompDTO dto = new CompDTO();

		String memberIdxStr = params.get("memberIdx");
		int memberIdx = Integer.parseInt(memberIdxStr);
		dto.setMember_idx(memberIdx);
		
		String replyIdStr = params.get("replyId");
		int replyId = Integer.parseInt(replyIdStr);
		dto.setReply_id(replyId);

		String compStr = params.get("compType_code");
		int compType_code = Integer.parseInt(compStr);
		dto.setCompType_code(compType_code);

		dto.setComp_content(params.get("comp_content"));
		
		dao.commentcompSave(dto);
	}

	public ArrayList<ProfileDTO> charlist() {
		return dao.charlist();
	}
	public void memberDetail(Model model) {
		MemberDTO mms = dao.memberDetail();
		ProfileDTO pps = dao.proDetail();
		model.addAttribute("pps",pps);
		model.addAttribute("mms",mms);
	}
	public ArrayList<PhotoDTO> memberDetailListPhoto() {
		return dao.memberDetailListPhoto();
	}

	public void historySave(int memberIdx) {
		dao.historySave(memberIdx);
	}

	// -------------------------------------------------
	
	
	

	

	

}
