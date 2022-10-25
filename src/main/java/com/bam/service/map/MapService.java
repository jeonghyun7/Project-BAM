package com.bam.service.map;

import com.bam.model.Camp;
import com.bam.model.Img;
import com.bam.model.Review;
import com.bam.model.Sort;

public interface MapService {
	public Camp selectCampByAddress(String address);
	public Camp selectCampByName(String name);
	public Review selectReview(long camp_idx);
	public Sort selectSort(long camp_idx);
	public Img selectThumbnail(long camp_idx);
}
