package com.one.mat.board.dao;

import java.util.ArrayList;
import java.util.Map;

import com.one.mat.board.dto.BoardDTO;
import com.one.mat.board.dto.PhotoDTO;

public interface BoardDAO {

	ArrayList<BoardDTO> list(int pagePerNum, int offset);

	int totalPage(int ppn);

	void writeBoard(BoardDTO dto);

	void bHit(String board_id);

	BoardDTO detail(String board_id);

	int del(String board_id);

	void update(Map<String, String> params);

	ArrayList<PhotoDTO> getPhoto(String board_id);

	void writePhoto(int board_id, String photo_fileName);

	void delphoto(int photo_id);

	void upbHit(String board_id);

	ArrayList<BoardDTO> search(int ppn, int offset, String searchType, String searchKeyword);

	int totalPageWithSearch(int ppn, String searchType, String searchKeyword);

	
}
