package com.bam.model;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Booking {
	//private String udate;
	private String imp_uid;
	private String email;
	private int camp_idx;
	private int sort_idx;
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
	private long service_fee;
	private String using_state;
	private long pay_fee;
	private long use_point;
	private long save_point;
}
