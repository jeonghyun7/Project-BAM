package com.bam.mapper;

import java.util.HashMap;
import java.util.List;

import com.bam.model.CampAndImg;

public interface SearchMapper {
	//rhie
	List<CampAndImg> selectSearchedListOfCamp(HashMap<String, Object> query);
	//rhie
	long selectMinFeeOfCamp(int camp_idx);
	//rhie
	Float selectAverageStar(int camp_idx);
	//rhie
	int selectCheckBookingAvailable(HashMap<String, Object> query);
	//rhie
	long selectCountSearchFinalList(HashMap<String, Object> query);
	//rhie
	List<CampAndImg> selectSearchFinalList(HashMap<String, Object> query);
}
