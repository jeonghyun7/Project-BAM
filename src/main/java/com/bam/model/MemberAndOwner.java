package com.bam.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberAndOwner {
	private String email;
	private int a_no;
	private String name;
	private String nickname;
	private String pwd;
	private Date birth;
	private long point;
	private String approval_status;
	private String approval_key;
	private String grade;
	private String a_name;
	private long camp_idx;
	private String owner_num;
	private String com_name;
	private String com_addr;
	private String com_tel;
}
