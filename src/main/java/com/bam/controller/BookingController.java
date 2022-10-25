package com.bam.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bam.model.Booking;
import com.bam.service.booking.BookingService;
import com.bam.setting.WebTitle;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("booking")
public class BookingController {
	
	@Autowired
	BookingService service;
	@Autowired
	HttpSession session;
	
	@RequestMapping("booking.bam")
	private String booking() {
		return "client/booking/booking/"+WebTitle.TITLE+"예약";
	}
	
	@PostMapping("payment.bam")
	private ModelAndView getPayImformation(Booking booking, String udate, long my_point, long remaining_point) {
		
		service.insertBookingAndUpdatePoint(booking, udate, remaining_point, session);
		
		ModelAndView mv = new ModelAndView("client/booking/booking_confirm/"+WebTitle.TITLE+"결제완료");
		mv.addObject("booking",booking);
		mv.addObject("my_point",my_point);
		mv.addObject("remaining_point",remaining_point);
		
		return mv;
	}
	
}
