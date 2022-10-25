package com.bam.service.memberManage;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.bam.mapper.MemberManageMapper;
import com.bam.model.LMember;
import com.bam.model.Member;
import com.bam.model.MemberAndAuthority;
import com.bam.model.MemberAndOwner;
import com.bam.utils.PageUtil;
import com.bam.vo.Pagination;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor	
public class MemberManageServiceImpl implements MemberManageService{
	private MemberManageMapper memberMapper;
	
	@Override
	public MemberAndOwner getMemberInfoService(String email) {
		return memberMapper.selectMemberInfo(email);
	}
	
	@Override
	public ModelAndView getListOfMembersService(String cpStr, HttpSession session) {
		ModelAndView response = new ModelAndView();
		PageUtil pageUtil = new PageUtil();
		
		int currentPage = pageUtil.getCurrentPageSession(cpStr, session);
		int pageSize = pageUtil.getPageSize("10", session);
		int listCount = memberMapper.selectCountMember();
		
		Pagination page = new Pagination(listCount, currentPage, pageSize);
		response.addObject("page", page);
		
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("page", page);
		List<MemberAndAuthority> memberList = memberMapper.selectMembers(query);
		response.addObject("list", memberList);
		
		return response;
	}
	
	@Transactional
	@Override
	public boolean leaveMemberService(String email) {
		Member member = memberMapper.selectMember(email);
		if(member != null) {
			if(memberMapper.insertLeaveMember(member)) {
				if(memberMapper.deleteMember(email))	{
					return true;
				}
			}
			return false;
		}else {
			return false;
		}
	}
	
	@Override
	public ModelAndView searhMemberService(String keyword, String category, String cpStr, HttpSession session) {
		PageUtil pageUtil = new PageUtil();
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("keyword", keyword.trim());
		query.put("category", category.trim());
		int listCount = memberMapper.selectCountMembersByKeyword(query);
		int currentPage = pageUtil.getCurrentPageSession(cpStr, session);
		int pageSize = pageUtil.getPageSize("10", session);
		
		Pagination paging = new Pagination(listCount, currentPage, pageSize);
		query.put("page", paging);
		List<MemberAndAuthority> memberList = memberMapper.selectMembersByKeyword(query);
		
		ModelAndView response = new ModelAndView();
		response.addObject("list", memberList);
		response.addObject("page", paging);
		response.addObject("search", "search");
		return response;
	}
	
	@Override
	public ModelAndView getListOfLeaveMembersService(String cpStr, HttpSession session){
		ModelAndView response = new ModelAndView();
		PageUtil pageUtil = new PageUtil();
		
		int currentPage = pageUtil.getCurrentPageSession(cpStr, session);
		int pageSize = pageUtil.getPageSize("10", session);
		int listCount = memberMapper.selectCountsLeaveMembers();
		
		Pagination page = new Pagination(listCount, currentPage, pageSize);
		response.addObject("page", page);
		
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("page", page);
		List<LMember> memberList = memberMapper.selectLeaveMembers(query);
		response.addObject("list", memberList);
		
		return response;		
	}

	@Override
	public ModelAndView searhLeaveMemberService(String keyword, String category, String cpStr,
			HttpSession session) {
		PageUtil pageUtil = new PageUtil();
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("keyword", keyword.trim());
		query.put("category", category.trim());
		int listCount = memberMapper.selectCountLeaveMembersByKeyword(query);
		int currentPage = pageUtil.getCurrentPageSession(cpStr, session);
		int pageSize = pageUtil.getPageSize("10", session);
		
		Pagination paging = new Pagination(listCount, currentPage, pageSize);
		query.put("page", paging);
		List<LMember> memberList = memberMapper.selectLeaveMembersByKeyword(query);
		
		ModelAndView response = new ModelAndView();
		response.addObject("list", memberList);
		response.addObject("page", paging);
		response.addObject("search", "search");
		return response;
	}

	@Override
	public LMember getLeaveMemberInfoService(String email) {
		return memberMapper.selectOneLeaveMember(email);
	}

	@Override
	public boolean deleteLeaveMemberService(String email) {
		return memberMapper.deleteLeaveMember(email);
	}
}
