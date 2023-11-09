package com.one.mat.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

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
		logger.info("DAO Result: " + authDetail);
		
		return authDetail;
	}
	public ArrayList<Integer> authCode(int subsType_code) {
		ArrayList<Integer> authCode =dao.authCode(subsType_code);
		logger.info("authCode :"+authCode);
		return authCode;
	}
}
