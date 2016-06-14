package com.kosta.simli.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;


import org.springframework.web.servlet.view.tiles2.TilesView;
public class FileUploadDTO {
	private int num;
	private String title;
	private String writer;
	private Date regdate;
	private String fileSrc; //업로드한  파일 이름_1
	private String content;
	private String category;
	private String employeeid;
	
	
	

 //멀티 파일 업로드///////////////////////////////
	private List<CommonsMultipartFile> files;
		
	public List<CommonsMultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<CommonsMultipartFile> files) {
		this.files = files;
	}
	////////////////////////////////////////////////

	
	
	
	public String getFileSrc() {
		return fileSrc;
	}
	public String getEmployeeid() {
		return employeeid;
	}
	public void setEmployeeid(String employeeid) {
		this.employeeid = employeeid;
	}
	public void setFileSrc(String fileSrc) {
		this.fileSrc = fileSrc;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
