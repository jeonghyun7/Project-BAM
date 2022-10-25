package com.bam.controller.admin;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bam.model.Admin;
import com.bam.model.Member;
import com.bam.service.admin.AdminService;
import com.bam.setting.WebTitle;
import com.bam.vo.ChartVo;
import com.bam.vo.TotalResultVo;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("main.bam")
	private String adminMain() {
		if(session.getAttribute("admin") == null) {
			return "redirect:login.bam";
		}
		return "admin/main/admin_main/"+WebTitle.TITLE+"관리자";
	}
	
	@ResponseBody
	@RequestMapping("main.json")
	private TotalResultVo getTotalValues() {
		return adminService.getTotalValuesService();
	}
	
	@ResponseBody
	@PostMapping("today_sales")
	private ChartVo getTodayAndYesterdaySales() {
		ChartVo response = adminService.getTodayAndYesterdaySalesService();
		return response;
	}

	@ResponseBody
	@PostMapping("total_member")
	private TotalResultVo getTotalMember() {
		TotalResultVo response = adminService.getTotalMemberService();
		return response;
	}
	
	@ResponseBody
	@PostMapping("login_members")
	private List<Member> getLoginMembers() {
		return adminService.getLoginMembersService();
	}
	
	//tiles를 거쳐가지 않는 메소드
	@GetMapping("login.bam")
	private String login() {
		return "admin/login/admin_login";
	}
	
	//관리자 로그인
	@PostMapping("login.bam")
	private String login(Admin admin) {
		if(adminService.loginAdminService(admin, session)) {
			return "redirect:main.bam";
		}
		return "redirect:login.bam";
	}
	
	@RequestMapping("logout.bam")
	private String logout() {
		if(session.getAttribute("admin") == null) {
			return "redirect:login.bam";
		}
		session.removeAttribute("admin");
		return "redirect:login.bam";
	}
}