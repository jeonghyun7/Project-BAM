package com.bam.service.inquiryManage;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.bam.mapper.InquiryManageMapper;
import com.bam.model.Inquiry;
import com.bam.model.LMember;
import com.bam.utils.PageUtil;
import com.bam.vo.Pagination;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class InquiryManageServiceImpl implements InquiryManageService{
	private InquiryManageMapper inquiryMapper;
	
	@Override
	public ModelAndView getInquiryListService(String cpStr, HttpSession session) {
		ModelAndView response = new ModelAndView();
		PageUtil pageUtil = new PageUtil();
		
		int currentPage = pageUtil.getCurrentPageSession(cpStr, session);
		int pageSize = pageUtil.getPageSize("10", session);
		Integer listCount = inquiryMapper.selectCountInquiry();
		
		if(listCount == null) {
			listCount = 0;
		}
		
		Pagination page = new Pagination(listCount, currentPage, pageSize);
		response.addObject("page", page);
		
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("page", page);
		List<Inquiry> inquiryList = inquiryMapper.selectInquiryAndState(query);
		response.addObject("list", inquiryList);
		
		return response;
	}
	
	@Override
	public Inquiry getInquiryDetailService(int inq_idx){
		return inquiryMapper.selectInquiryOne(inq_idx);
	}
	
	@Transactional
	@Override
	public boolean updateInquiryService(int inq_idx, String email) {
		Inquiry inquiry = inquiryMapper.selectInquiryOne(inq_idx);
		if(inquiryMapper.insertOwner(inquiry)) {
			if(inquiryMapper.updateInquiredMember(email));
			else return false;
			return inquiryMapper.updateInquiry(inq_idx);
		}
		return false;
	}
	
	@Override
	public boolean deleteInquiryService(int inq_idx) {
		return inquiryMapper.deleteInquiry(inq_idx);
	}
	
	@Override
	public ModelAndView searchInquiryService(String keyword, String category, String cpStr, HttpSession session) {
		PageUtil pageUtil = new PageUtil();
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("keyword", keyword.trim());
		query.put("category", category.trim());
		Integer listCount = inquiryMapper.selectCountInquiryByKeyword(query);
		if(listCount == null) {
			listCount = 0;
		}
		int currentPage = pageUtil.getCurrentPageSession(cpStr, session);
		int pageSize = pageUtil.getPageSize("10", session);
		
		Pagination paging = new Pagination(listCount, currentPage, pageSize);
		query.put("page", paging);
		List<Inquiry> inquiryList = inquiryMapper.selectInquiryByKeyword(query);		
		
		ModelAndView response = new ModelAndView();
		response.addObject("list", inquiryList);
		response.addObject("page", paging);
		response.addObject("search", "search");
		return response;
	}
}
