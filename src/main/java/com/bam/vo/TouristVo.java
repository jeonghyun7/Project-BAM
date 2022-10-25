package com.bam.vo;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class TouristVo {
	//private List<?> tList;
	private String img;
	private String title;
	private String addr;
	private String tel;
	
	//단축키 : alt + shift + s -> + s
	@Override
	public String toString() {
		return "TouristVo [img=" + img + ", title=" + title + ", addr=" + addr + ", tel=" + tel + "]";
	}
	

	
}
