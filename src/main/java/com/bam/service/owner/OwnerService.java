package com.bam.service.owner;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.bam.model.CampAndSortAndImg;
import com.bam.model.Inquiry;
import com.bam.model.Member;

public interface OwnerService {
	ModelAndView submitInquiryService(Inquiry inquiry);
	int checkInquiryService(Member member);
	ModelAndView checkOwner(HttpSession session);
	ModelAndView addCampService(CampAndSortAndImg model, HttpSession session);
	//마이페이지 내 사업자 정보 디테일
	ModelAndView get_owner_full_detail(HttpSession session);
	ModelAndView delete_camp_service(int camp_idx, HttpSession session);
	ModelAndView update_camp_service(CampAndSortAndImg request);

	ModelAndView get_booking_info_service(String cpStr, boolean isMore, boolean isSearch, String keyword, String category);
	boolean change_using_state_service(String data) throws IOException;
}
