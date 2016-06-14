package com.kosta.simli.dao;

import java.util.HashMap;
import java.util.List;

import com.kosta.simli.dto.ConresultDto;
import com.kosta.simli.dto.MemberDto;
import com.kosta.simli.dto.ReserDTO;


public interface ReservationDao {
	public int insert(ReserDTO rdto);

	public void delete(ReserDTO rdto);

	public void upid(ReserDTO rdto);
	
	public List<ReserDTO> search2();

	public String msearch(String id);
	
	public List<ConresultDto> conresult(String id);
	
	public void therapyupdate(ReserDTO rdto);
	
	public List<ConresultDto> conready(String employeeid);
	
	public List<ReserDTO> exsearch();

	public void therapyinsert(ReserDTO rdto);

	public void therapyreg(ReserDTO rdto);

	public List<ReserDTO> consearch(String id);
	
	public String patronsearch(String id);
	
	public String partsearch(String id);
	
	public List<ReserDTO> threapyoverlap(String memberid);
}
