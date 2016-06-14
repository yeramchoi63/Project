package com.kosta.simli.dto;

public class ExemDto {
	private int exnum;
	private String extitle, exname, excon;
	
	public int getExnum() {
		return exnum;
	}
	public void setExnum(int exnum) {
		this.exnum = exnum;
	}
	public String getExtitle() {
		return extitle;
	}
	public void setExtitle(String extitle) {
		this.extitle = extitle;
	}
	public String getExname() {
		return exname;
	}
	public void setExname(String exname) {
		this.exname = exname;
	}
	public String getExcon() {
		return excon;
	}
	public void setExcon(String excon) {
		this.excon = excon;
	}
	
	public ExemDto() {}
	
	public ExemDto(int exnum, String extitle, String exname, String excon) {
		super();
		this.exnum = exnum;
		this.extitle = extitle;
		this.exname = exname;
		this.excon = excon;
	}
	
	
}
