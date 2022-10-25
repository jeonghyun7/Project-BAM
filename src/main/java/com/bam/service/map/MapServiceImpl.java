package com.bam.service.map;

import org.springframework.stereotype.Service;

import com.bam.mapper.ReviewMapper;
import com.bam.model.Camp;
import com.bam.model.Img;
import com.bam.model.Review;
import com.bam.model.Sort;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MapServiceImpl implements MapService {
	
	//private CampMapper campMapper;
	private ReviewMapper reviewMapper;

	@Override
	public Camp selectCampByAddress(String address) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Camp selectCampByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Review selectReview(long camp_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Sort selectSort(long camp_idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Img selectThumbnail(long camp_idx) {
		// TODO Auto-generated method stub
		return null;
	}

}
