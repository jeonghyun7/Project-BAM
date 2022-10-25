package com.bam.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bam.auth.SnsLogin;
import com.bam.auth.SnsValue;
import com.bam.model.Member;
import com.bam.service.member.MemberService;
import com.bam.service.naver.NaverService;
import com.bam.setting.WebTitle;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("login")
public class LogInController {
    
	@Autowired
	private MemberService service;
	@Autowired
	private NaverService naverService;
	@Autowired
	private HttpSession session;
	@Autowired
	private ServletContext servletContext;
	
	// 로그인 폼으로 이동
	@RequestMapping(value = "login.bam", method = RequestMethod.GET)
	private String login(Model model, boolean relogin) {
		log.info("#> call - login() ");
		if(relogin) session.removeAttribute("member");
		SnsLogin snsLogin = new SnsLogin(new SnsValue("naver"));
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		return "client/member/login/" + WebTitle.TITLE + "로그인";
	}
	
	// 로그인 기능 구현
	@RequestMapping(value = "login_user.bam", method = RequestMethod.POST)
	private String login(@ModelAttribute Member member, HttpServletResponse response)
			throws Exception {
		service.login(member, response, servletContext);
		return "redirect:../";
	}
	
	//Naver Login 성공시 callback호출 메소드
	@RequestMapping("{snsService}/callback")
	private String naverLogin(@PathVariable String snsService, Model model, @RequestParam String code) throws Exception {
		log.info("#> call - snsLoginCallback : "+snsService);
		// 1. code를 이용해서 AccessToken을 받아야 해요 ^^
		// 2. AccessToken을 이용해서 사용자 프로필 정보 가져와야 해요 ^^
		naverService.naverLogin(snsService, code, session, model);
		
		// 3. DB에서 해당 유저가 존재하는지..? CHECK ^^;;
			// - 1. SELECT 해서 중복되는 email이 존재하지 않으면 강제 회원가입(디비에 인설트) + 강제 로그인
			
		// 4. 존재 시 강제 로그인, 존재 안 할 시 가입 페이지로 ^^;;
		return "redirect:../../";
	}
	
	@RequestMapping("logout_naver")
	private String logoutNaver(String accessToken) throws IOException {
		naverService.naverLogout(session, accessToken);
		return "redirect:login.bam";
	}
	
	//로그아웃 기능 구현
	@RequestMapping(value = "/logout.bam", method = RequestMethod.GET)
	private String logout(HttpServletResponse response) throws Exception {
		service.logout(response, session);
		return "redirect:../";
	}
	
	//비밀번호 찾기 기능 구현
	@RequestMapping(value = "/find_pwd.bam", method = RequestMethod.POST)
	private void find_pwd(@ModelAttribute Member member, HttpServletResponse response) throws Exception {
		service.find_pwd(response, member);
	}

}
