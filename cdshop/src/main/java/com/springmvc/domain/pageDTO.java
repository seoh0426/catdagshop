package com.springmvc.domain;

public class pageDTO {
	private int startpage;		//시작 페이지
	private int endpage;		//끝 페이지
	private boolean prev, next;	//이전 페이지, 다음 페이지 존재 유무
	private int total;			//전체 개수
	private criteria cri;		//page, amount
	private int realend;
	
	public pageDTO(criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		//마지막 페이지
		this.endpage = (int)(Math.ceil(cri.getPagenum()/10.0))*10;
		//시작 페이지
		this.startpage = this.endpage-9;
		//전체 마지막 페이지
		this.realend = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		//전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 
		if(this.realend < this.endpage) {
			this.endpage = this.realend;
		}
		
		//시작 페이지 값이 1보다 큰 경우 true
		this.prev = this.startpage > 1;
		//마지막 페이지 값이 전체 마지막 페이지보다 큰 경우 true
		this.next = this.endpage < realend;
		
		
	}
	
	public int getStartpage() {
		return startpage;
	}



	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}



	public int getEndpage() {
		return endpage;
	}



	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}



	public boolean isPrev() {
		return prev;
	}



	public void setPrev(boolean prev) {
		this.prev = prev;
	}



	public boolean isNext() {
		return next;
	}



	public void setNext(boolean next) {
		this.next = next;
	}



	public int getTotal() {
		return total;
	}



	public void setTotal(int total) {
		this.total = total;
	}



	public criteria getCri() {
		return cri;
	}



	public void setCri(criteria cri) {
		this.cri = cri;
	}
	
	
	public int getRealend() {
		return realend;
	}

	public void setRealend(int realend) {
		this.realend = realend;
	}

	@Override
	public String toString() {
		return "PageVO [startpage=" + startpage + ", endpage=" + endpage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + "]";
	}
	
}