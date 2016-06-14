package com.kosta.simli.dao;

import java.util.List;

import com.kosta.simli.dto.NoticeDTO;



public interface NoticeDAO {

	 //목록보기
	   public List<NoticeDTO>noList();
	 //글쓰기
	   public void noWrite(NoticeDTO noticeDTO);
	 //수정하기
	   public void noModifyUpdate(NoticeDTO noticeDTO);
	 //컨텐츠
	   public NoticeDTO noContentView(NoticeDTO noticeDTO);
	 //삭제
	   public void noDelete(NoticeDTO noticeDTO);
	   
	 //modiftView
	  public NoticeDTO noModifyView(NoticeDTO noticeDTO);
}
