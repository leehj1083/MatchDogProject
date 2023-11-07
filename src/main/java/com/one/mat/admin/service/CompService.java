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
		ArrayList<CompDTO> list3 = dao.list3();
		Map<String, Object> map = new HashMap<String, Object>();
		
		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : "+pages);
		
		if(p>pages) {
			p = pages;
		}		
		map.put("currPage", p);
		
		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", list2);	
		map.put("list3",list3);
		return map;
	}

}
