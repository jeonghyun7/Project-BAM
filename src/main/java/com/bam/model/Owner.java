package com.bam.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Owner {
	private String email;
	private int camp_idx;
	private String name;
	private String owner_num;
	private String com_name;
	private String com_addr;
	private String com_tel;
}
