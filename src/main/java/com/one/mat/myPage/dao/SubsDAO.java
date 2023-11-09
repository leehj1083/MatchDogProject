package com.one.mat.myPage.dao;

public interface SubsDAO {
	
	void plusSubsDo(int idx);
	void plusHistory(int idx, String subsStartTime, String expirationTime);

	void premiumSubsDo(int idx);
	void premiumHistory(int idx, String subsStartTime, String expirationTime);
	
	void myPageSubsDeleteDo(int idx);


	
}
