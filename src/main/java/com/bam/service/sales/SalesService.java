package com.bam.service.sales;

import java.util.List;

import com.bam.model.Revenue;

public interface SalesService {
	List<Revenue> selectDailyAllService(String month);
	List<Revenue> selectMonthlyAllService(String year);
	List<Revenue> selectYearlyAllService();
	List<Revenue> selectDailyByCampService(int camp_idx, String month);
	List<Revenue> selectMonthlyByCampService(int camp_idx, String year);
	List<Revenue> selectYearlyByCampService(int camp_idx);
}
