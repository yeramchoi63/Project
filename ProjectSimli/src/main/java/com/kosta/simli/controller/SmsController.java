package com.kosta.simli.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.simli.dao.SmsDao;
import com.kosta.simli.dto.MemberDto;
import com.kosta.simli.dto.PageDTO;
import com.kosta.simli.dto.SmsDto;

@Controller
public class SmsController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("smssend")
	public String sendview(Principal principal, Model model) {
		String fromid = principal.getName();
		System.out.println("id" + fromid);
		model.addAttribute("fromid", fromid);
		return "popup.mem.sms.smssend";
	}

	@RequestMapping("smssendok")
	public String sendokview(SmsDto dto, MemberDto memberDto, Model model, HttpServletRequest request) {
		SmsDao dao = sqlSession.getMapper(SmsDao.class);
		String toid = request.getParameter("toid");
		memberDto = dao.checkid(toid);
		if (memberDto == null) {
			model.addAttribute("idok", "no");
			return "ajax.mem.sms.smssend";
		}

		dao.insert(dto);
		return "ajax.mem.sms.smssendok";
	}

	@RequestMapping("smslist")
	public String smslistview(SmsDto smsDto, PageDTO pageDTO, Principal principal, Model model) {
		SmsDao dao = sqlSession.getMapper(SmsDao.class);
		smsDto.setToid(principal.getName());
		List<SmsDto> list = dao.smslist(smsDto, pageDTO);
		model.addAttribute("dto", pageDTO);
		model.addAttribute("count", dao.smsListCount());
		model.addAttribute("list", list);
		return "mem.sms.smslist";
	}

	@RequestMapping("smsdelete")
	public String smsdelete(SmsDto dto) {
		SmsDao dao = sqlSession.getMapper(SmsDao.class);
		dao.delete(dto);
		return "redirect:smslist";
	}

	@RequestMapping("smscontent")
	public String consms(SmsDto dto, Model model) {
		SmsDao dao = sqlSession.getMapper(SmsDao.class);
		dao.smsread(dto);
		dto = dao.consms(dto);
		model.addAttribute("dto", dto);
		return "mem.sms.smscontent";
	}

	@RequestMapping("rplsend")
	public String rplsendview(HttpServletRequest request, Principal principal, Model model) {
		String toid = request.getParameter("toid");
		String fromid = principal.getName();
		model.addAttribute("toid", toid);
		model.addAttribute("fromid", fromid);
		return "popup.mem.sms.smssend";
	}
	
	@RequestMapping("ajax_smslist")
	public String ajaxsmslistview(SmsDto smsDto, PageDTO pageDTO, Principal principal, Model model) {
		SmsDao dao = sqlSession.getMapper(SmsDao.class);
		smsDto.setToid(principal.getName());
		List<SmsDto> list = dao.smslist(smsDto, pageDTO);
		model.addAttribute("dto", pageDTO);
		model.addAttribute("count", dao.smsListCount());
		model.addAttribute("list", list);
		return "ajax.mem.sms.smslist";
	}

}
