package com.AllTimes.dto;

public class SnackCultureDto {
	
	private String sn_title;
	private String sn_img;
	private String sn_url;
	
	
	public String getSn_title() {
		return sn_title;
	}
	public void setSn_title(String sn_title) {
		this.sn_title = sn_title;
	}
	public String getSn_img() {
		return sn_img;
	}
	public void setSn_img(String sn_img) {
		this.sn_img = sn_img;
	}
	public String getSn_url() {
		return sn_url;
	}
	public void setSn_url(String sn_url) {
		this.sn_url = sn_url;
	}
	@Override
	public String toString() {
		return "SnackCultureDto [sn_title=" + sn_title + ", sn_img=" + sn_img + ", sn_url=" + sn_url + "]";
	}
	
	

	
}
