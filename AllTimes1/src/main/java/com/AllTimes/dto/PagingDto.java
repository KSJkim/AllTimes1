package com.AllTimes.dto;

import com.AllTimes.paging.Criteria;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingDto {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri;
	
	public PagingDto(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNo()/10.0))*10;
		this.startPage = this.endPage-9;
		
		int finalPage = (int)(Math.ceil(total * 1.0/cri.getAmount()));
		
		if(finalPage < this.endPage) {
			this.endPage = finalPage;
		}
		
		this.prev = this.startPage>1;
		
		this.next = this.endPage < finalPage;
	}
}

