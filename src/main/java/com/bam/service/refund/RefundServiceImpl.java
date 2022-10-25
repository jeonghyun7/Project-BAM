package com.bam.service.refund;

import static com.bam.setting.RefundSet.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bam.mapper.BookingMapper;
import com.bam.model.Booking;
import com.bam.model.Member;
import com.bam.utils.DateUtil;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class RefundServiceImpl implements RefundService {
	
	BookingMapper mapper;

	// 아임포트 인증(토큰)을 받아주는 함수
	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL); 
		Map<String,String> m =new HashMap<String,String>(); 
		m.put("imp_key", KEY); 
		m.put("imp_secret", SECRET); 
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode resNode = rootNode.get("response"); 
			result = resNode.get("access_token").asText(); 
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
		return result; 
	}
	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수 
	private List<NameValuePair> convertParameter(Map<String,String> paramMap){
		List<NameValuePair> paramList = new ArrayList<NameValuePair>(); 
		Set<Entry<String,String>> entries = paramMap.entrySet(); 
		for(Entry<String,String> entry : entries) { 
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue())); 
		} return paramList; 
	}
	// 결제취소 
	public int cancelPayment(String token, String imp_uid) {
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL); 
		Map<String, String> map = new HashMap<String, String>(); 
		post.setHeader("Authorization", token); 
		map.put("imp_uid", imp_uid);
		String asd = "";
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post); 
			//log.info(">>>res : "+res);
			System.out.println(">>>res : "+res);
			ObjectMapper mapper = new ObjectMapper();
			String enty = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(enty); 
			asd = rootNode.get("response").asText(); 
		} catch (Exception e) {
			e.printStackTrace();
		}if (asd.equals("null")){
			System.err.println("환불실패");
			return -1; 
		} else {
			System.err.println("환불성공");
			Booking booking = mapper.selectBookingOne(imp_uid);
			mapper.minusTotalBooking(booking.getCamp_idx());
			return 1;
		}
	}

	// 아임포트 결제정보를 조회해서 결제금액을 뽑아주는 함수 
	public String getAmount(String token, String imp_uid) {
		String amount = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(IMPORT_PAYMENTINFO_URL + imp_uid + "/paid");
		get.setHeader("Authorization", token);
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			amount = resNode.get("amount").asText();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return amount;
	}
	// 아임포트 결제금액 변조를 방지하는 함수 
	public void setHackCheck(String amount, String imp_uid, String token) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_PREPARE_URL);
		Map < String,
		String > m = new HashMap < String,
		String > ();
		post.setHeader("Authorization", token);
		m.put("amount", amount);
		m.put("imp_uid", imp_uid);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			System.out.println(rootNode);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	@Transactional
	public boolean updateBooking(String imp_uid, long point, long use_point, long save_point, String email, HttpSession session) {
		log.info(">>>imp_uid : "+imp_uid);
		log.info(">>>point : "+point);
		log.info(">>>use_point : "+use_point);
		log.info(">>>save_point : "+save_point);
		log.info(">>>email : "+email);
		//mapper.updateS_no(imp_uid);
		boolean flag = mapper.updateS_no(imp_uid);
		System.out.println(">>>flag : "+flag);
		
		HashMap<String, Object> query = new HashMap<String, Object>();
		
		point = getRefundPoint(use_point,save_point)+point;
		log.info(">>>point2 : "+point);
		
		query.put("point", point);
		query.put("email", email);
		
		if(point != -1L) {
			if(mapper.updatePoint(query)) {
				Member member  = (Member)session.getAttribute("member");
				member.setPoint(point);
				session.setAttribute("member", member);
			}
			return true;
		}else {
			return false;
		}
		
	}
	
	private long getRefundPoint(long use_point, long save_point) {
		long point=0;
		if(use_point>=save_point) {
			point = use_point-save_point;
			log.info(">>point1 : "+point);
		}else if(use_point<save_point) {
			point = use_point-save_point;
			log.info(">>point2 : "+point);
		}else {
			point = -1;
			log.info(">>point3 : "+point);
		}
		return point;
	}
	
	@Override
	public String[] getRefundableDate(String check_in) {
		DateUtil util = new DateUtil();
		String[] refundableDate = {
									util.getToday(),
									util.dateCalculation(check_in,-4),
									util.dateCalculation(check_in,-3),
									util.dateCalculation(check_in,-2),
									util.dateCalculation(check_in,-1)
								  };
		// 날짜 잘받아졌나 확인확인~
		for(int i=0; i<refundableDate.length; i++) {
			System.out.println(">>>>>>"+i+" : "+refundableDate[i]);
		}
		return refundableDate;
	}

}
