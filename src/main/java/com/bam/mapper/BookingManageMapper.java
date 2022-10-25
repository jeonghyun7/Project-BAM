package com.bam.mapper;

import java.util.HashMap;
import java.util.List;

import com.bam.model.BookingInfo;
import com.bam.model.Camp;

public interface BookingManageMapper {
	long select_count_booking_list(HashMap<String, Object> query);
	List<BookingInfo> select_booking_list(HashMap<String, Object> query);
	int select_count_using_state(HashMap<String, Object> query);
	boolean update_using_state(HashMap<String, Object> query);
	Camp select_owner_camp(String email);
}
