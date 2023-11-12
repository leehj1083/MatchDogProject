package com.one.mat.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.one.mat.admin.dto.AuthDTO;

public interface AuthDAO {

	ArrayList<AuthDTO> authListDo();

	HashMap<String, String> authDetailListDo(int subsType_code);

	ArrayList<Integer> authCode(int subsType_code);

	ArrayList<AuthDTO> authCodeListDo();

	void authDetailModUpdateDo(Map<String, String> params);
	
	
	// 기존 권한코드 삭제
	void authcodeDel(int subsType_code);
	//새로운 권한 코드 추가
	void newAuthCodesSave(int subsType_code, String newAuthcode);
	
}
