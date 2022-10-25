package com.bam.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ChartVo {
	private String item;
	private int number;
	
	private long todaySales;
	private long yesterdaySales;
	
	public ChartVo(String item, int number) {
		this.item = item;
		this.number = number;
	}
	
	public ChartVo(long todaySales, long yesterdaySales) {
		this.todaySales = todaySales;
		this.yesterdaySales = yesterdaySales;
	}
	
	@Override
	public String toString() {
		return "ChartVo [item=" + item + ", number=" + number + ", todaySales=" + todaySales + ", yesterdaySales="
				+ yesterdaySales + "]";
	}
}
