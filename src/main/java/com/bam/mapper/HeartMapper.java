package com.bam.mapper;

import java.util.HashMap;
import java.util.List;

import com.bam.model.Heart;
import com.bam.model.HeartAndCampAndImg;


public interface HeartMapper {
	
	int selectHeart(int camp_idx);
	Heart selectOwnHeart(HashMap<String, Object> query);
	void insertHeart(HashMap<String, Object> query);
	void deleteHeart(HashMap<String, Object> query);
	List<HeartAndCampAndImg> select_heart(HashMap<String, Object> query);
	long select_heart_count(HashMap<String, Object> query);
}
