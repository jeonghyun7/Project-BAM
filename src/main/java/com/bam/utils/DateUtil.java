package com.bam.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	Calendar cal;
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	public DateUtil() {
		cal = Calendar.getInstance();
		cal.setTime(new Date());
	}

	public String getToday() {
		String todayStr = df.format(cal.getTime());
		return todayStr;
	}

	public String getTommorrow(){
		cal.add(Calendar.DATE, 1);
		return df.format(cal.getTime());
	}

	public String getYesterday(){
		cal.add(Calendar.DATE, -1);
		return df.format(cal.getTime());
	}

	/**
	 * "~"로 구분된 나눌 날짜를 매개변수로 넣고 호출하면 String[] 배열 형태로 값을 반환한다.
	 * @param udate 나눌 날짜 with String type 
	 * @param splitCharacter 나누는 기준이 될 문자 with String type
	 * @return return String[] <br/>
	 * &#9 [0] :: startDate <br/>
	 * &#9 [1] :: endDate 
	 */
	public String[] splitDates(String udate, String splitCharacter) {
		String[] result = udate.split(splitCharacter);
		result[0] = result[0].trim();
		result[1] = result[1].trim();
		return result;
	}

	public boolean  isWithinRange(String date, String startDate, String endDate) {
		LocalDate localDate = null;
		LocalDate startLocalDate = null;
		LocalDate endLocalDate = null;
		try {
			localDate = LocalDate.parse(date);
			startLocalDate = LocalDate.parse(startDate);
			endLocalDate = LocalDate.parse(endDate);
		} catch(DateTimeParseException e) {
			date = date.replaceAll("/", "-");
			startDate = startDate.replaceAll("/", "-");
			endDate = endDate.replaceAll("/", "-");
			localDate = LocalDate.parse(date);
			startLocalDate = LocalDate.parse(startDate);
			endLocalDate = LocalDate.parse(endDate);
		}
		endLocalDate = endLocalDate.plusDays(1); //endDate는 포함하지 않으므로 +1을 해야함
		return (!localDate.isBefore(startLocalDate)) && (!localDate.isAfter(endLocalDate));
	}

	public java.sql.Date transformDate(String year, String month, String day) {
		String date = year+"-"+month+"-"+day;
		return java.sql.Date.valueOf(date);
	}

	public java.sql.Date transformDate(String date){
		date = date.replaceAll("/", "-");
		df = new SimpleDateFormat("yyyy-mm-dd");
		Date tempDate = null;
		try {
			tempDate = df.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String transDate = df.format(tempDate);
		return java.sql.Date.valueOf(transDate);
	}
	
	public ArrayList<java.sql.Date> getAllDatesInRange(String startDate, String endDate){
		startDate = startDate.replaceAll("/", "-");
		endDate = endDate.replaceAll("/", "-");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date start = null; 
		Date end = null;
		try {
			start = df.parse(startDate);
			end = df.parse(endDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Calendar startCal = Calendar.getInstance();
		Calendar endCal = Calendar.getInstance();
		startCal.setTime(start);
		endCal.setTime(end);
		ArrayList<java.sql.Date> result = new ArrayList<java.sql.Date>();
		while(startCal.compareTo(endCal) != 1) {
			result.add(java.sql.Date.valueOf(df.format(startCal.getTime())));
			startCal.add(Calendar.DATE, 1);
		}
		return result;
	}

	public String dateCalculation(String date, int amount) {
		df = new SimpleDateFormat("yyyy-MM-dd");
		Date tempDate = null;
		try {
			tempDate = df.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		cal.setTime(tempDate);
		cal.add(Calendar.DATE, amount);
		
		return df.format(cal.getTime());
	}

}

