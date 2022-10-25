package com.bam.service.inquiryManage;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.bam.model.Inquiry;

public interface InquiryManageService {

	ModelAndView getInquiryListService(String cpStr, HttpSession session);
	Inquiry getInquiryDetailService(int inq_idx);
	boolean updateInquiryService(int inq_idx, String email);
	boolean deleteInquiryService(int inq_idx);
	ModelAndView searchInquiryService(String keyword, String category, String cpStr, HttpSession session);
}
