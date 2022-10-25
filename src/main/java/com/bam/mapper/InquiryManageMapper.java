package com.bam.mapper;

import java.util.HashMap;
import java.util.List;

import com.bam.model.Inquiry;

public interface InquiryManageMapper {
	List<Inquiry> selectInquiryAndState(HashMap<String, Object> query); 
	Integer selectCountInquiry();
	Inquiry selectInquiryOne(int inq_idx);
	boolean updateInquiry(int inq_idx);
	boolean insertOwner(Inquiry inquiry);
	boolean deleteInquiry(int inq_idx);
	List<Inquiry> selectInquiryByKeyword(HashMap<String, Object> query);
	Integer selectCountInquiryByKeyword(HashMap<String, Object> query);
	boolean updateInquiredMember(String email);
}
