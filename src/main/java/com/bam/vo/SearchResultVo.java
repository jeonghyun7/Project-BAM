package com.bam.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class SearchResultVo {
	private List<?> list;
	private Pagination page;
}
