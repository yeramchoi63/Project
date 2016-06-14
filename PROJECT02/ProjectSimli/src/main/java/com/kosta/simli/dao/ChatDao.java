package com.kosta.simli.dao;

import com.kosta.simli.dto.ChatNameDTO;
import com.kosta.simli.dto.ReserDTO;

public interface ChatDao {

	//예약 번호
	public ReserDTO loadReservation(int num);

	//채팅방 만들기
	public ReserDTO makeChatroom(int num);
	
	//상담자, 내담자 이름 불러오기
	public ChatNameDTO getNames(int num);
	
	//개인(50분) or 집단(80분) 불러오기
	public ReserDTO howManyMem(int num);

}
