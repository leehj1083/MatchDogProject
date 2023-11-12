package com.one.mat.admin.dao;

import java.sql.Date;
import java.util.ArrayList;

import com.one.mat.admin.dto.VisitorDTO;

public interface DashBoardDAO {	

	int getTotalSubscriber();

	int getMonthlySubscriber(int month);

	int getTotalSales();

	int getMonthlySales(int month);
	
	int getDailySales();

	VisitorDTO selectVisitCount(int member_idx);

	void insertVisitCount(int member_idx);

	void updateVisitCount(int member_idx);

	int getVisitTodayCount();

	int getVisitTotalCount();
	
	ArrayList<VisitorDTO> getWeekCount();
	
	ArrayList<VisitorDTO> getSevenWeekCount();
	

	

	
	
	
}
