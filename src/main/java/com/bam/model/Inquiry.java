package com.bam.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Inquiry {
	private int inq_idx;
	private String email;
	private int s_no;
	private String title;
	private String owner_num;
	private String content;
	private Date wdate;
	private String com_name;
	private String com_addr;
	private String com_tel;
	private String s_name;
	private String name;
	private String nickname;
}
