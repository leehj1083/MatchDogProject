package com.one.mat.admin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.mat.admin.dao.AuthDAO;
import com.one.mat.admin.dto.AuthDTO;

@Service
public class AuthService {

	Logger logger= LoggerFactory.getLogger(getClass());
	@Autowired AuthDAO dao;
	public ArrayList<AuthDTO> authListDo() {
		return dao.authListDo();
	}
	public HashMap<String, String> authDetailListDo(int subsType_code) {
		logger.info("subsType_code:"+subsType_code);
		HashMap<String, String>authDetail=dao.authDetailListDo(subsType_code);
		logger.info("권한 정보: " + authDetail);
		
		return authDetail;
	}
	public ArrayList<Integer> authCode(int subsType_code) {
		ArrayList<Integer> authCode =dao.authCode(subsType_code);
		logger.info("authCode :"+authCode);
		return authCode;
	}
	public ArrayList<AuthDTO> authCodeListDo() {
		return dao.authCodeListDo();
	}
	public void authDetailModUpdateDo(Map<String, String> params) {
		dao.authDetailModUpdateDo(params);
		
	}
	
	public void authcodeDel(int subsType_code) {
		dao.authcodeDel(subsType_code);
		
	}
	
	public void newAuthCodesSave(int subsType_code, String newAuthcode) {
		logger.info(newAuthcode);
		dao.newAuthCodesSave(subsType_code, newAuthcode);
		
	}
	
}
