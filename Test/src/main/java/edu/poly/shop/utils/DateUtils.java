package edu.poly.shop.utils;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class DateUtils {
	public void dateutil() {
		LocalDateTime localDateTime = LocalDateTime.now();
		LocalDate localDate = localDateTime.toLocalDate();
	}
}
