package com.bam.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class TimeUtil {
	
	public String getDateTime() {
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		long resTime = System.currentTimeMillis(); 
		return dayTime.format(resTime);
	}

	/**
	 * dateStart 부터 dateStop 까지의 총 시간 차를 long형의 배열로 반환한다.
	 * @return long [0] : 초, [1] : 분, [2] : 시, [3] : 일
	 * @param dataStart 부터 dateStop 까지
	 */
	public long[] getTimeDiffer(String dateStart, String dateStop) {
		// Custom date format
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  

		Date d1 = null;
		Date d2 = null;
		try {
			d1 = format.parse(dateStart);
			d2 = format.parse(dateStop);
		} catch (ParseException e) {
			e.printStackTrace();
		}  
		// Get msec from each, and subtract.
		long diff = d2.getTime() - d1.getTime();
		long diffSeconds = diff / 1000 % 60;  
		long diffMinutes = diff / (60 * 1000) % 60; 
		long diffHours = diff / (60 * 60 * 1000); 
		long diffDate = diffHours / 24;
		diffHours = diffHours % 24;
		
		long[] result = {diffSeconds, diffMinutes, diffHours, diffDate};
		
		return result;
	}

	/**
	 * dateStart 부터 dateStop 까지의 시간을 각각의 초, 분, 시 별로 반환한다.
	 * @return long [0] : 초, [1] : 분, [2] : 시
	 * @param dataStart 부터 dateStop 까지
	 */
	public long[] getTimeDifferEachType(String dateStart, String dateStop) {
		// Custom date format
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  

		Date d1 = null;
		Date d2 = null;
		try {
			d1 = format.parse(dateStart);
			d2 = format.parse(dateStop);
		} catch (ParseException e) {
			e.printStackTrace();
		}  
		
		// Get msec from each, and subtract.
		long diff = d2.getTime() - d1.getTime();//as given
		long diffSeconds = TimeUnit.MILLISECONDS.toSeconds(diff);
		long diffMinutes = TimeUnit.MILLISECONDS.toMinutes(diff); 
		long diffHours = TimeUnit.MILLISECONDS.toHours(diff);
		
		long[] result = {diffSeconds, diffMinutes, diffHours};
		
		return result;
	}
}
