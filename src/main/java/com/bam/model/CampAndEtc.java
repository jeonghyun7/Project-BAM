package com.bam.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CampAndEtc {
	//camp table 컬럼
	private int camp_idx;
	private String camp_name;
	private String address;
	private String camp_tel;
	private int total_booking;
	private String intro;
	//img table 컬럼
	private int img_idx;
	private String fname;
	private String ofname;
	private long fsize;
	//review table 컬럼 및 기타
	private float avgStar;
	private int fullStarNum;
	private boolean isHalfStarExist;
	private int emptyStarNum;
	//heart table 찜 횟수 컬럼
	private int countHeart;
	
}
