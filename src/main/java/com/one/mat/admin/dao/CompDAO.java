package com.one.mat.admin.dao;

import java.util.ArrayList;

import com.one.mat.admin.dto.CompDTO;
import com.one.mat.board.dto.BoardDTO;

public interface CompDAO {

	ArrayList<CompDTO> list(int ppn, int offset);

	int totalPage(int ppn);

	ArrayList<CompDTO> list3();

}
