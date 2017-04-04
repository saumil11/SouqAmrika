package com.codelab.souqamrika.dto;

import java.io.Serializable;

public class PaginationBO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1971835065433541024L;
	
	private int page;
	private int limit;
	private String sidx;
	private String sord;
	private String default_column;
	private String status_column;
	private String pageClass;
	private int total_pages;
	private int start;
	private int records;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public String getSidx() {
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
	public int getTotal_pages() {
		return total_pages;
	}
	public void setTotal_pages(int total_pages) {
		this.total_pages = total_pages;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getRecords() {
		return records;
	}
	public void setRecords(int records) {
		this.records = records;
	}
	public String getPageClass() {
		return pageClass;
	}
	public void setPageClass(String pageClass) {
		this.pageClass = pageClass;
	}
	public String getDefault_column() {
		return default_column;
	}
	public void setDefault_column(String default_column) {
		this.default_column = default_column;
	}
	public String getStatus_column() {
		return status_column;
	}
	public void setStatus_column(String status_column) {
		this.status_column = status_column;
	}
	
}
