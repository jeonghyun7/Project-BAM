package com.bam.vo;

import java.util.List;

import com.bam.model.Camp;
import com.bam.model.Img;
import com.bam.model.Owner;
import com.bam.model.Sort;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class OwnerDetailVo {
	private Camp camp;
	private Owner owner;
	private List<Img> img_list;
	private List<Sort> sort_list;
	private int total_heart;
	private Img thumb_img;
	private String[] conv_list;
	private String[] sec_conv_list;
	private String[] etc_conv_list;
}