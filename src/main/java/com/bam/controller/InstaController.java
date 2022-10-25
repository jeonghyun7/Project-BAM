package com.bam.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bam.service.index.InstaService;


@Controller
@RequestMapping("/insta/*")
public class InstaController {
	
	@Autowired
	private InstaService instaService;
	
	@RequestMapping("getGrid")
	private void instaGrid(HttpServletResponse response) {
		String jsonArray = instaService.getHttpHTML_GET();

		try {
			response.setContentType("application/json; charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.println(jsonArray);
		}catch(IOException ie) {}
	}
	

	

}
