package com.kosta.simli.dto;

public class ConresultDto {

	private String name,appointday,memberconsult,id,therapy1;
	private int appointtime;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAppointday() {
		return appointday;
	}
	public void setAppointday(String appointday) {
		this.appointday = appointday;
	}
	public String getMemberconsult() {
		return memberconsult;
	}
	public void setMemberconsult(String memberconsult) {
		this.memberconsult = memberconsult;
	}
	public int getAppointtime() {
		return appointtime;
	}
	public void setAppointtime(int appointtime) {
		this.appointtime = appointtime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTherapy1() {
		return therapy1;
	}
	public void setTherapy1(String therapy1) {
		this.therapy1 = therapy1;
	}
	public ConresultDto(){
		
	}
	public ConresultDto(String name, String appointday, String memberconsult, String id, String therapy1,
			int appointtime) {
		super();
		this.name = name;
		this.appointday = appointday;
		this.memberconsult = memberconsult;
		this.id = id;
		this.therapy1 = therapy1;
		this.appointtime = appointtime;
	}
	
}
