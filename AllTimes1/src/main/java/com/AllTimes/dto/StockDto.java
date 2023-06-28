package com.AllTimes.dto;

	/*주식 크롤링 Dto*/

public class StockDto {
	
	private String st_name;
	private String st_date;
	private String st_index;
	private String st_updown;
	private String st_percent;
	private String st_img;
	private String st_url;
	
	
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public String getSt_date() {
		return st_date;
	}
	public void setSt_date(String st_date) {
		this.st_date = st_date;
	}
	public String getSt_index() {
		return st_index;
	}
	public void setSt_index(String st_index) {
		this.st_index = st_index;
	}
	public String getSt_updown() {
		return st_updown;
	}
	public void setSt_updown(String st_updown) {
		this.st_updown = st_updown;
	}
	public String getSt_percent() {
		return st_percent;
	}
	public void setSt_percent(String st_percent) {
		this.st_percent = st_percent;
	}
	public String getSt_img() {
		return st_img;
	}
	public void setSt_img(String st_img) {
		this.st_img = st_img;
	}
	public String getSt_url() {
		return st_url;
	}
	public void setSt_url(String st_url) {
		this.st_url = st_url;
	}
	@Override
	public String toString() {
		return "StockDto [st_name=" + st_name + ", st_date=" + st_date + ", st_index=" + st_index + ", st_updown="
				+ st_updown + ", st_percent=" + st_percent + ", st_img=" + st_img + ", st_url=" + st_url + "]";
	}
	
	
	
}
	
	