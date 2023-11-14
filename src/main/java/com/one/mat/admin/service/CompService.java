package com.one.mat.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.one.mat.admin.dao.CompDAO;
import com.one.mat.admin.dto.CompDTO;
import com.one.mat.board.dto.BoardDTO;
import com.one.mat.member.dto.ProfileDTO;

@Service
public class CompService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired
	CompDAO dao;

	public Map<String, Object> list2(String pagePerNum, String page) {
		int ppn = Integer.parseInt(pagePerNum);
		int p = Integer.parseInt(page);
		int offset = (p - 1) * ppn;
		ArrayList<CompDTO> list2 = dao.list(ppn, offset);
		logger.info("list2 + : " + list2);
		Map<String, Object> map = new HashMap<String, Object>();

		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : " + pages);

		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);

		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", list2);

		return map;
	}

	public void changeCheck(int id) {
		dao.changeCheck(id);

	}

	public Map<String, Object> list3(String pagePerNum, String page) {
		int ppn = Integer.parseInt(pagePerNum);
		int p = Integer.parseInt(page);
		int offset = (p - 1) * ppn;
		ArrayList<CompDTO> list2 = dao.list3(ppn, offset);
		logger.info("list2 + : " + list2);
		Map<String, Object> map = new HashMap<String, Object>();

		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : " + pages);

		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);

		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", list2);

		return map;
	}

	public Map<String, Object> list4(String pagePerNum, String page) {
		int ppn = Integer.parseInt(pagePerNum);
		int p = Integer.parseInt(page);
		int offset = (p - 1) * ppn;
		ArrayList<CompDTO> list2 = dao.list4(ppn, offset);
		logger.info("list2 + : " + list2);
		Map<String, Object> map = new HashMap<String, Object>();

		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : " + pages);

		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);

		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", list2);

		return map;
	}

	public Map<String, Object> list5(String pagePerNum, String page) {
		int ppn = Integer.parseInt(pagePerNum);
		int p = Integer.parseInt(page);
		int offset = (p - 1) * ppn;
		ArrayList<CompDTO> list2 = dao.list5(ppn, offset);
		logger.info("list2 + : " + list2);
		Map<String, Object> map = new HashMap<String, Object>();

		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : " + pages);

		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);

		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", list2);

		return map;
	}

	public Map<String, Object> list6(String pagePerNum, String page) {
		int ppn = Integer.parseInt(pagePerNum);
		int p = Integer.parseInt(page);
		int offset = (p - 1) * ppn;
		ArrayList<CompDTO> list2 = dao.list6(ppn, offset);
		logger.info("list2 + : " + list2);
		Map<String, Object> map = new HashMap<String, Object>();

		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : " + pages);

		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);

		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", list2);

		return map;
	}

	public Map<String, Object> list7(String pagePerNum, String page) {
		int ppn = Integer.parseInt(pagePerNum);
		int p = Integer.parseInt(page);
		int offset = (p - 1) * ppn;
		ArrayList<CompDTO> list2 = dao.list7(ppn, offset);
		logger.info("list2 + : " + list2);
		Map<String, Object> map = new HashMap<String, Object>();

		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : " + pages);

		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);

		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", list2);

		return map;
	}

	public Map<String, Object> list8(String pagePerNum, String page) {
		int ppn = Integer.parseInt(pagePerNum);
		int p = Integer.parseInt(page);
		int offset = (p - 1) * ppn;
		ArrayList<CompDTO> list2 = dao.list8(ppn, offset);
		logger.info("list2 + : " + list2);
		Map<String, Object> map = new HashMap<String, Object>();

		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : " + pages);

		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);

		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", list2);

		return map;
	}

	public Map<String, Object> search(String pagePerNum, String page, String searchType, String searchKeyword) {
		int ppn = Integer.parseInt(pagePerNum);
		int p = Integer.parseInt(page);
		int offset = (p - 1) * ppn;
		ArrayList<BoardDTO> list2 = dao.search(ppn, offset, searchType, searchKeyword);
		logger.info("search의 list: " + list2.toString());
		Map<String, Object> map = new HashMap<String, Object>();

		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : " + pages);
		if (p > pages) {
			p = pages;
		}
		map.put("currPage", p);
		map.put("pages", pages);
		map.put("list", list2);
		return map;
	}

	public void detailList(CompDTO compDTO, Model model) {

		CompDTO cpd = dao.detailList(compDTO);
		String mem = dao.getMemberIdByCompId(compDTO.getComp_idx());
		String pem = dao.reMemerIdByCompId(compDTO.getComp_idx());
		CompDTO his = dao.compHistoryrec(compDTO);

		model.addAttribute("his", his);
		model.addAttribute("mem", mem);
		model.addAttribute("cpd", cpd);
		model.addAttribute("pem", pem);
	}

	public void loginLock(Map<String, String> params) {
		CompDTO dto = new CompDTO();
		dto.setLoginLock_sDate(params.get("loginLock_sDate"));
		dto.setLoginLock_eDate(params.get("loginLock_eDate"));

		String comp_idxstr = params.get("comp_idx");
		int comp_idx = Integer.parseInt(comp_idxstr);
		dto.setComp_idx(comp_idx);

		dao.loginLock(dto);

	}

	public void proRegistUpdate(Map<String, String> params) {
		CompDTO dto = new CompDTO();
		dto.setComp_handleState(params.get("comp_handleState"));
		dto.setComp_blindStete(params.get("comp_blindStete"));
		dto.setMember_loginLock(params.get("member_loginLock"));
		dto.setComp_handleContent(params.get("comp_handleContent"));

		String comp_idxstr = params.get("comp_idx");
		int comp_idx = Integer.parseInt(comp_idxstr);
		dto.setComp_idx(comp_idx);

		String admin_memberIdxstr = params.get("memberIdx");
		int admin_memberIdx = Integer.parseInt(admin_memberIdxstr);
		dto.setAdmin_memberIdx(admin_memberIdx);
		
		

		logger.info("dto : " + dto);

		dao.proRegistUpdate(dto);
	}

	public ArrayList<CompDTO> CompList(int compIdx) {
		
		
		
		return dao.CompList(compIdx);
	}



}
