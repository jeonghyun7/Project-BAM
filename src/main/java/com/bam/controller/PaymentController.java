package com.bam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bam.setting.WebTitle;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("payment")
public class PaymentController {
	
	@RequestMapping("payment.bam")
	private String getPayImformation() {
		
		return "client/booking/booking_confirm/"+WebTitle.TITLE+"예약확인";
	}
}
