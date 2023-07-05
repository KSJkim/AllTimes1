package com.AllTimes.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ArticleDto {
	
	private int ar_no;
	private String ar_title;
	private String ar_detail;
	private String ar_name;
	private String ar_date;
	private String ar_genre;
	private String ar_img;
	private int ar_hits;
	private int ar_thumbsup;
	private int ar_thumbsdown;
	
	private MultipartFile ar_file;

}
