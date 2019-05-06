package com.spring.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public static String getNowDate(){
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		String date=format.format(new Date());
		return date;
	}
	
	public static Date parseDate(String date){
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		 Date dateTime=null;
		try {
			dateTime = format.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}  
		return dateTime;
	}
	
	public static String format(Date date,String formatStr){
		DateFormat format=new SimpleDateFormat(formatStr);
		return format.format(date);
	}
}
