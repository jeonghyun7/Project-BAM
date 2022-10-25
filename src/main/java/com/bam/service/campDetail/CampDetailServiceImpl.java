package com.bam.service.campDetail;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.bam.mapper.CampDetailMapper;
import com.bam.mapper.ReviewMapper;
import com.bam.model.Camp;
import com.bam.model.Img;
import com.bam.model.Review;
import com.bam.model.Sort;
import com.bam.setting.WebTitle;
import com.bam.utils.DateUtil;
import com.bam.utils.PageUtil;
import com.bam.utils.StarUtil;
import com.bam.vo.ChartVo;
import com.bam.vo.Pagination;
import com.bam.vo.ReviewVo;
import com.bam.vo.TouristVo;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class CampDetailServiceImpl implements CampDetailService {

	CampDetailMapper mapper;
	ReviewMapper rmapper;

	private long getDate(Date wdate) {
		long diffDays=0L;
		try {
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
			String todayStr = df.format(cal.getTime());
			String wdateStr = df.format(wdate);

			Date today = df.parse(todayStr);
			Date wdateFormat =df.parse(wdateStr); 
			long diff = today.getTime()-wdateFormat.getTime();
			diffDays = diff/ (24 * 60 * 60 * 1000);
			log.info("####diffDays: " + diffDays);
		}catch(java.text.ParseException e) {
			e.printStackTrace();
		}
		return diffDays;
	}

	private List<Integer> getStarRateEach(List<Review> reviewList){
		StarUtil util = new StarUtil();
		//별점 당 개수 구할 변수
		int avg1=0;
		int avg2=0;
		int avg3=0;
		int avg4=0;
		int avg5=0;
		int totalStar=0;

		for(Review review : reviewList) {
			if(review.getStar()==1) {
				avg1++;
				totalStar++;
			}else if(review.getStar()==2) {
				avg2++;
				totalStar++;
			}else if(review.getStar()==3) {
				avg3++;
				totalStar++;
			}else if(review.getStar()==4) {
				avg4++;
				totalStar++;
			}else{
				avg5++;
				totalStar++;
			}
		}

		List<Integer> starRate = new ArrayList<Integer>();
		starRate.add(util.getAvgStarEach(avg1, totalStar));
		starRate.add(util.getAvgStarEach(avg2, totalStar));
		starRate.add(util.getAvgStarEach(avg3, totalStar));
		starRate.add(util.getAvgStarEach(avg4, totalStar));
		starRate.add(util.getAvgStarEach(avg5, totalStar));

		return starRate;
	}

	@Override
	public ModelAndView selectReviewS(int camp_idx, boolean isMore, HttpSession session, ModelAndView mv, String nextPage){
		PageUtil pageUtil = new PageUtil();
		StarUtil starUtil = new StarUtil();

		String cpStr=null;
		if(!isMore){ //isMore이 false면 페이징 초기화
			session.removeAttribute("cp");

		}else{ //isMore가 true면 다음 페이지 페이징처리
			cpStr = nextPage;
		}
		// 현재 페이지 설정
		int currentPage = pageUtil.getCurrentPageSession(cpStr, session);
		// 보여지는 리뷰 개수 5개
		int pageSize = pageUtil.getPageSize("5", session);

		int reviewListCount = rmapper.selectCountReview(camp_idx);
		Pagination pagination = new Pagination(reviewListCount, currentPage, pageSize);

		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("page", pagination);
		query.put("camp_idx", camp_idx);
		List<Review> reviewList = rmapper.selectReview(query);
		if(reviewListCount==0) {
			mv.addObject("reviewVo",null);
		}else {
			List<Integer> starRate = null;
			if(!isMore) {
				starRate = getStarRateEach(reviewList);

				List<ChartVo> chart = getStarChart(starRate);
				mv.addObject("chart",chart);
			}

			float avgStar = rmapper.selectStarAvg(camp_idx);
			avgStar = Math.round(avgStar*10)/10.0f;
			Date wdate = null;
			long diffDays=0L;
			for(Review review : reviewList){
				review.setHalfStarExist(starUtil.checkHalfStar(review.getStar()));
				review.setEmptyStarNum(starUtil.getEmptyStarNumber(review.getStar()));
				review.setFullStarNum(starUtil.getFullStarNumber(review.getStar()));
				// 리뷰 작성날짜
				wdate = review.getWdate();
				// 리뷰작성 며칠전에 했다 띄우기위한 컬럼
				diffDays = getDate(wdate);
				review.setDiffDays(diffDays);
			}
			ReviewVo reviewVo = new ReviewVo(reviewList, avgStar,
					starUtil.getFullStarNumber(avgStar),
					starUtil.checkHalfStar(avgStar),
					starUtil.getEmptyStarNumber(avgStar)
					);

			mv.addObject("reviewVo",reviewVo);
			mv.addObject("page", pagination);
			log.info("###>>reviewVoSize : "+reviewVo.getReviewList().size());
			log.info("###>>pagination"+pagination);
			log.info("###>>reviewVo : "+reviewVo);
			
			// 리뷰가 null이면 객체 새롭게 생성해서 mv 초기화
			if(reviewList==null)
				mv = new ModelAndView(); 
		}

		return mv;
	}	 

	private List<Sort> selectSortS(int camp_idx, String sort_name){
		HashMap<String, Object> query= new HashMap<String,Object>();
		query.put("camp_idx", camp_idx);
		query.put("sort_name", sort_name);

		return mapper.selectSort(query);
	}


	@Override
	public ModelAndView campDetail(int camp_idx) {
		Camp camp =mapper.selectCampInfo(camp_idx);
		// 모든 편의시설 담을 conv
		List<String> allConvList = new ArrayList<String>();

		// 편의/안전/기타 시설 담은 변수
		String conv = camp.getConv();
		String secConv = camp.getSec_conv();
		String etxConv = camp.getEtc_conv();

		if(conv!=null) {
			String[] convList = conv.split(",");
			if(convList.length!=0||convList!=null){
				for (int i = 0; i < convList.length; i++) {
					convList[i].trim();
					allConvList.add(convList[i]);
				}
				log.info("#>>conList : "+convList);
			}
		}

		if(secConv!=null) {
			String[] secConvList = secConv.split(",");
			if(secConvList.length!=0||secConvList!=null){
				for (int i = 0; i < secConvList.length; i++) {
					secConvList[i].trim();
					allConvList.add(secConvList[i]);
				}
				log.info("#>>secConvList : "+secConvList);
			}
		}
		if(etxConv!=null) { 
			String[] etcConvList = etxConv.split(",");
			if(etcConvList.length!=0||etcConvList!=null){
				for (int i = 0; i < etcConvList.length; i++) {
					etcConvList[i].trim();
					allConvList.add(etcConvList[i]);
				}
				log.info("#>>etcConvList : "+etcConvList);
			}
		}

		if(allConvList.size()==0||allConvList==null) {
			allConvList.add("갖춰진 시설 없음");
		}

		log.info("#>>allConvList : "+allConvList);

		List<Img> ImgDetailList = mapper.selectDetailImg(camp_idx);
		String campName = camp.getCamp_name();
		ModelAndView mv = new ModelAndView("client/camp/camp_detail/"+WebTitle.TITLE+campName);

		List<String> sortNameList = mapper.selectSortName(camp_idx);
		List<List<Sort>> list= new ArrayList<List<Sort>>();


		for(int i=0; i<sortNameList.size(); i++) {

			list.add(selectSortS(camp_idx, sortNameList.get(i)));

			log.info("###3 구분이름 : "+sortNameList+" : "+i);
		}
		mv.addObject("camp", camp);
		mv.addObject("allConvList",allConvList);
		mv.addObject("sortNameList",sortNameList);
		mv.addObject("ImgDetailList",ImgDetailList);
		mv.addObject("list", list);

		return mv;
	}

	private List<ChartVo> getStarChart(List<Integer> starRate){
		List<ChartVo> list = new ArrayList<ChartVo>();


		String items[] = {"1 점","2 점","3 점","4 점","5 점"};
		int numbers[] = new int[5];

		for(int i =0; i<items.length; i++) {
			numbers[i]=starRate.get(i);
			ChartVo vo = new ChartVo(items[i], numbers[i]);
			list.add(vo);
		}

		return list;
	}

	@Override
	public ModelAndView getTourists(double x, double y){
		ModelAndView mv = new ModelAndView("client/camp/tourist_page");
		int imgLength=0;
    	int telLength=0;
    	int j=0;
		
		ArrayList<TouristVo> list = new ArrayList<TouristVo>();
		
		String uri = "http://apis.data.go.kr/B551011/KorService/locationBasedList?serviceKey=[서비스키입력]&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=bam&arrange=E&contentTypeId=15&mapX="+x+"&mapY="+y+"&radius=100000&listYN=Y";
		 
		try{
			//xml 파싱 구문 : xml 문서를 읽을 수 있도록 도와준다
            DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
            Document xml = documentBuilder.parse(uri);
            log.info(">>>>xml : "+xml);

            Element root = xml.getDocumentElement();
            NodeList nodeList = root.getElementsByTagName("item");

            if(nodeList.getLength() != 0) {
	            for(int i=0; i<nodeList.getLength(); i++){
	                Node nodeItem = nodeList.item(i);
	                try {
	                	 String img = getTagValue("firstimage",(Element)nodeItem);
	                	 String tel = getTagValue("tel",(Element)nodeItem);
	                	 telLength = tel.length();
	                	 imgLength = img.length();
	                	 
	                    if(imgLength>0 && img!=null&&telLength>0&&tel!=null) {
	                    	String title = getTagValue("title",(Element)nodeItem);
	 	                    String addr = getTagValue("addr1",(Element)nodeItem);
	 	                    log.info(">>>img : "+img);
	 	                    log.info(">>>title : "+title);
	 	                    log.info(">>>addr : "+addr);
	 	                    log.info(">>>tel : "+tel);
	 	                    j++;
	 	                    list.add(new TouristVo(img, title, addr, tel));
	                    }
	                } catch (Exception e) {
	                }
	            }
            }
        } catch (ParserConfigurationException e){
        } catch (SAXException e){
        } catch (IOException e){
        } catch (Exception e){
        }
		// 최종 반환 list를 tourMap키를 이용해 tourist_page.jsp에 쏴주징
		mv.addObject("tourMap", list); //모델에 해쉬맵 넣으니깐 헤깔린다 리스트 넣자자
		return mv;
	}

	private String getTagValue(String sTag, Element element) {
	    try{
	        String result = element.getElementsByTagName(sTag).item(0).getTextContent();
	        return result;
	    } catch(NullPointerException e){
	        return "";
	    } catch(Exception e){
	        return "";
	    }
	}

	@Override
	public HashMap<String, Object> checkDatesService(HashMap<String, Object> request) {
		DateUtil dateUtil = new DateUtil();
		HashMap<String, Object> query = new HashMap<String, Object>();
		HashMap<String, Object> response = new HashMap<String, Object>();
		boolean checkAvailable = true; 
		List<String> notAvailableDates = new ArrayList<String>();
		
		String startDate = request.get("checkIn").toString();
		String endDate = request.get("checkOut").toString();
		int camp_idx = Integer.parseInt(request.get("camp_idx").toString());
		ArrayList<java.sql.Date> dateRange = dateUtil.getAllDatesInRange(startDate, endDate);
		query.put("camp_idx", camp_idx);
		Camp camp = mapper.selectCampInfo(camp_idx);
		int totalSites = camp.getSite_num();
		for(java.sql.Date date : dateRange) {
			query.put("date", date);
			int totalBooking = mapper.selectTotalBooking(query);
			if(totalSites <= totalBooking) {
				checkAvailable = false;
				notAvailableDates.add(date.toString());
			}
		}
		if(notAvailableDates.size() > 0) {
			response.put("dateList", notAvailableDates);
		}
		response.put("check", checkAvailable);
		return response;
	}
}
