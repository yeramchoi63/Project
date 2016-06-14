package com.kosta.simli.dao;

import java.util.List;

import com.kosta.simli.dto.MemberDto;
import com.kosta.simli.dto.PageDTO;
import com.kosta.simli.dto.SmsDto;

public interface SmsDao {

	public void insert(SmsDto smsDto);

	public List<SmsDto> smslist(SmsDto smsDto, PageDTO pageDTO);

	public void delete(SmsDto smsDto);

	public SmsDto consms(SmsDto smsDto);

	public MemberDto checkid(String toid);

	public int smsListCount();

	public void smsread(SmsDto smsDto);

	public int smsreadCount(SmsDto smsDto);

}
