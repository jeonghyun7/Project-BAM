package com.bam.service.owner;


import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bam.mapper.BookingManageMapper;
import com.bam.mapper.OwnerMapper;
import com.bam.model.BookingInfo;
import com.bam.model.Camp;
import com.bam.model.CampAndSortAndImg;
import com.bam.model.Img;
import com.bam.model.Inquiry;
import com.bam.model.Member;
import com.bam.model.Owner;
import com.bam.model.Sort;
import com.bam.setting.Path;
import com.bam.setting.WebTitle;
import com.bam.utils.DateUtil;
import com.bam.utils.FileUtil;
import com.bam.utils.PageUtil;
import com.bam.vo.OwnerDetailVo;
import com.bam.vo.Pagination;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
class OwnerServiceImpl implements OwnerService{
	private OwnerMapper ownerMapper;
	private BookingManageMapper manageMapper;
	@Autowired
	private HttpSession session;

	@Override
	public ModelAndView submitInquiryService(Inquiry inquiry) {
		ModelAndView response = new ModelAndView();

		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("query", inquiry);
		boolean result = ownerMapper.insertInquiry(query);
		response.addObject("result", result);
		return response;
	}
	
	@Override
	public int checkInquiryService(Member member) {
		List<Inquiry> list = ownerMapper.selectInquiryOne(member.getEmail());
		if(list.size() > 0) {
			if(list.get(0).getS_no() == 1) return 1;
			else return 2;
		} else {
			return 3;
		}
	}
	
	@Override
	public ModelAndView checkOwner(HttpSession session) {
		Member user  = (Member)session.getAttribute("member");
		ModelAndView response = new ModelAndView();
		Owner owner = null;
		if(user == null) {
			response.setViewName("redirect:../login/login.bam");
			return response;
		} else {
			owner = ownerMapper.select_owner(user.getEmail());
		}
		
		if(owner != null && user.getA_no() == 1) {
			response.setViewName("redirect:../login/login.bam?relogin="+true);
		}else if(user.getA_no() == 1) {
			response.setViewName("client/member/add_camp/"+WebTitle.TITLE+"캠핑장 등록");
			response.addObject("result", 1);
		}else if(user.getA_no() == 2) {
			response.setViewName("client/member/add_camp/"+WebTitle.TITLE+"캠핑장 등록");
			if(owner.getCamp_idx() == 0) {
				response.addObject("result", 2);
			}else {
				response.addObject("result", 3);
			}
		}
		return response;
	}

	@Transactional
	@Override
	public ModelAndView addCampService(CampAndSortAndImg model, HttpSession session) {
		ModelAndView response = new ModelAndView();
		Member user = (Member)session.getAttribute("member");
		FileUtil fileUtil = new FileUtil();
		HashMap<String, Object> query = new HashMap<String, Object>();
		log.info("#> camp_idx(before) : "+model.getCamp().getCamp_idx());
		if(ownerMapper.insertCamp(model.getCamp())) {
			log.info("#> camp_idx(after) : "+model.getCamp().getCamp_idx());
			query.put("camp", model.getCamp());
			query.put("email", user.getEmail());
			if(ownerMapper.updateOwnerCampIdx(query)) {
				List<Img> imgList =  new ArrayList<Img>();
				String savedName = fileUtil.uploadFile(model.getImgThumb(), Path.CAMP_IMG_THUMB, session);
				imgList.add(new Img(0, 0, savedName, model.getImgThumb().getOriginalFilename(), model.getImgThumb().getSize(), "thumb"));
				for(MultipartFile file : model.getImgDetail()) {
					imgList.add(new Img(0, 0, fileUtil.uploadFile(file, Path.CAMP_IMG_DETAIL, session), file.getOriginalFilename(), file.getSize(), "detail"));
				}
				query.put("list", imgList);
				if(ownerMapper.insertImgs(query)) {
					query.remove("list");
					for(Sort sort : model.getSort()) {
						sort.setFname(fileUtil.uploadFile(sort.getSite_img(), Path.CAMP_IMG_SORT, session));
						sort.setOfname(sort.getSite_img().getOriginalFilename());
					}
					query.put("list", model.getSort());
					if(ownerMapper.insertSorts(query)) { 
						response.addObject("response", true);
					} else {
						response.addObject("response", false);
					}
				} else {
					response.addObject("response", false);
				}
			} else {
				response.addObject("response", false);
			}
		} else {
			response.addObject("response", false);
		}
		response.setViewName("client/member/add_camp/"+WebTitle.TITLE+"캠핑장 등록");
		return response;
	}

	//마이페이지 내 사업자 정보 디테일
	@Override
	public ModelAndView get_owner_full_detail(HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		Owner owner = ownerMapper.select_owner(member.getEmail());
		Integer total_heart = ownerMapper.select_heart(owner.getCamp_idx());
		if(total_heart == null) {
			total_heart = 0;
		}
		Camp camp = ownerMapper.select_camp(owner.getCamp_idx());
		
		String[] conv_list = null;
		if(camp.getConv() != null)
			conv_list = camp.getConv().split(",");
		
		String[] sec_conv_list = null;
		if(camp.getSec_conv() != null)
			sec_conv_list = camp.getSec_conv().split(",");
		
		String[] etc_conv_list = null;
		if(camp.getEtc_conv() != null)
			etc_conv_list = camp.getEtc_conv().split(",");
		
		OwnerDetailVo result = new OwnerDetailVo(
				camp,
				owner,
				ownerMapper.select_img(owner.getCamp_idx()),
				ownerMapper.select_sort(owner.getCamp_idx()),
				total_heart,
				ownerMapper.select_img_thumb(owner.getCamp_idx()),
				conv_list,
				sec_conv_list,
				etc_conv_list
				);
		ModelAndView response =  new ModelAndView();
		return response.addObject("vo", result);
	}
	
	@Transactional
	@Override
	public ModelAndView delete_camp_service(int camp_idx, HttpSession session) {
		ModelAndView response = new ModelAndView();
		Member member = (Member)session.getAttribute("member");
		int i = ownerMapper.update_owner_camp_idx(member.getEmail());
		if(i > 0) {
			log.info("#> check!!"+i);
			int j = ownerMapper.delete_camp(camp_idx);
			log.info("#> checkcheck!!"+j);
		}
		return response;
	}
	
	@Transactional
	@Override
	public ModelAndView update_camp_service(CampAndSortAndImg request) {
		ModelAndView response = new ModelAndView();
		HashMap<String, Object> query = new HashMap<String, Object>();
		
		query.put("camp", request.getCamp());
		if(ownerMapper.update_camp(query)) {
			Img img = ownerMapper.select_img_thumb(request.getCamp().getCamp_idx());
			File file = new File(Path.CAMP_IMG_THUMB, img.getFname());
			file.delete();
			List<Img> img_list = ownerMapper.select_img(request.getCamp().getCamp_idx());
			for(Img temp : img_list) {
				file = new File(Path.CAMP_IMG_DETAIL, temp.getFname());
				file.delete();
			}
			if(ownerMapper.delete_img(query)) {
				List<Sort> sort_list = ownerMapper.select_sort(request.getCamp().getCamp_idx());
				for(Sort sort : sort_list) {
					file = new File(Path.CAMP_IMG_SORT, sort.getFname());
					file.delete();
				}
				if(ownerMapper.delete_sort(query)) {
					FileUtil fileUtil = new FileUtil();
					List<Img> new_img_list = new ArrayList<Img>();
					
					String fname = fileUtil.uploadFile(request.getImgThumb(), Path.CAMP_IMG_THUMB, session);
					new_img_list.add(new Img(-1, -1, fname, request.getImgThumb().getOriginalFilename(), request.getImgThumb().getSize(), "thumb"));
					
					for(MultipartFile mf : request.getImgDetail()) {
						String d_fname = fileUtil.uploadFile(mf, Path.CAMP_IMG_DETAIL, session);
						new_img_list.add(new Img(-1, -1, d_fname, mf.getOriginalFilename(), mf.getSize(), "detail"));
					}
					query.put("list", new_img_list);
					if(ownerMapper.insertImgs(query)) {
						for(Sort new_sort : request.getSort()) {
							String s_fname = fileUtil.uploadFile(new_sort.getSite_img(), Path.CAMP_IMG_SORT, session);
							new_sort.setFname(s_fname);
							new_sort.setOfname(new_sort.getSite_img().getOriginalFilename());
						}
						query.put("list", request.getSort());
						if(ownerMapper.insertSorts(query)) {
							response.addObject("result", true);
							return response;
						}
					}
				}
			}
		}
		response.addObject("result", false);
		return response;
	}
	
	@Override
	public ModelAndView get_booking_info_service(String cpStr, boolean isMore, boolean isSearch, String keyword, String category) {
		ModelAndView response = new ModelAndView();
		
		PageUtil pageUtil = new PageUtil();
		if(!isMore) {
			session.removeAttribute("cp");
			cpStr = null;
		}
		int currentPage = pageUtil.getCurrentPageSession(cpStr, session);
		int pageSize = pageUtil.getPageSize("3", session);
		
		Member user = (Member)session.getAttribute("member");
		Camp camp = manageMapper.select_owner_camp(user.getEmail());
		if(camp != null) {
			HashMap<String, Object> query = new HashMap<String, Object>();
			DateUtil dateUtil = new DateUtil();
			String transDate = dateUtil.getToday().replaceAll("/", "-");
			Date today = Date.valueOf(transDate);
			query.put("camp_idx", camp.getCamp_idx());
			query.put("today", today);
			if(isSearch) {
				query.put("search", isSearch);
			} else {
				query.put("search", null);
			}
			query.put("category", category);
			query.put("keyword", keyword);
			long listCount = manageMapper.select_count_booking_list(query);
			Pagination page = new Pagination(listCount, currentPage, pageSize);
			
			response.addObject("campSize", camp.getSite_num());
			
			if(listCount == 0) {
				response.addObject("using", 0);
				response.addObject("notUsing", 0);
				response.addObject("endUsing", 0);
				return response;
			}
			query.put("page", page);
			List<BookingInfo> list = manageMapper.select_booking_list(query);
			response.addObject("list", list);
			response.addObject("page", page);
			
			query.put("using_state", 'U');
			response.addObject("using", manageMapper.select_count_using_state(query));
			
			query.put("using_state", 'F');
			response.addObject("notUsing", manageMapper.select_count_using_state(query));
			
			query.put("using_state", 'T');
			response.addObject("endUsing", manageMapper.select_count_using_state(query));
		}
		return response;
	}
	
	@Override
	public boolean change_using_state_service(String data) throws IOException {
		ObjectMapper jsonObj = new ObjectMapper();
		JsonNode rootNode = jsonObj.readTree(data);
		String imp_uid = rootNode.get("imp_uid").asText();
		String action = rootNode.get("action").asText();

		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("imp_uid", imp_uid);
		if(action.equals("start")) {
			query.put("using_state", 'U');
		} else if(action.equals("end")) {
			query.put("using_state", 'T');
		}
		return manageMapper.update_using_state(query);
	}
}
