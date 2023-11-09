package com.one.mat.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.one.mat.admin.dto.AuthDTO;

public interface AuthDAO {

	ArrayList<AuthDTO> authListDo();

	HashMap<String, String> authDetailListDo(int subsType_code);

	ArrayList<Integer> authCode(int subsType_code);

}
