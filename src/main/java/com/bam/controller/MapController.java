package com.bam.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("result")
public class MapController {
	
	@RequestMapping("map.bam")
	public String list(){
		return "client/result/map";
	}

	@RequestMapping("search02")
	public String listSearch(){
		return "client/result/mapList";
	}

}
