package com.kosta.simli.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kosta.simli.dto.FileUploadDTO;
import com.kosta.simli.dto.ReserDTO;




public interface FileUploadDAO {
	public int insert(FileUploadDTO fdto) throws ClassNotFoundException, SQLException;
	public List<FileUploadDTO> list(String writer, String category); 
	public FileUploadDTO content(FileUploadDTO fdto); 
	public String uploadlist(String writer);
	public String membersearch(String writer);
	public String employeeidsearch(String writer);
	public List<FileUploadDTO> partlist(String category,String writer);
	public void u_delete(String writer, int num);
	public String writersearch(int num);
}
