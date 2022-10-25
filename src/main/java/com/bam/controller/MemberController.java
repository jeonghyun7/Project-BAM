package com.bam.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bam.model.Member;
import com.bam.model.Review;
import com.bam.service.member.MemberService;
import com.bam.setting.WebTitle;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "mypage.bam", method = RequestMethod.GET)
	private ModelAndView myPage(String selected) {
		if(session.getAttribute("member") == null) {
			return new ModelAndView("redirect:../login/login.bam"); 
		}
		ModelAndView response = memberService.check_owner_service();
		response.setViewName("client/member/my_page/" + WebTitle.TITLE + "마이페이지");
		response.addObject("selected", selected);
		return response;
	}

	// 회원 탈퇴
	@RequestMapping(value = "leave.bam", method = RequestMethod.POST)
	private String leaveMember(Member member, HttpSession session, HttpServletResponse response) {
		if(session.getAttribute("member") == null) {
			return "redirect:../login/login.bam";
		}
		log.info("#>leaveMember 접근");
		boolean result = memberService.delete_member(member, session, response);
		if (result) {
			session.removeAttribute("member");
		}
		log.info("#>leaveMember result : " + result);
		return "redirect:../";
	}

	// 비밀번호 변경
	@RequestMapping(value = "change_pwd.bam", method = RequestMethod.POST)
							// Member에다가 요청받은 값 바인딩		//@RequestParam은 name속성 값을 가져옴
	private String update_pwd(@ModelAttribute Member member, @RequestParam("old-pwd") String old_pwd,
			HttpSession session, HttpServletResponse response, RedirectAttributes rttr) {
		if(session.getAttribute("member") == null) {
			return "redirect:../login/login.bam";
		}
		session.setAttribute("member", memberService.update_pwd(member, old_pwd, response));
		rttr.addFlashAttribute("msg", "비밀번호 수정 완료");
		return "redirect:mypage.bam";
	}

	// 회원정보 수정
	@RequestMapping(value = "/update_member.bam", method = RequestMethod.POST)
	private String update_member(@ModelAttribute Member member, HttpSession session, RedirectAttributes rttr)
			throws Exception {
		if(session.getAttribute("member") == null) {
			return "redirect:../login/login.bam";
		}
		session.setAttribute("member", memberService.update_member(member));
		rttr.addFlashAttribute("msg", "회원정보 수정 완료");
		return "redirect:mypage.bam";
	}
	
	//예약 내역
	@ResponseBody //ajax할 때 써야 하는 어노테이션 설명 찾아보기
	@RequestMapping(value = "/booking_info.bam", method = RequestMethod.GET)
	private ModelAndView booking_info(String email, Integer nextPage, HttpSession session) {
		log.info("#> 접근");
		log.info("#>nextpage: " + nextPage);
		return memberService.show_booking_info(email, nextPage, session);
	}
	
	//리뷰 작성
	@RequestMapping(value = "/add_review.bam", method = RequestMethod.POST)
	private String add_review(Review review, String imp_uid) {
		log.info("#> review: " + review);
		memberService.add_reivew_service(review, imp_uid, session);
		return "redirect:mypage.bam?selected=booking";
	}
	
	//찜 목록
	@ResponseBody
	@RequestMapping(value = "/heart_list.json", method = RequestMethod.GET)
	private ModelAndView heart_list(String email, Integer nextPage, HttpSession session) {
		return memberService.show_heart_list(email, nextPage, session);
	}
	
	//찜 목록 삭제
	@RequestMapping(value = "/delete_heart.bam", method = RequestMethod.POST)
	private String delete_heart(String email, int camp_idx, HttpSession session) {
		log.info("#> camp_idx : " + camp_idx);
		memberService.delete_heart_list(email, camp_idx);
		return "redirect:mypage.bam?selected=heart";
	}
	
}
