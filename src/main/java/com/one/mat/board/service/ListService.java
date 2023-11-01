package com.one.mat.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.one.mat.board.dao.BoardDAO;
import com.one.mat.board.dto.BoardDTO;
import com.one.mat.board.dto.PhotoDTO;


@Service
public class ListService {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired BoardDAO dao;
	
	public Map<String, Object> list(String pagePerNum, String page) {
		
		int ppn = Integer.parseInt(pagePerNum);
		int p = Integer.parseInt(page);		
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자
		// 1:0 -> 2:5 -> 3:10 -> 4:15 -> 5:20
		int offset = (p-1)*ppn;		
		ArrayList<BoardDTO> list = dao.list(ppn,offset);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int pages = dao.totalPage(ppn);
		logger.info("만들수 있는 총 페이지 갯수 : "+pages);
		
		// 만약 현재 보고 있는 페이지가, 총 페이지 수 보다 크면 현재페이지를 총 페이지수로 변경한다.
		if(p>pages) {
			p = pages;
		}		
		map.put("currPage", p);
		
		map.put("pages", pages); // 만들 수 있는 총 페이지 수
		map.put("list", list);		
		return map;
	}

	public String write(Map<String, String> params, MultipartFile[] photos) {
		// 조건 1. 파라메터는 DTO 형태로 넣어야 한다.
		BoardDTO dto = new BoardDTO();
		dto.setBoard_subject(params.get("board_subject"));
		dto.setBoard_content(params.get("board_content"));
		dao.writeBoard(dto);
		// 생성된 PK 가져오기
		int board_id = dto.getBoard_id();
		logger.info("board_id="+board_id);
		String page = "redirect:/board"; // list 에서 변경
		
		if(board_id>0) {
			try {
				saveFile(board_id,photos);
				page = "redirect:/detail?idx="+board_id;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return page;
	}

	private void saveFile(int board_id, MultipartFile[] photos) {
		
		for (MultipartFile photo : photos) {
			
			String photo_fileName = photo.getOriginalFilename();
			logger.info("oriFileName : "+photo_fileName);
			dao.writePhoto(board_id,photo_fileName);
		}
	}

	public void detail(String board_id, Model model) {
		dao.board_bHit(board_id); // 조회수 증가
		BoardDTO board = dao.detail(board_id); // 상세 글 보기
		ArrayList<PhotoDTO> photos = dao.getPhoto(board_id); // 사진
		model.addAttribute("board",board);
		model.addAttribute("photos",photos);
	}

	public void updateForm(String board_id, Model model) {
		BoardDTO board = dao.detail(board_id); // 상세 글 보기
		ArrayList<PhotoDTO> photos = dao.getPhoto(board_id); // 사진
		model.addAttribute("board",board);
		model.addAttribute("photos",photos);
		
	}

	public String update(Map<String, String> params, MultipartFile[] photos) {

		logger.info("params : "+params);
		logger.info("board_id="+params.get("board_id"));
		String page = "redirect:/board";
		dao.update(params);
		// 생성된 PK 가져오기
				
		int board_id = Integer.parseInt(params.get("board_id"));
		
		if(board_id>0) {
			try {
				saveFile(board_id,photos);
				page = "redirect:/detail?board_id="+board_id;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return page;
		
	}

}
