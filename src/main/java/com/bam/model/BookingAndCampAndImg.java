package com.bam.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookingAndCampAndImg {
	private String imp_uid;
	private String email;
	private int s_no;
	private long total_fee;
	private Date bdate;
	private Date check_in;
	private Date check_out;
	private String tel;
	private String memo;
	private int p_num;
	private String review_state;
	private String name;
	private long servic_fee;
	private long pay_fee;
	private long use_point;
	private long save_point;
	private String using_state;
	
	private int camp_idx;
	private String camp_name;
	private String address;
	private String camp_tel;
	private int site_num;
	private int full_num;
	private int parking;
	private String conv;
	private String sec_conv;
	private String etc_conv;
	private String agency_tel;
	private String agency_name;
	private int total_booking;
	private String intro;
	private long bbq_fee;
	
	private long img_idx;
	private String fname;
	private String ofname;
	private long fsize;
	private String division;
}
