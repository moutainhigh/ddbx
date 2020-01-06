package com.example.ddbx.transfer.utils;
import java.text.SimpleDateFormat;
import java.util.Date;
public class DataUtil {
	public static String millisecondTodate(Long l){
		Date date2=new Date();
		date2.setTime(l);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
		String fmDate=simpleDateFormat.format(date2);
		return fmDate;
	}
}
