package com.bam.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Revenue {
	private String camp_name;
	private int camp_idx;
	private long total_sale;
	private long earning;
	private long profit;
	private float ros;
	private int count_sale;
	private String year;
	private String month;
	private String day;
}
