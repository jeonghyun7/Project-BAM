package com.bam.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CampAndSortAndImg {
	private List<Sort> sort;
	private Camp camp;
	private MultipartFile imgThumb;
	private List<MultipartFile> imgDetail;
}
