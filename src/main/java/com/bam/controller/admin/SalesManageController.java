package com.bam.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bam.service.sales.SalesService;
import com.bam.setting.WebTitle;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("admin")
public class SalesManageController {
	@Autowired
	HttpSession session;
	@Autowired
	SalesService service;
	
	@RequestMapping("sales_camp_daily.bam")
	private String salesChartD() {
		if(session.getAttribute("admin") == null) {
			return "redirect:login.bam";
		}
		return "admin/sales/chart_daily/"+WebTitle.TITLE+"매출 통계";
	}
	
	@RequestMapping("sales_camp_monthly.bam")
	private String salesChartM() {
		if(session.getAttribute("admin") == null) {
			return "redirect:login.bam";
		}
		return "admin/sales/chart_monthly/"+WebTitle.TITLE+"매출 통계";
	}
	@RequestMapping("sales_camp_yearly.bam")
	private String salesChartY() {
		if(session.getAttribute("admin") == null) {
			return "redirect:login.bam";
		}
		return "admin/sales/chart_yearly/"+WebTitle.TITLE+"매출 통계";
	}
	
	@RequestMapping("sales_bam_monthly.bam")
	private String salesChartMWC() {
		if(session.getAttribute("admin") == null) {
			return "redirect:login.bam";
		}
		return "admin/sales/chart_monthly_bam/"+WebTitle.TITLE+"매출 통계";
	}

	@RequestMapping("sales_bam_daily.bam")
	private String salesChartMWD() {
		if(session.getAttribute("admin") == null) {
			return "redirect:login.bam";
		}
		return "admin/sales/chart_daily_bam/"+WebTitle.TITLE+"매출 통계";
	}
	
	@RequestMapping("sales_bam_yearly.bam")
	private String salesChartYWC() {
		if(session.getAttribute("admin") == null) {
			return "redirect:login.bam";
		}
		return "admin/sales/chart_yearly_bam/"+WebTitle.TITLE+"매출 통계";
	}
	
	@ResponseBody
	@RequestMapping(value="sales_data_bam_d.bam", method=RequestMethod.GET, produces="application/json")
	private List<?> salesDataAllD(String month) {
		return service.selectDailyAllService(month);
	}
	
	@ResponseBody
	@RequestMapping(value="sales_data_bam_m.bam", method=RequestMethod.GET, produces="application/json")
	private List<?> salesDataAllM(String year) {
		return service.selectMonthlyAllService(year);
	}
	@ResponseBody
	@RequestMapping(value="sales_data_bam_y.bam", method=RequestMethod.GET, produces="application/json")
	private List<?> salesDataAllY() {
		return service.selectYearlyAllService();
	}
	
	@ResponseBody
	@RequestMapping(value="sales_data_each_d.bam", method=RequestMethod.GET, produces="application/json")
	private List<?> salesDataCampD(Integer camp_idx, String month) {
		return service.selectDailyByCampService(camp_idx, month);
	}
	
	@ResponseBody
	@RequestMapping(value="sales_data_each_m.bam", method=RequestMethod.GET, produces="application/json")
	private List<?> salesDataCampM(Integer camp_idx, String year) {
		return service.selectMonthlyByCampService(camp_idx, year);
	}
	
	@ResponseBody
	@RequestMapping(value="sales_data_each_y.bam", method=RequestMethod.GET, produces="application/json")
	private List<?> salesDataCampY(Integer camp_idx) {
		return service.selectYearlyByCampService(camp_idx);
	}

}
