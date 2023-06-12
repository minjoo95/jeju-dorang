package com.kosta.dorang.dto;

public class TripCriteria {
	private int currentPage; //현재 페이지
	private int perPage; 	 //페이지당 아이템 개수
	private String search;	 //검색, 테마
	private int pageStart;   //페이지의 시작 인덱스
	
	public TripCriteria() {
		this.currentPage = 1;
		this.perPage = 20;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		if(currentPage <= 0) {
			this.currentPage = 1;
		} else {
			this.currentPage = currentPage;
		}
	}
	
	public int getPerPage() {
		return perPage;
	}
	
	public void setPerPage(int pageCount) {
		int count = this.perPage;
		if(pageCount != count) {
			this.perPage = count;
		} else {
			this.perPage = pageCount;
		}
	}
	
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
	public int getPageStart() {
		return (this.currentPage - 1) * perPage;
	}
	
	
}