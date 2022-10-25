package com.bam.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookingInfo {
	private String imp_uid;
	private String email;
	private long total_fee;
	private Date bdate;
	private Date check_in;
	private Date check_out;
	private String tel;
	private String memo;
	private int p_num;
	private String review_state;
	private String name;
	private long service_fee;
	private String using_state;
	
	private int camp_idx;
	private String camp_name;
	private int site_num;
	
	private int s_no;
	private String s_name;
	
	private int sort_idx;
	private String sort_name;
	private String site_name;
}
