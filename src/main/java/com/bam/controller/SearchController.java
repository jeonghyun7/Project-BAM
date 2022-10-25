package com.bam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bam.service.search.SearchService;
import com.bam.vo.SearchResultVo;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("search")
public class SearchController {
	@Autowired 
	private SearchService searchService;
	
	@GetMapping("search.bam")
	private ModelAndView search(String searchPlace, String checkIn, String checkOut, String peopleNum, HttpSession session, HttpServletRequest request) {
		ModelAndView response = new ModelAndView("client/result/map");
		
		session.setAttribute("cp", 1);
		try {
			SearchResultVo result = searchService.searchCampList(searchPlace, false, checkIn, checkOut, session, request).get();
			response.addObject("vo", result);
			response.addObject("checkIn", checkIn);
			response.addObject("checkOut", checkOut);		
			response.addObject("peopleNum", peopleNum);		
			response.addObject("searchPlace", searchPlace);
			log.info("#> error:" + result.getList().size());
		}catch(Exception e) {
			e.getStackTrace();
		}
		
		return response;
	}
	
	@PostMapping("loadMore.bam")
	private ModelAndView loadMore(String searchPlace, HttpSession session, HttpServletRequest request, String checkIn, String checkOut) {
		ModelAndView response = null;
		int cp = Integer.parseInt(session.getAttribute("cp").toString()); 
		cp = cp + 1;
		session.setAttribute("cp", cp);
		try {
			SearchResultVo result = searchService.searchCampList(searchPlace, true, checkIn, checkOut, session, request).get();
			response = new ModelAndView("client/result/mapList");
			if(result!=null) response.addObject("vo", result);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return response;
	}
}

