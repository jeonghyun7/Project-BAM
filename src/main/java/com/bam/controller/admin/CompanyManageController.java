package com.bam.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bam.model.Camp;
import com.bam.service.company.CompanyService;
import com.bam.setting.WebTitle;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("admin")
public class CompanyManageController {
	@Autowired
	HttpSession session;
	
	@Autowired
	CompanyService service;
	
	@RequestMapping("camp_manage.bam")
	private String campManage() {
		if(session.getAttribute("admin") == null) {
			return "redirect:../admin/login.bam";
		}
		return "admin/company/camp_manage/"+WebTitle.TITLE+"캠핑 관리";
	}
	
	@ResponseBody
	@RequestMapping(value="campData.bam", produces = "application/text; charset=UTF-8")
	private String campData() {
		return service.get_campList();
	}
	
	@GetMapping("campDel.bam")
	private String campDelete(Long camp_idx) {
		service.del_campList(camp_idx);
		return "redirect:camp_manage.bam";
	}
	
	@PostMapping("campEdit.bam")
	private String campEdit(Camp camp) {
		service.Edit_campList(camp);
		return "redirect:camp_manage.bam";
	}

}
