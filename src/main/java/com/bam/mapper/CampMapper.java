package com.bam.mapper;

import java.util.List;

import com.bam.model.Camp;
import com.bam.model.CampAndEtc;

public interface CampMapper {
	List<Camp> selectCamp();
	void deleteCamp(long camp_idx);
	List<CampAndEtc> selectCampAndEtc();
	void updateCamp(Camp camp);
}
