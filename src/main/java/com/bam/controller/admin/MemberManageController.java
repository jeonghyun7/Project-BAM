package com.bam.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bam.model.LMember;
import com.bam.model.MemberAndOwner;
import com.bam.service.memberManage.MemberManageService;
import com.bam.setting.WebTitle;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("admin")
public class MemberManageController {
	@Autowired
	private MemberManageService memberService;
	@Autowired
	private HttpSession session;

	//회원 관리( 회원 정보 리스트 )
	@RequestMapping("member_manage.bam")
	private ModelAndView memberManage() {
		ModelAndView response = null;
		if(session.getAttribute("admin") == null) {
			response = new ModelAndView("redirect:login.bam");
			return response;
		}
		response = new ModelAndView("admin/member/member_manage/"+WebTitle.TITLE+"회원 관리");
		return response;
	}
	
	//초기 회원리스트
	@GetMapping("member")
	private ModelAndView getMemberList(String currentPage) {
		ModelAndView response = memberService.getListOfMembersService(currentPage, session);
		response.setViewName("admin/member/member_list");
		return response;
	}
	
	//검색된 회원리스트
	@ResponseBody
	@GetMapping("search_member")
	private ModelAndView searchMember(String keyword, String category, String currentPage) {
		ModelAndView response = memberService.searhMemberService(keyword, category, currentPage, session);
		response.setViewName("admin/member/member_list");
		return response;
	}
	
	//선택된 회원 상세 정보
	@ResponseBody
	@GetMapping("member_datail")
	private MemberAndOwner getMemberInfo(String email) {
		return memberService.getMemberInfoService(email);
	}

	//회원 탈퇴
	@ResponseBody
	@PostMapping("leave_member")
	private boolean leaveMember(String email) {
		log.info("#> email  : "+email);
		return memberService.leaveMemberService(email);
	}

	//탈퇴 회원 관리
	@RequestMapping("leave_member_manage.bam")
	private ModelAndView leaveMemberManage() {
		ModelAndView response = null;
		if(session.getAttribute("admin") == null) {
			response = new ModelAndView("redirect:login.bam");
			return response;
		}
		response = new ModelAndView("admin/member/leave_member_manage/"+WebTitle.TITLE+"회원 관리");
		return response;
	}
	
	//초기 탈퇴 회원 리스트
	@GetMapping("leave_member")
	private ModelAndView getLeaveMemberList(String currentPage) {
		ModelAndView response = memberService.getListOfLeaveMembersService(currentPage, session);
		response.setViewName("admin/member/leave_member_list");
		return response;
	}
	
	//검색된 탈퇴 회원
	@ResponseBody
	@GetMapping("search_leave_member")
	private ModelAndView searchLeaveMember(String keyword, String category, String currentPage) {
		ModelAndView response = memberService.searhLeaveMemberService(keyword, category, currentPage, session);
		response.setViewName("admin/member/leave_member_list");
		return response;
	}

	//선택된 탈퇴회원 상세 정보
	@ResponseBody
	@GetMapping("leave_member_datail")
	private LMember getLeaveMemberInfo(String email) {
		return memberService.getLeaveMemberInfoService(email);
	}

	//선택된 탈퇴회원 삭제
	@ResponseBody
	@PostMapping("delete_leave_member")
	private boolean deleteLeaveMember(String email) {
		return memberService.deleteLeaveMemberService(email);
	}
}
