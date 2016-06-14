package com.kosta.simli.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.simli.dao.NoticeDAO;
import com.kosta.simli.dto.NoticeDTO;

@Controller
public class NoticeController {

	@Autowired
	private SqlSession session;

	@RequestMapping("/noList") // 리스트
	public String nolist(Model model) throws Exception {

		NoticeDAO noticeDAO = session.getMapper(NoticeDAO.class);
		model.addAttribute("noList", noticeDAO.noList());
		return "board.notice_view.list";
	}

	@RequestMapping("/ajax_noList") // 리스트
	public String ajaxnolist(Model model) throws Exception {

		NoticeDAO noticeDAO = session.getMapper(NoticeDAO.class);
		model.addAttribute("noList", noticeDAO.noList());
		return "ajax.board.notice_view.list";
	}

	@RequestMapping(value = "/noWriteView", method = RequestMethod.GET) // 쓰기화면
	public String writeForm(Model model) throws Throwable {
		return "board.notice_view.write_view";
	}

	@RequestMapping(value = "/noWrite", method = RequestMethod.POST)
	public String write(Model model, HttpServletRequest request, NoticeDTO noticeDTO) throws Throwable {
		System.out.println("write");
		NoticeDAO noticeDAO = session.getMapper(NoticeDAO.class);
		noticeDTO.setNoTitle(request.getParameter("noTitle"));
		noticeDTO.setNoName(request.getParameter("noName"));
		noticeDTO.setNoContent(request.getParameter("noContent"));
		noticeDAO.noWrite(noticeDTO);

		return "redirect:noList";
	}

	@RequestMapping(value = "/nomodify", method = RequestMethod.POST) // 수정하기
	public String update(Model model, HttpServletRequest request, NoticeDTO noticeDTO) throws Throwable {
		System.out.println("nomodify");
		NoticeDAO noticeDAO = session.getMapper(NoticeDAO.class);
		noticeDTO.setNoNum(Integer.parseInt(request.getParameter("noNum")));
		noticeDTO.setNoTitle(request.getParameter("noTitle"));
		noticeDTO.setNoContent(request.getParameter("noContent"));
		noticeDAO.noModifyUpdate(noticeDTO);

		return "redirect:noList";
	}

	@RequestMapping(value = "/noContentView", method = RequestMethod.GET) // content화면
	public String contentview(Model model, HttpServletRequest request, NoticeDTO noticeDTO) throws Throwable {

		NoticeDAO dao = session.getMapper(NoticeDAO.class);
		noticeDTO.setNoNum(Integer.parseInt(request.getParameter("noNum")));
		model.addAttribute("noticeDTO", dao.noContentView(noticeDTO));

		return "board.notice_view.content_view";
	}

	@RequestMapping("/noModifyView") // 수정하고자 나타나는 화면 
																	
	public String onModifyView(Model model, HttpServletRequest request, NoticeDTO dto) throws Throwable {

		NoticeDAO dao = session.getMapper(NoticeDAO.class);
		dto.setNoNum(Integer.parseInt(request.getParameter("noNum")));
		dto = dao.noModifyView(dto);
		model.addAttribute("noticeDTO", dto);

		return "board.notice_view.modify_view";
	}

	@RequestMapping("/noDelete") // 삭제
	public String delete(HttpServletRequest request, NoticeDTO ndto) {
		NoticeDAO dao = session.getMapper(NoticeDAO.class);
		ndto.setNoNum(Integer.parseInt(request.getParameter("noNum")));
		dao.noDelete(ndto);
		return "redirect:noList";
	}
}
