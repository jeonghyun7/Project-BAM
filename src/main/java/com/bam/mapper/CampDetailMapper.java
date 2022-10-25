package com.bam.mapper;

import java.util.HashMap;
import java.util.List;

import com.bam.model.Camp;
import com.bam.model.Img;
import com.bam.model.Review;
import com.bam.model.Sort;

public interface CampDetailMapper{
	Camp selectCampInfo(int camp_idx);
	List<Sort> selectSort(HashMap<String, Object> query);
	List<Img> selectDetailImg(int camp_idx);
	List<String> selectSortName(int camp_idx);
	int selectTotalBooking(HashMap<String, Object> query);
}
