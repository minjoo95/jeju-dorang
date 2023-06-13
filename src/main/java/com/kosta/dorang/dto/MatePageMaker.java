package com.kosta.dorang.dto;

public class MatePageMaker {
  
	 private int totalCount; 
	  private int startPage; 
	  private int endPage; 
	  private boolean prev; 
	  private boolean next; 
	  private int displayPageNum=5; 
	
	  public void setTotalCount(int totalCount) {
		  this.totalCount=totalCount;
		  makePaging();
	  }
	  private void makePaging() {
		
		endPage=(int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		
		startPage=(endPage-displayPageNum)+1;
		if(startPage<=0) startPage=1;
		
		int tempEndPage=(int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
	
		if(tempEndPage<endPage) {
			endPage=tempEndPage;		
		}
	
		prev=(startPage==1) ? false : true;
		
		next=(endPage<tempEndPage)? true : false;
	  }
	  private MateCriteria cri;
	  public MateCriteria getCri() {
		return cri;
	}
	public void setCri(MateCriteria cri) {
		this.cri = cri;
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
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public int getTotalCount() {
		return totalCount;
	}
	  
	  
	
	  

}

