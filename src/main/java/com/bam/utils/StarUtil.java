package com.bam.utils;

public class StarUtil {
	public int getFullStarNumber(float avgStar) {
		return (int)avgStar;
	}
	
	public boolean checkHalfStar(float avgStar) {
		String check = String.valueOf(avgStar);
		check = check.substring(check.length()-1);
		if(check.equals("0")) {
			return false;
		}
		return true; 
	}
	
	public int getEmptyStarNumber(float avgStar) {
		float result = 5.0f - avgStar;
		return (int)result;
	}
	
	public int getAvgStarEach(int star, int totalStar){
		float statF = star;
		float totalStarF = totalStar;
		return (int)((statF/totalStarF)*100);
	}
	
	//얘가 굳이 필요함?
	public static void main(String[] args) {
		StarUtil u = new StarUtil();
		System.out.println(u.getAvgStarEach(10, 50)+"%");
		System.out.println(u.getAvgStarEach(20, 50)+"%");
		System.out.println(u.getAvgStarEach(10, 50)+"%");
		System.out.println(u.getAvgStarEach(5, 50)+"%");
		System.out.println(u.getAvgStarEach(5, 50)+"%");
	}
	
}
