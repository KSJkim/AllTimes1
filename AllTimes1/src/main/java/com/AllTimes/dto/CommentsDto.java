package com.AllTimes.dto;

public class CommentsDto {
	private int cm_no;
	private String cm_writer;
	private String cm_detail;
	private int cm_ar_no;
	private String cm_date;
	
	public int getCm_no() {
		return cm_no;
	}
	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}
	public String getCm_writer() {
		return cm_writer;
	}
	public void setCm_writer(String cm_writer) {
		this.cm_writer = cm_writer;
	}
	public String getCm_detail() {
		return cm_detail;
	}
	public void setCm_detail(String cm_detail) {
		this.cm_detail = cm_detail;
	}
	public int getCm_ar_no() {
		return cm_ar_no;
	}
	public void setCm_ar_no(int cm_ar_no) {
		this.cm_ar_no = cm_ar_no;
	}
	public String getCm_date() {
		return cm_date;
	}
	public void setCm_date(String cm_date) {
		this.cm_date = cm_date;
	}
	
	@Override
	public String toString() {
		return "CommentsDto [cm_no=" + cm_no + ", cm_writer=" + cm_writer + ", cm_detail=" + cm_detail + ", cm_ar_no="
				+ cm_ar_no + ", cm_date=" + cm_date + "]";
	}
}
