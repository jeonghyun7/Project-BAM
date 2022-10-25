package com.bam.service.company;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bam.mapper.CampMapper;
import com.bam.model.Camp;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CompanyServiceImpl implements CompanyService {
	
	
private CampMapper campMapper;
	
	public String get_campList() {
		
		List<Camp> campList = campMapper.selectCamp();
		
		//상위 오브젝트 생성
		JsonObject obj1 = new JsonObject();
		//data: 뒤에 들어갈 값인 jArray 생성
		JsonArray jArray = new JsonArray();
		
		//배열생성, jArray의 0번째 배열에 쭈루룩, 1번째 배열에 쭈루룩~
		for(Camp camp : campList){
		
			JsonObject obj2 = new JsonObject();
			//obj2는 반드시 for문 안에 놓아야 한다. 그래야 중복이 안생긴다.
			
			obj2.addProperty("camp_idx", camp.getCamp_idx());
			obj2.addProperty("camp_name",camp.getCamp_name());
			obj2.addProperty("address",camp.getAddress());
			obj2.addProperty("camp_tel",camp.getCamp_tel());
			obj2.addProperty("site_num",camp.getSite_num());
			obj2.addProperty("full_num",camp.getFull_num());
			obj2.addProperty("parking",camp.getParking());
			obj2.addProperty("conv",camp.getConv());
			obj2.addProperty("sec_conv",camp.getSec_conv());
			obj2.addProperty("etc_conv",camp.getEtc_conv());
			obj2.addProperty("agency_tel",camp.getAgency_tel());
			obj2.addProperty("agency_name",camp.getAgency_name());
			
			jArray.add(obj2);

		}
		
		//마지막으로 최상위의 jsonObject에 data와 jArry를 넣어준다.
		
		obj1.add("data", jArray);

		String resp = obj1.toString();
//		String resp_2 = null;
//		try {
//			resp_2 = new String(resp.getBytes("UTF-8"),"UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
//		

		

		return resp;
	}
	
	public void del_campList(long camp_idx) {
		campMapper.deleteCamp(camp_idx);
	}
	
	public void Edit_campList(Camp camp) {
		campMapper.updateCamp(camp);
	}

}
