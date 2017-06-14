package com.cpic.sme

import java.text.SimpleDateFormat

import pl.touk.excel.export.getters.PropertyGetter

class DateToStringGetter extends PropertyGetter<Date, String> {
	// From Currency, to String
	DateToStringGetter(String propertyName) {
		super(propertyName)
	}

	@Override
	protected String format(Date value) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd")
		if(value != null){
			return sdf.format(value);
		}else{
			return "";
		}
	}
}