package com.bam.model;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	private int review_idx;
	private int camp_idx;
	private String email;
	private String nickname;
	private String content;
	private Date wdate;
	private int star;
	//review average 사용한 컬럼
	private float avgStar;
	private int fullStarNum;
	private boolean isHalfStarExist;
	private int emptyStarNum;
	//리뷰 며칠전 띄우기위한 컬럼
	private long diffDays;
}
