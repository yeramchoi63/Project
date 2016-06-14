package com.kosta.simli.dao;

import java.util.List;

import com.kosta.simli.dto.MemberDto;
import com.kosta.simli.dto.ReserDTO;
import com.kosta.simli.dto.ScheduleDTO;

public interface MypageDAO {
	public List<ScheduleDTO> scheduleList();

	public List<MemberDto> employeepage_view(String id);

	public List<ScheduleDTO> employee_scheduleCheck(String id);

	public List<ReserDTO> reserMemberList(String id);

	public List<ReserDTO> reserEmployeeList(String id);

	public void reserManage_Employee_Update(String reRef, int reNum);

	public void reserDelete(int reNum);

	public String payConfirmPartCheck(String id);

	public int IndiviConsultCount(String id, String year, String month);

	public int IndiviTherapyCount(String id, String year, String month);

	public int groupConsultCount(String id, String year, String month);

	public int groupTherapyCount(String id, String year, String month);

	public int examinationCount(String id, String year, String month);

	public int therapistTherapyCount(String id, String year, String month);

	public List<ReserDTO> searchAppointdaySchedule(String appointday);
}
