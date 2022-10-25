package com.bam.service.campDetail;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.bam.model.Review;
import com.bam.vo.TouristVo;

public interface CampDetailService{
	ModelAndView selectReviewS(int camp_idx, boolean isMore, HttpSession session, ModelAndView mv, String nextPage);
	ModelAndView campDetail(int camp_idx);
	ModelAndView getTourists(double x, double y);
	HashMap<String, Object> checkDatesService(HashMap<String, Object> request);
}
