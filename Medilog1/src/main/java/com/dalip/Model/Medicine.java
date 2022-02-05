package com.dalip.Model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Medicine {
	
	
	public String _id;
	public String userId;
	public String mdName;
	public String mdExpiryDate;
	public String mdQuantity;
	public String mdTreatments;
	public String dateTimeStamp;
	
	public Medicine() {
		
	}
	
	
	public Medicine(String userId, String mdName, String mdExpiryDate, String mdQuantity, String mdTreatments,
			String dateTimeStamp) {
		this.userId = userId;
		this.mdName = mdName;
		this.mdExpiryDate = mdExpiryDate;
		this.mdQuantity = mdQuantity;
		this.mdTreatments = mdTreatments;
		this.dateTimeStamp = dateTimeStamp;
	}


	public Map toMap() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("mdName", mdName);
		map.put("mdExpiryDate", mdExpiryDate);
		map.put("mdTreatments", mdTreatments);
		map.put("mdQuantity", mdQuantity);
		map.put("dateTimeStamp", new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss").format(new Date()));
		
		return map;
	}


	@Override
	public String toString() {
		return "Medicine [_id=" + _id + ", userId=" + userId + ", mdName=" + mdName + ", mdExpiryDate=" + mdExpiryDate
				+ ", mdQuantity=" + mdQuantity + ", mdTreatments=" + mdTreatments + ", dateTimeStamp=" + dateTimeStamp
				+ "]";
	}

	
}