package com.bam.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bam.service.heart.HeartService;

@Controller
@RequestMapping("heart")
public class HeartController {
	
	@Autowired
	HeartService heartService;
	
	@RequestMapping("insert.bam")
	private void insert(String email, Integer camp_idx, HttpServletResponse httpServletResponse) {
		
		int flag = 0;
		
		if(heartService.selectOwnHeartS(email, camp_idx)*1==1) {
			flag = heartService.insertHeartS(email, camp_idx);
			try{
				httpServletResponse.getWriter().println(flag);
				httpServletResponse.flushBuffer();
			}catch(IOException ie) {
				ie.printStackTrace();
			}
		}else {
			try{
				httpServletResponse.getWriter().println(flag);
				httpServletResponse.flushBuffer();
			}catch(IOException ie) {
				ie.printStackTrace();
			}
		}
	    
	}
	
	@RequestMapping("delete.bam")
	private void delete(String email, Integer camp_idx, HttpServletResponse httpServletResponse) {
		
		int flag = 0;
		
		if(heartService.selectOwnHeartS(email, camp_idx)*1==1) {
			try{
				httpServletResponse.getWriter().println(flag);
				httpServletResponse.flushBuffer();
			}catch(IOException ie) {
				ie.printStackTrace();
			}
		}else {
			flag = heartService.deleteHeartS(email, camp_idx);
			try{
				httpServletResponse.getWriter().println(flag);
				httpServletResponse.flushBuffer();
			}catch(IOException ie) {
				ie.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping("select.bam")
	private void select(Integer camp_idx, HttpServletResponse httpServletResponse) {
		int count = heartService.selectHeartS(camp_idx);
		try{
			httpServletResponse.getWriter().println(count);
			httpServletResponse.flushBuffer();
		}catch(IOException ie) {
			ie.printStackTrace();
		}
	}
}
