package com.kosta.simli.dto;

public class ChatNameDTO {
	private String memName, empName, ptnName;

	public String getMemName(int num) {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getEmpName(int num) {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}
	
	public String getPtnName(int num) {
		return ptnName;
	}

	public void setPtnName(String ptnName) {
		this.ptnName = ptnName;
	}
	

	public ChatNameDTO() {
		// TODO Auto-generated constructor stub
	}

	public ChatNameDTO(String memName, String empName, String ptnName) {
		super();
		this.memName = memName;
		this.empName = empName;
		this.ptnName = ptnName;
	}
	
}
