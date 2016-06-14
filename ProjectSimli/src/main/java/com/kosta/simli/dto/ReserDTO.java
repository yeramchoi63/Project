package com.kosta.simli.dto;

import java.util.Date;

public class ReserDTO {

	private int num;
	private String memberid;
	private Date currentday;
	private String appointday;
	private String appointweek;
	private int appointtime, ahour, aminute;
	private String patron;
	private String memberconsult, employeeid, ref, appointcheck, resertype, consulttype;
	private int categoryprice;
	private String memname, empname;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public Date getCurrentday() {
		return currentday;
	}

	public void setCurrentday(Date currentday) {
		this.currentday = currentday;
	}

	public String getAppointday() {
		return appointday;
	}

	public void setAppointday(String appointday) {
		this.appointday = appointday;
	}

	public String getAppointweek() {
		return appointweek;
	}

	public void setAppointweek(String appointweek) {
		this.appointweek = appointweek;
	}

	public int getAppointtime() {
		return appointtime;
	}

	public void setAppointtime(int appointtime) {
		this.appointtime = appointtime;
	}

	public int getAhour() {
		return ahour;
	}

	public void setAhour(int ahour) {
		this.ahour = ahour;
	}

	public int getAminute() {
		return aminute;
	}

	public void setAminute(int aminute) {
		this.aminute = aminute;
	}

	public String getPatron() {
		return patron;
	}

	public void setPatron(String patron) {
		this.patron = patron;
	}

	public String getMemberconsult() {
		return memberconsult;
	}

	public void setMemberconsult(String memberconsult) {
		this.memberconsult = memberconsult;
	}

	public String getEmployeeid() {
		return employeeid;
	}

	public void setEmployeeid(String employeeid) {
		this.employeeid = employeeid;
	}

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}

	public String getAppointcheck() {
		return appointcheck;
	}

	public void setAppointcheck(String appointcheck) {
		this.appointcheck = appointcheck;
	}

	public String getResertype() {
		return resertype;
	}

	public void setResertype(String resertype) {
		this.resertype = resertype;
	}

	public String getConsulttype() {
		return consulttype;
	}

	public void setConsulttype(String consulttype) {
		this.consulttype = consulttype;
	}

	public int getCategoryprice() {
		return categoryprice;
	}

	public void setCategoryprice(int categoryprice) {
		this.categoryprice = categoryprice;
	}

	public String getMemname() {
		return memname;
	}

	public void setMemname(String memname) {
		this.memname = memname;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public ReserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReserDTO(int num, String memberid, Date currentday, String appointday, String appointweek, int appointtime,
			int ahour, int aminute, String patron, String memberconsult, String employeeid, String ref,
			String appointcheck, String resertype, String consulttype, int categoryprice, String memname,
			String empname) {
		super();
		this.num = num;
		this.memberid = memberid;
		this.currentday = currentday;
		this.appointday = appointday;
		this.appointweek = appointweek;
		this.appointtime = appointtime;
		this.ahour = ahour;
		this.aminute = aminute;
		this.patron = patron;
		this.memberconsult = memberconsult;
		this.employeeid = employeeid;
		this.ref = ref;
		this.appointcheck = appointcheck;
		this.resertype = resertype;
		this.consulttype = consulttype;
		this.categoryprice = categoryprice;
		this.memname = memname;
		this.empname = empname;
	}

}
