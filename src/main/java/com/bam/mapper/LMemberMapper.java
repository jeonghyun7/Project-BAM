package com.bam.mapper;

import com.bam.model.LMember;
import com.bam.model.Member;

public interface LMemberMapper {
	void insertLeaveMember(Member leavingMember);
	boolean delete_leave_member(String email);
	LMember select_leave_member(String email);
}
