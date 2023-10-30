package com.one.mat.member.dao;

import java.util.ArrayList;

import com.one.mat.member.dto.ProfileDTO;

public interface RegProfileDAO {

	void writemyProfile(ProfileDTO dto);

	ArrayList<ProfileDTO> list();

}
