package com.AllTimes.dto;

import javax.servlet.http.HttpServletRequest;


import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReporterDto {
	private String rid;
	private String rpw;
	private String rname;
	private int rstate;
	private String rmail;
	
	private MultipartFile rfile;
	private String rprofile;
	private String rcontact;
	

	
}
