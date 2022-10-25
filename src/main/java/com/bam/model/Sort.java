package com.bam.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Sort {
	private long sort_idx;
	private long camp_idx;
	private String sort_name;
	private String site_name;
	private int people_num;
	private int site_fee;
	private String fname;
	private String ofname;
	private MultipartFile site_img;
}
