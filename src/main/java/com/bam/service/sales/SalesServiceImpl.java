package com.bam.service.sales;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bam.mapper.SalesMapper;
import com.bam.model.Revenue;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class SalesServiceImpl implements SalesService {
	
	private SalesMapper mapper;
	
	@Override
	public List<Revenue> selectDailyAllService(String month) {
		List<Revenue> list = mapper.selectDailyAll(month);
		return list;
	}

	@Override
	public List<Revenue> selectMonthlyAllService(String year) {
		List<Revenue> list = mapper.selectMonthlyAll(year);
		return list;
	}

	@Override
	public List<Revenue> selectYearlyAllService() {
		List<Revenue> list = mapper.selectYearlyAll();
		return list;
	}
	
	@Override
	public List<Revenue> selectDailyByCampService(int camp_idx, String month) {
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("camp_idx", camp_idx);
		query.put("month", month);
		List<Revenue> list = mapper.selectDailyByCamp(query);
		return list;
	}

	@Override
	public List<Revenue> selectMonthlyByCampService(int camp_idx, String year) {
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("camp_idx", camp_idx);
		query.put("year", year);
		List<Revenue> list = mapper.selectMonthlyByCamp(query);
		return list;
	}

	@Override
	public List<Revenue> selectYearlyByCampService(int camp_idx) {
		List<Revenue> list = mapper.selectYearlyByCamp(camp_idx);
		return list;
	}


}
