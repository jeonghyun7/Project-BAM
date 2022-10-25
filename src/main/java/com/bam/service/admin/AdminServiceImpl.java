package com.bam.service.admin;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.bam.mapper.AdminMapper;
import com.bam.model.Admin;
import com.bam.model.Member;
import com.bam.storage.LoginStorage;
import com.bam.utils.DateUtil;
import com.bam.utils.TimeUtil;
import com.bam.vo.ChartVo;
import com.bam.vo.TotalResultVo;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{
	private AdminMapper adminMapper;
	
	@Override
	public boolean loginAdminService(Admin admin, HttpSession session) {
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("admin", admin);
		
		if(adminMapper.selectAdmin(query) > 0) {
			session.setAttribute("admin", 1);
			return true;
		}
		return false;
	}

	@Override
	public TotalResultVo getTotalValuesService() {
		int totalLoginMember = 0;
		if(LoginStorage.getInstance().getLoginUsers() != null) {
			totalLoginMember = LoginStorage.getInstance().getLoginUsers().size();
		}
		Integer totalCamp = adminMapper.selectCountCamp();
		Integer totalBooking = adminMapper.selectCountBooking();
		Integer totalInquiry = adminMapper.selectCountInquiry();
		Integer totalCurrentBooking = adminMapper.selectCountCurrentBooking();
		Integer totalUncheckedInquiry = adminMapper.selectCountInquiryUnchecked();
		return new TotalResultVo(totalLoginMember, totalCamp, totalBooking, 
				totalInquiry, totalCurrentBooking, totalUncheckedInquiry);
	}

	@Override
	public ChartVo getTodayAndYesterdaySalesService() {
		DateUtil dutil = new DateUtil();
		long todaySales = adminMapper.selectSumTotalFeeOnDate(dutil.getToday());
		long yesterdaySales = adminMapper.selectSumTotalFeeOnDate(dutil.getYesterday());
		return new ChartVo(todaySales, yesterdaySales);
	}

	@Override
	public TotalResultVo getTotalMemberService() {	
		Integer totalMember = adminMapper.selectCountMember();
		Integer totalLeaveMember = adminMapper.selectCountLeaveMember();
		return new TotalResultVo(totalMember, totalLeaveMember);
	}
	
	@Override
	public List<Member> getLoginMembersService(){
		List<Member> loginList = LoginStorage.getInstance().getLoginUsers();
		if(loginList == null) return null;
		TimeUtil timeUtil = new TimeUtil();
		String nowTime = timeUtil.getDateTime();
		for(Member user : loginList) {
			user.setDifferTime(timeUtil.getTimeDiffer(user.getLoginTime(), nowTime));
		}
		return loginList;
	}
}
