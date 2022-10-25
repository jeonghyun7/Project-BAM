package com.bam.mapper;

import java.util.HashMap;
import java.util.List;

import com.bam.model.Booking;
import com.bam.model.BookingAndCampAndImg;

public interface BookingMapper{
	List<BookingAndCampAndImg> select_booking(HashMap<String, Object> query);
	long select_booking_count(HashMap<String, Object> query);
	boolean update_state(String imp_uid);
	
	
	boolean insertBooking(Booking booking);
	boolean updatePoint(HashMap<String, Object> query);
	String selectMemberGrade(String email);
	boolean updateS_no(String imp_uid);
	Booking selectBookingOne(String imp_uid);
	boolean plusTotalBooking(int camp_idx);
	boolean minusTotalBooking(int camp_idx);
}
