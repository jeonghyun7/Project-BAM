package com.bam.service.company;

import com.bam.model.Camp;

public interface CompanyService {

	String get_campList();
	void del_campList(long camp_idx);
	void Edit_campList(Camp camp);
}
