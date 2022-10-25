package com.bam.mapper;

import java.util.HashMap;
import java.util.List;

import com.bam.model.LMember;
import com.bam.model.Member;
import com.bam.model.MemberAndAuthority;
import com.bam.model.MemberAndOwner;

public interface MemberManageMapper {
	MemberAndOwner selectMemberInfo(String email);
	List<MemberAndAuthority> selectMembers(HashMap<String, Object> query);
	int selectCountMember();
	List<MemberAndAuthority> selectMembersByKeyword(HashMap<String, Object> query);
	int selectCountMembersByKeyword(HashMap<String, Object> query);
	Member selectMember(String email);
	boolean deleteMember(String email);
	
	boolean insertLeaveMember(Member member);
	LMember selectOneLeaveMember(String email);
	int selectCountsLeaveMembers();
	List<LMember> selectLeaveMembers(HashMap<String, Object> query);
	List<LMember> selectLeaveMembersByKeyword(HashMap<String, Object> query);
	int selectCountLeaveMembersByKeyword(HashMap<String, Object> query);
	boolean deleteLeaveMember(String email);
}
