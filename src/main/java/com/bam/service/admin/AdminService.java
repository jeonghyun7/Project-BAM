package com.bam.service.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.bam.model.Admin;
import com.bam.model.Member;
import com.bam.vo.ChartVo;
import com.bam.vo.TotalResultVo;

public interface AdminService {
	TotalResultVo getTotalValuesService();
	boolean loginAdminService(Admin admin, HttpSession session);
	ChartVo getTodayAndYesterdaySalesService();
	TotalResultVo getTotalMemberService();
	List<Member> getLoginMembersService();
}
