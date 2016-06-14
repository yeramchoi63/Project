package com.kosta.simli.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kosta.simli.dto.ExemDto;
import com.kosta.simli.dto.ScheduleDTO;


public interface SchedultDao {
	public List<ScheduleDTO> list(int appointtime, String appointday , String daystart , String dayend);
	public List<ScheduleDTO> grouplist(int appointtime, String appointday , String daystart , String dayend); //집단
	public List<ScheduleDTO> threpysearch(int appointtime, String appointday , String daystart , String dayend);
	public List<ScheduleDTO> examinerlist(int appointtime, String appointday , String daystart , String dayend);
}
