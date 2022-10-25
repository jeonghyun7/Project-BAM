package com.bam.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Img {
	private int img_idx;
	private int camp_idx;
	private String fname;
	private String ofname;
	private long fsize;
	private String division;
}
