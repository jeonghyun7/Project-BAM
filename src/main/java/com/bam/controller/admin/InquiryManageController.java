package com.bam.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bam.model.Inquiry;
import com.bam.service.inquiryManage.InquiryManageService;
import com.bam.setting.WebTitle;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("admin")
@Log4j
public class InquiryManageController {
	@Autowired
	private InquiryManageService inquiryService;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("inquiry_manage.bam")
	private ModelAndView inquiryManage() {
		ModelAndView response = null;
		if(session.getAttribute("admin") == null) {
			response = new ModelAndView("redirect:login.bam");
			return response;
		}
		response = new ModelAndView("admin/inquiry/inquiry_manage/"+WebTitle.TITLE+"사업자 등록 관리");
		return response;
	}
	
	@GetMapping("inquiry_list")
	private ModelAndView getInquiryList(String currentPage) {
		ModelAndView response = inquiryService.getInquiryListService(currentPage, session);
		response.setViewName("admin/inquiry/inquiry_list");
		return response;
	}
	
	@ResponseBody
	@GetMapping("inquiry_detail")
	private Inquiry getInquiryDetail(int inq_idx){
		return inquiryService.getInquiryDetailService(inq_idx);
	}
	
	@ResponseBody
	@PostMapping("update_inquiry")
	private boolean updateInquiry(int inq_idx, String email) {
		return inquiryService.updateInquiryService(inq_idx, email);
	}
	
	@ResponseBody
	@PostMapping("delete_inquiry")
	private boolean deleteInquiry(int inq_idx) {
		return inquiryService.deleteInquiryService(inq_idx);
	}
	
	@GetMapping("search_inquiry")
	private ModelAndView searchInquiry(String keyword, String category, String currentPage) {
		ModelAndView response = inquiryService.searchInquiryService(keyword, category, currentPage, session);
		response.setViewName("admin/inquiry/inquiry_list");
		return response;
	}
}
