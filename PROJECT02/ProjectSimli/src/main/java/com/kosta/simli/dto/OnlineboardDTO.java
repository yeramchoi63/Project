package com.kosta.simli.dto;

import java.sql.Timestamp;

public class OnlineboardDTO {
  private int onNum, onGroup, onStep, onIndent;
  private String onTitle, onContent, onName;
  private Timestamp onDate;

  
  
  public int getOnNum() {
	return onNum;
}
public void setOnNum(int onNum) {
	this.onNum = onNum;
}
public int getOnGroup() {
	return onGroup;
}
public void setOnGroup(int onGroup) {
	this.onGroup = onGroup;
}
public int getOnStep() {
	return onStep;
}
public void setOnStep(int onStep) {
	this.onStep = onStep;
}
public int getOnIndent() {
	return onIndent;
}
public void setOnIndent(int onIndent) {
	this.onIndent = onIndent;
}
public String getOnTitle() {
	return onTitle;
}
public void setOnTitle(String onTitle) {
	this.onTitle = onTitle;
}
public String getOnContent() {
	return onContent;
}
public void setOnContent(String onContent) {
	this.onContent = onContent;
}
public String getOnName() {
	return onName;
}
public void setOnName(String onName) {
	this.onName = onName;
}
public Timestamp getOnDate() {
	return onDate;
}
public void setOnDate(Timestamp onDate) {
	this.onDate = onDate;
}

public OnlineboardDTO() {
	
}


public OnlineboardDTO(int onNum, int onGroup, int onStep, int onIndent, String onTitle, String onContent, String onName,
		Timestamp onDate) {
	super();
	this.onNum = onNum;
	this.onGroup = onGroup;
	this.onStep = onStep;
	this.onIndent = onIndent;
	this.onTitle = onTitle;
	this.onContent = onContent;
	this.onName = onName;
	this.onDate = onDate;
}

  
  
 
  
  
  
}
   
    



