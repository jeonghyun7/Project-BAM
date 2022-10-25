package com.bam.service.index;


import java.util.List;

import org.springframework.stereotype.Service;

import com.bam.mapper.CampMapper;
import com.bam.model.CampAndEtc;
import com.bam.utils.StarUtil;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BestCampServiceImpl implements BestCampService {
	
	private CampMapper mapper;
	@Override
	public List<CampAndEtc> selectCampAndEtcS() {
		List<CampAndEtc> mvpCampList = mapper.selectCampAndEtc();
		
		//star는 리뷰테이블에 컬럼으로 있징
		if(mvpCampList !=null) {
			StarUtil starUtil = new StarUtil();
			for(CampAndEtc cae : mvpCampList) {
				Float avgStar = cae.getAvgStar();
				avgStar = (Math.round(avgStar*10)/10.0f);
				cae.setAvgStar(avgStar);
				cae.setFullStarNum(starUtil.getFullStarNumber(avgStar));
				cae.setEmptyStarNum(starUtil.getEmptyStarNumber(avgStar));
				cae.setHalfStarExist(starUtil.checkHalfStar(avgStar));
			}
		}
		
		return mvpCampList;
	}

}
