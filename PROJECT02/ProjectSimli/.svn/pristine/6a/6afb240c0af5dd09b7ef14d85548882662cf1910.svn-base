package com.kosta.simli.dto;

public class PageDTO {

	private int pageNum;
	private int pageSize;
	private int currentPage;

	public PageDTO() {
		this.pageNum = 1;
		this.pageSize = 10;
	}

	public void setPageNum(int pageNum) {
		if (pageNum <= 0) {
			this.pageNum = 1;
			return;
		} // if

		this.pageNum = pageNum;
	}

	public int getPageStart() { // mapper에서 쓴다.
		currentPage = pageNum;
		return (currentPage * pageSize) - 9;
	}

	public int getPageEnd() { // mapper에서 쓴다.
		currentPage = pageNum;
		return (currentPage * pageSize);
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

}