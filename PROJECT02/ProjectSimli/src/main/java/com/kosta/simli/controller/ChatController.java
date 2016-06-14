package com.kosta.simli.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.simli.dao.ChatDao;
import com.kosta.simli.dto.ChatNameDTO;
import com.kosta.simli.dto.ReserDTO;


@Controller
public class ChatController {
	@Autowired
	private SqlSession sqlSession;
	
	//채팅 - 대기화면
	@RequestMapping("/Chat_0_Waiting")
	public String Chat_0_Waiting(Model model, HttpServletRequest request, ReserDTO reserdto, ReserDTO reserdto3, ChatNameDTO chatnamedto) throws Exception {
		 
		ChatDao chatdao = sqlSession.getMapper(ChatDao.class);
	    
		//예약 번호
		int num = Integer.parseInt(request.getParameter("num"));
	    System.out.println("num : "+num);
	    model.addAttribute("num",num);
	    
	    reserdto = chatdao.loadReservation(num);
	    System.out.println("reserdto = chatdao.loadReservation();");
	    System.out.println("reserdto : "+reserdto);
	    
	    String reserDate = reserdto.getAppointday();
	    System.out.println("reserDate : "+reserDate);
	    System.out.println("reserdto : "+reserdto);
	    
	    int reserTime = reserdto.getAppointtime();
	    System.out.println("reserTime : "+reserTime);
	    
	    //"2016-06-02 11:57:47.0";
	    // '06 02 12:09:44 +0900 2016'
	    String delimiters1 = "\\b\\s";
	    String delimiters2 = "\\b-"; 
	    
		// 날짜 추출
	    String[] tokensVal1 = reserDate.split(delimiters1);
	   

	    // prints the number of tokens
	    System.out.println("Count of tokens = " + tokensVal1.length);
	    for (int i = 0; i < tokensVal1.length; i++) {
		       System.out.println("tokensVal1["+i+"] = "+tokensVal1[i]);
		}
	    
	    //날짜 분리 2016-06-27 -> 2016 06 27
	    String[] chatDateArray = tokensVal1[0].split(delimiters2);
	    
	    for (int i = 0; i < chatDateArray.length; i++) {
		       System.out.println("chatDateArray["+i+"] = "+chatDateArray[i]);
		}
	    
	    //시간 분리 
	    model.addAttribute("apYear",chatDateArray[0]);
	    model.addAttribute("apMon",chatDateArray[1]);
	    model.addAttribute("apDate",chatDateArray[2]);
	    int apHour = reserTime/100;
	    model.addAttribute("apHour",apHour);
	    int apMin = reserTime - apHour*100;
	    model.addAttribute("apMin",apMin);
	    System.out.println("apHour : "+apHour);
	    System.out.println("apMin : "+apMin);
	    
	    String ChatDate = chatDateArray[1]+" "+chatDateArray[2]+" "+apHour+":"+apMin+":00 +0900 "+chatDateArray[0];
	    //목표 : 06 27 12:09:44 +0900 2016
	    //결과 : 06 27 2016:00:00:00 +0900 2016
	    System.out.println("ChatDate : "+ChatDate);
	    model.addAttribute("ChatDate",ChatDate); //채팅 일시	
	    
	    
		//개인(50분) or 집단 상담(90분) 구분 
		reserdto3 = chatdao.howManyMem(num);
		String consultType = reserdto3.getConsulttype();
		System.out.println("consultType : " + consultType);
		model.addAttribute("consultType",consultType); //채팅 유형
	    
		
	    //상담자, 내담자, 보호자 이름
	    try {
	    	model.addAttribute("List", chatdao.getNames(num));
	    	chatnamedto = chatdao.getNames(num);
	    	String MemName=chatnamedto.getMemName(num);
	    	String EmpName=chatnamedto.getEmpName(num);
	    	String PtnName=chatnamedto.getPtnName(num);
	    	
	    	model.addAttribute("memName",MemName);
		    System.out.println("memName : "+MemName);
		    model.addAttribute("empName",EmpName);
		    System.out.println("empName : "+EmpName);
		    model.addAttribute("ptnName",PtnName);
		    System.out.println("ptnName : "+PtnName);
		} catch (Exception e) {
			System.out.println("예약 정보가 없습니다.");
		}
	    return "book.chatting.Chat_0_Waiting";
	}
		
	//채팅 - 화상채팅 시작
	@RequestMapping("/Chat_WebCam")
	public String Chat_WebCam(Model model, HttpServletRequest request, ReserDTO reserdto1, ReserDTO reserdto2, ReserDTO reserdto3, ChatNameDTO chatnamedto) throws Exception {
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		//채팅 방제 생성
		ChatDao chatdao = sqlSession.getMapper(ChatDao.class);
		model.addAttribute("chatDate", chatdao.makeChatroom(num));
		model.addAttribute("chatTime", chatdao.makeChatroom(num));
		model.addAttribute("member", chatdao.makeChatroom(num));
		model.addAttribute("employee", chatdao.makeChatroom(num));
		
		reserdto1 = chatdao.makeChatroom(num);
		
		String reserDate = reserdto1.getAppointday();
		int reserTime = reserdto1.getAppointtime();
		String mem = reserdto1.getMemberid();
		String emp = reserdto1.getEmployeeid();
		
		String delimiters1 = "\\b\\s";
	    String[] tokensVal = reserDate.split(delimiters1);
	    
		String ChatRoomName = tokensVal[0]+reserTime+mem+emp;
		
		System.out.println("ChatRoomName : "+ChatRoomName);
	    model.addAttribute("ChatRoomName",ChatRoomName);
	    
	    ////////////////////////////////////
	    //상담 종료시각 카운트 다운
	    System.out.println("num : "+num);
	    reserdto2 = chatdao.loadReservation(num);
	    
	    String reserDate2 = reserdto2.getAppointday();
	    System.out.println("reserDate : "+reserDate2);
	    System.out.println("reserdto : "+reserdto2);
	    
	    int reserTime2 = reserdto2.getAppointtime();
	    String delimiters2 = "\\b-"; 
	    
		// 날짜 추출
	    String[] tokensVal3 = reserDate2.split(delimiters1);
	   
	    // prints the number of tokens
	    System.out.println("Count of tokens = " + tokensVal3.length);
	    for (int i = 0; i < tokensVal3.length; i++) {
		       System.out.println("tokensVal1["+i+"] = "+tokensVal3[i]);
		}
	    
	    //날짜 분리 2016-06-27 -> 2016 06 27
	    String[] chatDateArray2 = tokensVal3[0].split(delimiters2);
	    
	    for (int i = 0; i < chatDateArray2.length; i++) {
		       System.out.println("chatDateArray["+i+"] = "+chatDateArray2[i]);
		}
	    
	    //시간 분리 
	    model.addAttribute("apYear",chatDateArray2[0]);
	    model.addAttribute("apMon",chatDateArray2[1]);
	    model.addAttribute("apDate",chatDateArray2[2]);
	    int apHour2 = reserTime2/100;
	    model.addAttribute("apHour",apHour2);
	    int apMin2 = reserTime2 - apHour2*100;
	    model.addAttribute("apMin",apMin2);
	    System.out.println("apHour : "+apHour2);
	    System.out.println("apMin : "+apMin2);
	    
	    String ChatDate2 = chatDateArray2[1]+" "+chatDateArray2[2]+" "+apHour2+":"+apMin2+":00 +0900 "+chatDateArray2[0];
	   
	    model.addAttribute("ChatDate2",ChatDate2); //채팅 일시	
	    
	    ////////////////////////////////////
	    //개인(50분) or 집단 상담(90분) 구분 
	    reserdto3 = chatdao.howManyMem(num);
	    String consultType = reserdto3.getConsulttype();
	    System.out.println("consultType : " + consultType);
	    model.addAttribute("consultType",consultType); //채팅 유형	

	    //////////////////////////////
	  //상담자, 내담자 이름
	    try {
	    	model.addAttribute("List", chatdao.getNames(num));
	    	chatnamedto = chatdao.getNames(num);
	    	String MemName=chatnamedto.getMemName(num);
	    	String EmpName=chatnamedto.getEmpName(num);
	    	String PtnName=chatnamedto.getPtnName(num);
	    	
	    	model.addAttribute("memName",MemName);
		    System.out.println("memName : "+MemName);
		    model.addAttribute("empName",EmpName);
		    System.out.println("empName : "+EmpName);
		    model.addAttribute("ptnName",PtnName);
		    System.out.println("ptnName : "+PtnName);
		} catch (Exception e) {
			System.out.println("예약 정보가 없습니다.");
		}
	    
	    
		return "book.chatting.Chat_WebCam";
	}
}
