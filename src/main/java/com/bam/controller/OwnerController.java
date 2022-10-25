package com.bam.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bam.model.CampAndSortAndImg;
import com.bam.model.Inquiry;
import com.bam.model.Member;
import com.bam.model.Sort;
import com.bam.service.owner.OwnerService;
import com.bam.setting.WebTitle;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("owner")
public class OwnerController {
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "com_inquiry.bam", method = RequestMethod.GET)
	private ModelAndView comInquiry() {
		Member member = (Member)session.getAttribute("member");
		if(member == null) {
			return new ModelAndView("redirect:../login/login.bam");
		} else {
			ModelAndView response = new ModelAndView("client/member/com_inquiry/"+WebTitle.TITLE+"사업자 등록 문의");
			int result = ownerService.checkInquiryService(member);
			response.addObject("continue", result);
			return response;
		}
	}
	
	@RequestMapping(value = "add_camp.bam", method = RequestMethod.GET)
	private ModelAndView addListing() {
		ModelAndView response = ownerService.checkOwner(session);
		return response;
	}

	@PostMapping("inquiry.bam")
	private ModelAndView inquiry(Inquiry inquiry) {
		ModelAndView response = ownerService.submitInquiryService(inquiry);
		response.setViewName("client/member/com_inquiry/"+WebTitle.TITLE+"캠핑장 등록");
		return response;
	}
	
	@PostMapping("upload_camp.bam")
	private ModelAndView addCamp(CampAndSortAndImg model) {
		log.info("#> addCamp() 접근"); 
		log.info("#> contextPath : "+session.getServletContext().getContextPath());
		log.info("#> realPath : "+session.getServletContext().getRealPath(""));
		int count = 0;
		for(Sort detail : model.getSort()) {
			count++;
			log.info("#> ("+count+")test name : "+detail);
		}
		for(MultipartFile file : model.getImgDetail()) {
			log.info("#> 상세이미지 : "+file.getOriginalFilename());
		}
		log.info("#> 대표 이미지 : "+model.getImgThumb().getOriginalFilename());
		log.info("#> 캠핑장 데이터 : "+model.getCamp());
		
		ModelAndView response = ownerService.addCampService(model, session);
		return response;
	}
	
	@GetMapping("owner_detail.bam")
	private ModelAndView owner_detail() {
		ModelAndView response = ownerService.get_owner_full_detail(session);
		response.setViewName("client/member/owner_detail");
		return response;
	}
	
	@PostMapping("delete_camp.bam")
	private ModelAndView delete_camp(int camp_idx) {
		log.info("#> camp_delete");
		ModelAndView response = ownerService.delete_camp_service(camp_idx, session);
		response.setViewName("redirect:../member/my_page.bam");
		return response;
	}
	
	@GetMapping("update_camp.bam")
	private ModelAndView update_camp() {
		if(session.getAttribute("member") == null)
			return new ModelAndView("redirect:../");
		ModelAndView response = ownerService.get_owner_full_detail(session);
		response.setViewName("client/member/modify_camp/" + WebTitle.TITLE + "캠핑장 수정");
		return response;	
	}
	
	@PostMapping("update_camp.bam")
	private ModelAndView update_camp(CampAndSortAndImg request) {
		log.info("#> camp : "+request.getCamp());
		log.info("#> sort.size : "+request.getSort().size());
		ModelAndView response = ownerService.update_camp_service(request);
		response.setViewName("client/member/modify_camp/" + WebTitle.TITLE + "캠핑장 수정");
		return response;
	}
	
	@PostMapping("camp_manage")
	private ModelAndView get_booking_info(String currentPage, boolean isMore, boolean isSearch, String category, String keyword) {
		ModelAndView response = ownerService.get_booking_info_service(currentPage, isMore, isSearch, keyword, category);
		response.setViewName("client/member/camp_manage");
		log.info("#>category : "+category);
		log.info("#>keyword : "+keyword);
		log.info("#>currentPage : "+currentPage);
		log.info("#>isSearch : "+isSearch);
		log.info("#>isMore : "+isMore);
		return response;
	}
	
	@ResponseBody
	@PostMapping("change_using_state")
	private boolean change_using_state(@RequestBody String data) throws IOException {
		log.info("call - chang_using_state() : success");
		log.info("#> imp_uid : "+data);
		return ownerService.change_using_state_service(data);
	}
}
