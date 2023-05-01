package com.springmvc.domain;

import org.springframework.stereotype.Component;

@Component
public class criteria {
	private int pagenum;	//현재 페이지
	private int amount;		//페이지에 표시할 게시글 갯수
	
	public int getpagestart() {	//DB에서 가져올 게시글의 처음 시작인덱스
		return (this.pagenum-1)*this.amount;
	}
	
	public criteria() {
		//객체 생성시 기본 생성자를 호출하여 매개변수를 줘서 매개변수를 가지고 있는 생성자 함수 호출
		//생성자에서 pageNum=1, amount=10으로 설정
		this(1, 10); 
				
	}
	public criteria(int pagenum, int amount) {
		this.pagenum = pagenum;
		this.amount = amount;
	}
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		
		return "criteria [pagenum="+pagenum+", amount="+amount+"]";
	}
	
	
}