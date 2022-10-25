package com.bam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bam.model.Member;
import com.bam.service.member.MemberService;
import com.bam.setting.WebTitle;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("sign_up") // Class level
// Class level => 모든 메서드에 적용되는 경우 
// "/sign_up"으로 들어오는 모든 요청에 대한 처리를 해당 클래스에서 한다는 것을 의미한다.
public class SignUpController {
	@Autowired
	MemberService service;

	// 회원가입 페이지로 이동시켜 줄 signUpPage
	@RequestMapping(value = "sign_up_page.bam") // Handler level
	// Handler level => 요청 url에 대해 해당 메서드에서 처리해야 되는 경우
	// “/sign_up/sign_up_page.bam” 요청에 대한 처리를 signUpPage()에서 한다는 것을 의미한다.
	public String signUpPage() {

		return "client/member/sign_up/" + WebTitle.TITLE + "회원가입";
	}

	// 실제 회원가입 처리를 해 줄 signUp
	@RequestMapping(value = "sign_up.bam", method = RequestMethod.POST)
	// value: 해당 url로 요청이 들어오면 이 메서드가 수행된다.
	// method: 요청 method를 명시한다. 없으면 모든 http method 형식에 대해 수행된다.
	private String signUp(@ModelAttribute Member member, RedirectAttributes rttr, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		log.info(">>>>>member"+ member.getEmail());
		String email = request.getParameter("realemail");
		member.setEmail(email);
		String grade = "silver";
		member.setGrade(grade);
		rttr.addFlashAttribute("result", service.signUp(member, response));
		return "redirect:../login/login.bam";
	}

	// produces는 ajax가 데이터 넘겨받을 때 깨짐 방지
	// 이메일 중복 체크
	@RequestMapping(value = "email_check.bam", method = RequestMethod.POST)
	public void emailCheck(@RequestParam(value="realemail", required=false) String email, HttpServletResponse response) throws Exception {
		service.emailCheck(email, response);
	}
	
	// 회원 인증 
	@RequestMapping(value = "/approval_member.bam", method = RequestMethod.POST)
	public void approval_member(@ModelAttribute Member member, HttpServletResponse response) throws Exception {
		service.approval_member(member, response);
	}

}