package com.bam.service.heart;

public interface HeartService {

	public int selectHeartS(int camp_idx);
	public int selectOwnHeartS(String email, int camp_idx);
	public int insertHeartS(String email, int camp_idx);
	public int deleteHeartS(String email, int camp_idx);
}
