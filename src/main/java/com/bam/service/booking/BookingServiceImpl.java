package com.bam.service.booking;

import java.sql.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bam.mapper.BookingMapper;
import com.bam.mapper.MemberMapper;
import com.bam.model.Booking;
import com.bam.model.Member;
import com.bam.utils.DateUtil;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class BookingServiceImpl implements BookingService {

	BookingMapper mapper;
	MemberMapper memberMapper;
	
	@Transactional
	@Override
	public void insertBookingAndUpdatePoint(Booking booking, String udate, long remaining_point, HttpSession session) {
		DateUtil util = new DateUtil();
		String[] result = util.splitDates(udate, "-");
		String checkInStr = result[0];
		String checkOutStr = result[1];
		Date check_in = util.transformDate(checkInStr);
		Date check_out = util.transformDate(checkOutStr);
		
		booking.setCheck_in(check_in);
		booking.setCheck_out(check_out);
		
		
		String email = booking.getEmail();
		
		HashMap<String, Object> query = new HashMap<String, Object>();
		//long point = PointsAfterPayment(email,booking.getTotal_fee(), remaining_point);
		long save_point = getSavePoint(email,booking.getTotal_fee());
		booking.setSave_point(save_point);
		long point = save_point+remaining_point;
		log.info("#save_point >>>> " +save_point);
		log.info("#Point >>>> " +point);
		
		if(mapper.insertBooking(booking)) {
			mapper.plusTotalBooking(booking.getCamp_idx());
		}
		if(point != -1L) {
			query.put("point", point);
			query.put("email", email);
			boolean flag = mapper.updatePoint(query);
			log.info(">>>>>flag : "+flag);
			if(flag){
				Member member  = (Member)session.getAttribute("member");
				member.setPoint(point);
				session.setAttribute("member", member);
			}
		}
	}
	
	private long getSavePoint(String email, long total_fee) {

		String grade = mapper.selectMemberGrade(email);
		switch (grade) {
			case "SILVER" : return Math.round(total_fee*0.005);
							
			case "GOLD" : return Math.round(total_fee*0.007);
			
			case "DIAMOND" : return Math.round(total_fee*0.01);
			
			default: return -1L;
		}
	}

}
