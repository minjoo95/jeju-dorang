package com.kosta.dorang.dto;

public class TripPageMaker {
	private TripCriteria criteria;
	private int totalCount; //전체 아이템 개수
	private int startPage;	//시작 페이지
	private int endPage;	//끝 페이지
	private boolean prev;
	private boolean next;
	private int displayPage = 10; //페이지바 단위
	
	public TripCriteria getCriteria() {
		return criteria;
	}
	public void setCriteria(TripCriteria criteria) {
		this.criteria = criteria;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	private void calcData() {
		endPage = (int)(Math.ceil(criteria.getCurrentPage()/(double)displayPage) * displayPage);
		
		startPage = (endPage - displayPage) + 1;
		if(startPage <= 0) startPage = 1;
		
		int tempEndPage = (int)(Math.ceil(totalCount/(double)criteria.getPerPage()));
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
	}
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
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
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}

}
