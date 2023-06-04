package com.kosta.dorang.dto;


public class MateCriteria {
	
	   private int page; 
	   private int perPageNum;
	   
	   public int getPage() {
		return page;
		}
		public void setPage(int page) {
			this.page = page;
		}
		public int getPerPageNum() {
			return perPageNum;
		}
		public void setPerPageNum(int perPageNum) {
			this.perPageNum = perPageNum;
		}
		public MateCriteria() {
			   
		 }
		public int getPageStart() {
			   return (page-1)*perPageNum;                                    
		   }

    
}
