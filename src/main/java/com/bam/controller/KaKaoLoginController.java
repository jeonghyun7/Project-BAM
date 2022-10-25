package com.bam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class KaKaoLoginController {
	
	@RequestMapping(value="/kakaologin", produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	private String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse httpServlet) {
		log.info("#>code : "+code);
		return null;
	}
	
}
