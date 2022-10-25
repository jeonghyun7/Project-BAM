package com.bam.service.search;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.bam.mapper.SearchMapper;
import com.bam.model.CampAndImg;
import com.bam.utils.DateUtil;
import com.bam.utils.PageUtil;
import com.bam.utils.StarUtil;
import com.bam.vo.Pagination;
import com.bam.vo.SearchResultVo;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
class SearchServiceImpl implements SearchService{
	private SearchMapper searchMapper;
	
	@Override
	public Optional<SearchResultVo> searchCampList(String searchPlace, boolean isMore, String checkIn, String checkOut, HttpSession session, HttpServletRequest request) {
		
		SearchResultVo sv = null;
		Optional<SearchResultVo> maybeSV = Optional.ofNullable(sv);
		
		String cpStr = Integer.toString((Integer)session.getAttribute("cp"));
		
		if(isMore == false) {
			session.removeAttribute("cp");
			session.removeAttribute("ps");
		}
		
		PageUtil pageUtil = new PageUtil();
		int currentPage = pageUtil.getCurrentPageSession(cpStr, session);
		int pageSize = pageUtil.getPageSize("4", session); // 뜨는 캠핑장 갯수 : 4
		
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("search", searchPlace.trim());
		
		//예약 가능 체크 후 reselect
		List<CampAndImg> list = searchMapper.selectSearchedListOfCamp(query);
		List<Integer> exceptList = new ArrayList<Integer>();
		DateUtil dateUtil = new DateUtil();
		for(CampAndImg camp : list) {
			ArrayList<Date> dateRange = dateUtil.getAllDatesInRange(checkIn, checkOut);
			query.put("camp_idx", camp.getCamp_idx());
			int totalSite = camp.getSite_num();
			for(Date date : dateRange) {
				query.put("date", date);
				int bookingCount = searchMapper.selectCheckBookingAvailable(query);
				if(bookingCount >= totalSite) {
					exceptList.add(camp.getCamp_idx());
					break;
				}
			}
		}
		
		if(exceptList.isEmpty()) {
			query.put("exceptList", null);
		} else {
			query.put("exceptList", exceptList);
		}
		
		long listCount = searchMapper.selectCountSearchFinalList(query);
		// 페이징처리 객체
		Pagination page = new Pagination(listCount, currentPage, pageSize);
		query.put("page", page);
		// 얘가 최종 리턴값
		list = searchMapper.selectSearchFinalList(query);
		
		if(list.isEmpty()) {
			return maybeSV;
		}else {
			StarUtil starUtil = new StarUtil();
			for(CampAndImg ci : list) {
				long minFee = searchMapper.selectMinFeeOfCamp(ci.getCamp_idx());
				Float avgStar = searchMapper.selectAverageStar(ci.getCamp_idx());
				if(avgStar == null) avgStar = 0.0f;
				ci.setMin_fee(minFee);
				ci.setAvgStar(avgStar);
				ci.setFullStarNum(starUtil.getFullStarNumber(avgStar));
				ci.setEmptyStarNum(starUtil.getEmptyStarNumber(avgStar));
				ci.setHalfStarExist(starUtil.checkHalfStar(avgStar));
				avgStar = (Math.round(avgStar*10)/10.0f);
				ci.setAvgStar(avgStar);
			}
			sv = new SearchResultVo(list, page);
			maybeSV = Optional.ofNullable(sv);
		}
		return maybeSV;
	}
	
	
}
