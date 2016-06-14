package com.kosta.simli.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kosta.simli.dto.MemberDto;
import com.kosta.simli.dto.ReserDTO;
import com.kosta.simli.dto.ScheduleDTO;

public interface AdminDAO {
	
	////////////////////// 관리자 //////////////////////
	
	public List<ScheduleDTO> scheduleList();
	public void adminRole_join(@Param("id") String id, @Param("roleName") String roleName);
	public void admin_join(MemberDto dto);
	public String schedule_join(MemberDto dto);
	public List<MemberDto>adminpage_view(String id);
	public List<MemberDto>adminmodify_view(String id); // 관리자 정보변경 뷰
	public String adminmember_phone(String id); // 핸드폰번호만 따로 가져옴
	public void adminmember_modify(MemberDto dto);
	public List<MemberDto> adminmember_list();
	public List<MemberDto> employeemember_list();
	public List<MemberDto> usermember_list();
	public List<MemberDto> adminmember_content(String id);
	public void adminmlist_delete(MemberDto dto);
	public void adminmrole_delete(MemberDto dto);
	public void schedule_delete(String id);
	
	public List<MemberDto> employeeNameList(String part);//직원 이름 리스트
	public List<Integer> categoryPriceMonthList(String id, String year, String month);
	
	public List<ReserDTO> userMoneyYearList(String year);
	public List<ReserDTO> userMoneyMonthList(String year, String month);
}
