package com.bam.service.heart;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.bam.mapper.HeartMapper;
import com.bam.model.Heart;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class HeartServiceImpl implements HeartService {

	private HeartMapper mapper;
	
	public int selectHeartS(int camp_idx) {
		int count = -1;
		count = mapper.selectHeart(camp_idx);
		return count;
	};
	
	
	@Override
	public int selectOwnHeartS(String email, int camp_idx) {
		
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("email", email);
		query.put("camp_idx", camp_idx);
		
		try{
			Heart heart = mapper.selectOwnHeart(query);
			if(heart==null) return 1;
		}catch(Exception e){
			return 0;
		}
		return 0;
	};
	
	public int insertHeartS(String email, int camp_idx) {
		
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("email", email);
		query.put("camp_idx", camp_idx);
		
		try{
			mapper.insertHeart(query);
			return 1;
		}catch(Exception e){
			return 0;
		}
	};
	public int deleteHeartS(String email, int camp_idx) {
		
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("email", email);
		query.put("camp_idx", camp_idx);
		
		try{
			mapper.deleteHeart(query);
			return 1;
		}catch(Exception e){
			return 0;
		}
	}
}
