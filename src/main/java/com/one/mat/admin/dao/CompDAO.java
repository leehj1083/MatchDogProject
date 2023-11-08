package com.one.mat.admin.dao;

import java.util.ArrayList;

import com.one.mat.admin.dto.CompDTO;
import com.one.mat.board.dto.BoardDTO;

public interface CompDAO {

	ArrayList<CompDTO> list(int ppn, int offset);

	int totalPage(int ppn);

	void changeCheck(int id);

	ArrayList<CompDTO> list3(int ppn, int offset);

	ArrayList<CompDTO> list4(int ppn, int offset);

	ArrayList<CompDTO> list5(int ppn, int offset);

	ArrayList<CompDTO> list6(int ppn, int offset);

	ArrayList<CompDTO> list7(int ppn, int offset);

	ArrayList<CompDTO> list8(int ppn, int offset);

	
	

}
