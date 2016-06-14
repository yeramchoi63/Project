package com.kosta.simli.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.simli.dao.OnlineboardDAO;
import com.kosta.simli.dto.OnlineboardDTO;
import com.kosta.simli.dto.PageDTO;

@Controller
public class OnlineboardController {

	@Autowired
	private SqlSession session;

	@RequestMapping("/onList") // 리스트
	public String onList(Model model, PageDTO dto) throws Exception {
		System.out.println("user_admin!!!");
		System.out.println("startPage : " + dto.getPageStart());
		System.out.println("endPage : " + dto.getPageEnd());

		OnlineboardDAO dao = session.getMapper(OnlineboardDAO.class);
		model.addAttribute("dto", dto);
		// 카운트 세는 sql
		model.addAttribute("count", dao.userListCount());
		// list 받아오는 sql
		model.addAttribute("onList", dao.onlist(dto));

		return "board.onlineboard_view.list";
	}

	@RequestMapping("/ajax_onList") // 리스트
	public String ajaxonList(Model model, PageDTO dto) throws Exception {
		System.out.println("user_admin!!!");
		System.out.println("startPage : " + dto.getPageStart());
		System.out.println("endPage : " + dto.getPageEnd());

		OnlineboardDAO dao = session.getMapper(OnlineboardDAO.class);

		model.addAttribute("dto", dto);
		// 카운트 세는 sql
		model.addAttribute("count", dao.userListCount());
		// list 받아오는 sql
		model.addAttribute("onList", dao.onlist(dto));

		return "ajax.board.onlineboard_view.list";
	}

	@RequestMapping(value = "/onWriteview", method = RequestMethod.GET) // 쓰기화면
	public String writeForm(Model model) throws Throwable {
		return "board.onlineboard_view.write_view";
	}

	@RequestMapping(value = "/onWrite", method = RequestMethod.POST)
	public String write(Model model, HttpServletRequest request, OnlineboardDTO dto) throws Throwable {
		System.out.println("onWrite");
		OnlineboardDAO dao = session.getMapper(OnlineboardDAO.class);
		dto.setOnTitle(request.getParameter("onTitle"));
		dto.setOnName(request.getParameter("onName"));
		dto.setOnContent(request.getParameter("onContent"));
		dao.onWrite(dto);

		return "redirect:onList";
	}

	@RequestMapping(value = "/onContentview", method = RequestMethod.GET) // 컨텐츠뷰
																			// 화묜
	public String contentview(Model model, HttpServletRequest request, OnlineboardDTO dto) throws Throwable {

		OnlineboardDAO dao = session.getMapper(OnlineboardDAO.class);
		dto.setOnNum(Integer.parseInt(request.getParameter("onNum")));
		model.addAttribute("onlineboardDTO", dao.onContentview(dto));

		return "board.onlineboard_view.content_view";
	}

	@RequestMapping(value = "/onModifyView", method = RequestMethod.GET) // 수정
																			// 하고자
																			// 나타나는화며
	public String onModifyView(Model model, HttpServletRequest request, OnlineboardDTO dto) throws Throwable {

		OnlineboardDAO dao = session.getMapper(OnlineboardDAO.class);
		dto.setOnNum(Integer.parseInt(request.getParameter("onNum")));
		dto = dao.onModifyView(dto);
		model.addAttribute("onlineboardDTO", dto);

		return "board.onlineboard_view.modify_view";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST) // 수정완료 후
																	// 등록할때
	public String update(Model model, HttpServletRequest request, OnlineboardDTO dto) throws Throwable {
		System.out.println("onModify");
		OnlineboardDAO dao = session.getMapper(OnlineboardDAO.class);
		dto.setOnNum(Integer.parseInt(request.getParameter("onNum")));
		dto.setOnTitle(request.getParameter("onTitle"));
		dto.setOnContent(request.getParameter("onContent"));
		dao.onModifyUpdate(dto);

		return "redirect:onList";
	}

	@RequestMapping("/onDelete") // 삭제
	public String delete(HttpServletRequest request, OnlineboardDTO dto) {
		OnlineboardDAO dao = session.getMapper(OnlineboardDAO.class);
		dto.setOnNum(Integer.parseInt(request.getParameter("onNum")));
		dao.onDelete(dto);
		return "redirect:onList";
	}

	// 답글보기, 쓰기 기능
	@RequestMapping(value = "/onReplyView", method = RequestMethod.GET)
	public String reply_view(Model model, HttpServletRequest request, OnlineboardDTO dto) throws Throwable {
		System.out.println("onReplyView()");
		OnlineboardDAO dao = session.getMapper(OnlineboardDAO.class);
		dto.setOnNum(Integer.parseInt(request.getParameter("onNum")));
		dao.onReplyView(dto);
		model.addAttribute("onReplyView", dao.onReplyView(dto));
		return "board.onlineboard_view.reply_view";
	}

	@RequestMapping(value = "/onReply", method = RequestMethod.POST)
	public String reply(HttpServletRequest request, Model model, OnlineboardDTO dto) {
		System.out.println("onReply()");
		OnlineboardDAO dao = session.getMapper(OnlineboardDAO.class);
		dto.setOnNum(Integer.parseInt(request.getParameter("onNum")));
		dto.setOnName(request.getParameter("onName"));
		dto.setOnTitle(request.getParameter("onTitle"));
		dto.setOnContent(request.getParameter("onContent"));
		dto.setOnGroup(Integer.parseInt(request.getParameter("onGroup")));
		System.out.println("jjjjj" + request.getParameter("onStep"));
		dto.setOnStep(Integer.parseInt(request.getParameter("onStep")) + 1);
		System.out.println("ather" + dto.getOnStep());
		dto.setOnIndent(Integer.parseInt(request.getParameter("onIndent")) + 1);
		dao.onReply(dto);
		return "redirect:onList";
	}
}
