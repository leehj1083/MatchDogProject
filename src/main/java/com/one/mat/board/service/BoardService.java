package com.one.mat.board.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
public class BoardService {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired BoardDAO dao;
	
	private String root = "C:/upload/";
	
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
	//////////////////////////////////////////////////
	public String write(Map<String, String> params, MultipartFile[] photos) {
		// bbs 테이블에 insert 한 글의 idx(auto_increment) 값을 가져오기
		// 조건 1. 파라메터는 DTO 형태로 넣어야 한다.
		BoardDTO dto = new BoardDTO();
	    dto.setBoard_subject(params.get("board_subject"));
	    String memberidxstr = params.get("member_idx"); // "setMember_idx"가 아닌 "member_idx"로 수정
	    int memberidx = Integer.parseInt(memberidxstr);
	    dto.setMember_idx(memberidx);
	    dto.setBoard_content(params.get("board_content"));
	    //logger.info("board_subject: " + dto.getBoard_subject());
	    //logger.info("member_idx: " + dto.getMember_idx());
	    //logger.info("board_content: " + dto.getBoard_content());
	    dao.writeBoard(dto);
	    // 생성된 PK 가져오기
	    //logger.info("dto: " + dto);
	    int board_id = dto.getBoard_id();
	    logger.info("board_id="+board_id);
	    String page = "redirect:/board";
	    
	    if(board_id>0) {
	        try {
	            saveFile(board_id, photos);
	            page = "redirect:/board";
	            // page = "redirect:/detail?board_id="+board_id;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return page;
	}
	
	private void saveFile(int board_id, MultipartFile[] photos) throws Exception {
	    for (MultipartFile photo : photos) {
	        String photo_fileName = photo.getOriginalFilename();
	        logger.info("photo_fileName : " + photo_fileName);
	        if (!photo_fileName.equals("")) {                
	            byte[] arr = photo.getBytes();
	            Path path = Paths.get(root + photo_fileName);
	            Files.write(path, arr);
	            // 3. 파일명과 board_id를 photo 테이블에 추가
	            dao.writePhoto(board_id, photo_fileName); // 1은 photo_type 값으로 변경
	        }
	    }
	}

	public void detail(String board_id, Model model) {
		dao.bHit(board_id); // 조회수 증가
		BoardDTO board = dao.detail(board_id); // 상세 글 보기
		logger.info("DTO형식의 board 값: "+board);
		ArrayList<PhotoDTO> photos = dao.getPhoto(String.valueOf(board.getBoard_id())); // 사진
		logger.info("사진board_id=photos: "+photos);
		model.addAttribute("board",board);
		model.addAttribute("photos",photos);
	}

	public void del(String board_id) {
		logger.info("board_id="+board_id);
		// 1. idx 에 해당하는 photo 가져오기
		// ArrayList<PhotoDTO> photos = dao.getPhoto(board_id);
		// logger.info("지워야할 파일 : "+photos);
		// 2. idx 에 해당하는 글 삭제 -> ON DELETE CASCADE 로 photo 삭제
		int row = dao.del(board_id);
		/*
		if(row>0) {
			// 3. 가져온 photo 의 이름으로 파일 삭제
			for(PhotoDTO dto : photos) {
				File file = new File(root+dto.getNewFileName());
				if(file.exists()) {
					logger.info(dto.getNewFileName()+" 삭제 결과 : "+file.delete());
				}
			}
		}
		*/
	}

	public void updateForm(String board_id, Model model) {
		BoardDTO board = dao.detail(board_id); // 상세 글 보기
		// ArrayList<PhotoDTO> photos = dao.getPhoto(board_id); // 사진
		model.addAttribute("board",board);
		// model.addAttribute("photos",photos);
	}

	public String update(Map<String, String> params, MultipartFile[] photos) {
		
		logger.info("params : "+params);
		logger.info("idx="+params.get("board_id"));
		String page = "redirect:/list";
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
