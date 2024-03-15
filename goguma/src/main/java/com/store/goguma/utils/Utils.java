package com.store.goguma.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Utils {
	
	public static String timestampToString(Timestamp timestamp) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(timestamp);
	}
}
