package com.kosta.simli.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kosta.simli.dto.MemberDto;

public interface MemberDao {
	
	public void insertRole(@Param("id") String id, @Param("roleName") String roleName); // 회원가입시 권한자동추가
	public void join(MemberDto dto); // 회원가입
	public List<MemberDto> mypage(String id); // 임플로이페이지 / 마이페이지
	public void member_delete (String id); // 회원탈퇴
	public void role_delete (String id); // 회원탈퇴시 권한자동삭제
	public List<MemberDto> modify_view(String id); // 임플로이정보수정 뷰 / 유저정보수정 뷰
	public String member_phone(String id); // 회원정보 수정시 핸드폰번호 불러오기
	public void member_modify(MemberDto dto); // 임플로이정보수정 확인 / 유저정보수정 확인
	public String memberpart(String id);
	public int confirmID(String id); // 로그인 인증
	public String userCheck(String id); // 회원가입 아이디 중복확인
	public String modifyCheckPwd(String id); // 회원정보 수정 비민번호 인증
}
