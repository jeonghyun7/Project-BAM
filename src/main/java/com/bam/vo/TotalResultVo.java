package com.bam.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class TotalResultVo {
	private int totalLoginMember;
	private int totalCamp;
	private int totalBooking;
	private int totalInquiry;
	private int totalCurrentBooking;
	private int totalUncheckedInquiry;
	private int totalMember;
	private int totalLeaveMember;
	
	public TotalResultVo(int totalLoginMember, int totalCamp, int totalBooking, int totalInquiry,
			int totalCurrentBooking, int totalUncheckedInquiry) {
		this.totalLoginMember = totalLoginMember;
		this.totalCamp = totalCamp;
		this.totalBooking = totalBooking;
		this.totalInquiry = totalInquiry;
		this.totalCurrentBooking = totalCurrentBooking;
		this.totalUncheckedInquiry = totalUncheckedInquiry;
	}

	public TotalResultVo(int totalMember, int totalLeaveMember) {
		this.totalMember = totalMember;
		this.totalLeaveMember = totalLeaveMember;
	}
}
