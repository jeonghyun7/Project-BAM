package com.bam.utils;

import javax.servlet.http.HttpSession;

public class PageUtil {
	
	public int getCurrentPageSession(String cpStr, HttpSession session) {
		int currentPage = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				currentPage = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			currentPage = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", currentPage);
		return currentPage;
	}
	
	public int getPageSize(String ps, HttpSession session) {
		int pageSize = 5;
		if(ps == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				pageSize = (Integer)psObj;
			}
		}else {
			ps = ps.trim();
			int psParam = Integer.parseInt(ps);
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					int currentPage = 1;
					session.setAttribute("cp", currentPage);
				}
			}else {
				if(pageSize != psParam) {
					int currentPage = 1;
					session.setAttribute("cp", currentPage);
				}
			}
			pageSize = psParam;
		}
		session.setAttribute("ps", pageSize);
		return pageSize;
	}
}
