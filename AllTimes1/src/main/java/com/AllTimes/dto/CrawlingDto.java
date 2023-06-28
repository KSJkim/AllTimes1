package com.AllTimes.dto;

public class CrawlingDto {

	private String cr_title;
	private String cr_detail;
	private String cr_img;
	private String cr_url;
	
	public String getCr_title() {
		return cr_title;
	}
	public void setCr_title(String cr_title) {
		this.cr_title = cr_title;
	}
	public String getCr_detail() {
		return cr_detail;
	}
	public void setCr_detail(String cr_detail) {
		this.cr_detail = cr_detail;
	}
	public String getCr_img() {
		return cr_img;
	}
	public void setCr_img(String cr_img) {
		this.cr_img = cr_img;
	}
	public String getCr_url() {
		return cr_url;
	}
	public void setCr_url(String cr_url) {
		this.cr_url = cr_url;
	}
	@Override
	public String toString() {
		return "CrawlingDto [cr_title=" + cr_title + ", cr_detail=" + cr_detail + ", cr_img=" + cr_img + ", cr_url="
				+ cr_url + "]";
	}
	
	
	
	
}
