package com.bam.mapper;

import java.util.HashMap;
import java.util.List;

import com.bam.model.Camp;
import com.bam.model.Img;
import com.bam.model.Inquiry;
import com.bam.model.Owner;
import com.bam.model.Sort;

public interface OwnerMapper {
	boolean insertInquiry(HashMap<String, Object> query);
	List<Inquiry> selectInquiryOne(String email);
	boolean insertCamp(Camp query);
	boolean insertImgs(HashMap<String, Object> query);
	boolean insertSorts(HashMap<String, Object> query);
	boolean updateOwnerCampIdx(HashMap<String, Object> query);
	Owner select_owner(String email);
	Camp select_camp(int camp_idx);
	List<Img> select_img(int camp_idx);
	Img select_img_thumb(int camp_idx);
	List<Sort> select_sort(int camp_idx);
	Integer select_heart(int camp_idx);
	int delete_camp(int camp_idx);
	int update_owner_camp_idx(String email);
	boolean update_camp(HashMap<String, Object> query);
	boolean delete_img(HashMap<String, Object> query);
	boolean delete_sort(HashMap<String, Object> query);
}
