package com.one.mat.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.admin.dao.CompDAO;
import com.one.mat.admin.dto.CompDTO;

@Service
public class CompService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired CompDAO dao;

	public Map<String, Object> list2(String pagePerNum, String page) {
		int ppn = Integer.parseInt(pagePerNum);
		int p = Integer.parseInt(page);		
		int offset = (p-1)*ppn;		
		ArrayList<CompDTO> list2 = dao.list(ppn,offset);
		logger.info("list2 + : "+list2);
		Map<String, Object> map = new HashMap<String, Object>();
		  
		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : "+pages);
		
		if(p>pages) {
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
		int offset = (p-1)*ppn;		
		ArrayList<CompDTO> list2 = dao.list3(ppn,offset);
		logger.info("list2 + : "+list2);
		Map<String, Object> map = new HashMap<String, Object>();
		  
		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : "+pages);
		
		if(p>pages) {
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
		int offset = (p-1)*ppn;		
		ArrayList<CompDTO> list2 = dao.list4(ppn,offset);
		logger.info("list2 + : "+list2);
		Map<String, Object> map = new HashMap<String, Object>();
		  
		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : "+pages);
		
		if(p>pages) {
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
		int offset = (p-1)*ppn;		
		ArrayList<CompDTO> list2 = dao.list5(ppn,offset);
		logger.info("list2 + : "+list2);
		Map<String, Object> map = new HashMap<String, Object>();
		  
		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : "+pages);
		
		if(p>pages) {
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
		int offset = (p-1)*ppn;		
		ArrayList<CompDTO> list2 = dao.list6(ppn,offset);
		logger.info("list2 + : "+list2);
		Map<String, Object> map = new HashMap<String, Object>();
		  
		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : "+pages);
		
		if(p>pages) {
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
		int offset = (p-1)*ppn;		
		ArrayList<CompDTO> list2 = dao.list7(ppn,offset);
		logger.info("list2 + : "+list2);
		Map<String, Object> map = new HashMap<String, Object>();
		  
		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : "+pages);
		
		if(p>pages) {
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
		int offset = (p-1)*ppn;		
		ArrayList<CompDTO> list2 = dao.list8(ppn,offset);
		logger.info("list2 + : "+list2);
		Map<String, Object> map = new HashMap<String, Object>();
		  
		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : "+pages);
		
		if(p>pages) {
			p = pages;
		}		
		map.put("currPage", p);
		
		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", list2);	
		
	
		return map;
	}

	

	

	

}
