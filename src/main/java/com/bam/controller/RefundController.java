package com.bam.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bam.model.Booking;
import com.bam.service.refund.RefundService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("refund")
public class RefundController {
	@Autowired
	RefundService service;
	
	@ResponseBody
	@PostMapping("refundableDate")
	public String[] getDate(String check_in) {
		
		log.info(">>>check_in : "+check_in);
		String[] refundableDate = service.getRefundableDate(check_in);
		
		return refundableDate;
	}
	
	@ResponseBody
	@PostMapping("refund")
	public boolean cancelPay(String imp_uid, long point, long use_point, long save_point, String email, HttpSession session) {
		
		String token = service.getImportToken();
		
		boolean flag = service.updateBooking(imp_uid, point, use_point, save_point, email, session);
		if(flag) {
			service.cancelPayment(token, imp_uid);
		}else {
			log.info(">>>flag1 : "+flag);
		}
		log.info(">>>flag2 : "+flag);
		return flag;
	}
	
}
