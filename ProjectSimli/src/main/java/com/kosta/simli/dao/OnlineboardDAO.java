package com.kosta.simli.dao;

import java.util.List;

import com.kosta.simli.dto.OnlineboardDTO;
import com.kosta.simli.dto.PageDTO;

public interface OnlineboardDAO {

	// 온라인상담게시판 목록보기
	public List<OnlineboardDTO> onlist(PageDTO dto);

	// 글쓰기
	public void onWrite(OnlineboardDTO onlineboardDTO);

	// 컨텐츠
	public OnlineboardDTO onContentview(OnlineboardDTO onlineboardDTO);

	// 수정하기
	public void onModifyUpdate(OnlineboardDTO onlineboardDTO);

	// 삭제
	public void onDelete(OnlineboardDTO onlineboardDTO);

	// 리플 뷰
	public OnlineboardDTO onReplyView(OnlineboardDTO onlineboardDTO);

	// 리플 달기
	public void onReply(OnlineboardDTO onlineboardDTO);

	public int userListCount();

	public OnlineboardDTO onModifyView(OnlineboardDTO onlineboardDTO);
}
