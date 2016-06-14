package com.kosta.simli.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.simli.dao.MemberDao;
import com.kosta.simli.dto.MemberDto;

@Controller
public class MemberController {

	@Autowired
	private SqlSession sqlSession;

	// 로그인
	@RequestMapping("/login")
	public String login_view(Model model, HttpServletRequest request, MemberDto dto) {

		return "mem.member.login";
	}

	// 회원가입 데이터처리
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(Model model, HttpServletRequest request, MemberDto dto) throws Exception {

		MemberDao dao = sqlSession.getMapper(MemberDao.class);

		String inputId = request.getParameter("id");
		String userId = dao.userCheck(request.getParameter("id"));

		if (!inputId.equals(userId)) {

			String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-"
					+ request.getParameter("phone3");

			dto.setId(request.getParameter("id"));
			dto.setPwd(request.getParameter("pwd"));
			dto.setName(request.getParameter("name"));
			dto.setEmail(request.getParameter("email"));
			dto.setPhone(phone);
			dto.setGender(request.getParameter("gender"));
			dto.setBirth(request.getParameter("birth"));
			dto.setAddr(request.getParameter("addr"));

			dao.join(dto);
			model.addAttribute("request", request);

			// 권한부여
			if (dto.getId() != null) {
				if (dto.getId().contains("admin")) {
					System.out.println("여기는? " + dto.getId());
					dao.insertRole(dto.getId(), "ROLE_USER");
					dao.insertRole(dto.getId(), "ROLE_EMPLOYEE");
					dao.insertRole(dto.getId(), "ROLE_ADMIN");
				} else if (dto.getId().contains("employee")) {
					dao.insertRole(dto.getId(), "ROLE_EMPLOYEE");
					dao.insertRole(dto.getId(), "ROLE_PKEMPLOYEE");
					dao.insertRole(dto.getId(), "ROLE_USER");
				} else {
					dao.insertRole(dto.getId(), "ROLE_USER");
					dao.insertRole(dto.getId(), "ROLE_PKUSER");
				}
			}
			return "redirect:/";
		} else {
			return "mem.member.join_fail";
		}
	}

	@RequestMapping("/confirmID")
	public String confirmID(Model model, HttpServletRequest request) {

		MemberDao dao = sqlSession.getMapper(MemberDao.class);

		model.addAttribute("id", request.getParameter("id"));
		model.addAttribute("check", dao.confirmID(request.getParameter("id")));

		return "popup.mem.member.confirmID";
	}

	@RequestMapping("/mypage_view")
	public String MyPage(Model model, Principal principal) throws Exception {

		System.out.println(principal.getName());

		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		model.addAttribute("list", dao.mypage(principal.getName()));

		return "mem.member.mypage_view";
	}

	@RequestMapping("/member_delete")
	public String member_delete(HttpServletRequest request, Principal principal, String id) {

		System.out.println(principal.getName());
		MemberDao dao = sqlSession.getMapper(MemberDao.class);

		dao.member_delete(principal.getName());
		dao.role_delete(principal.getName());

		return "redirect:/logout";
	}

	@RequestMapping(value = "/modify_view", method = RequestMethod.GET)
	public String modify_view_get(Model model) {

		model.addAttribute("inputpwd", "");

		return "mem.member.modify_view";
	}

	@RequestMapping(value = "/modify_view", method = RequestMethod.POST)
	public String modify_view(Model model, Principal principal, HttpServletRequest request) throws Exception {

		MemberDao dao = sqlSession.getMapper(MemberDao.class);

		String userpwd = dao.modifyCheckPwd(principal.getName());
		String inputPwd = request.getParameter("pwd");

		if (userpwd.equals(inputPwd)) {

			model.addAttribute("list", dao.modify_view(principal.getName()));
			String phone = dao.member_phone(principal.getName());
			String[] str = phone.split("-");

			model.addAttribute("phone1", str[0]);
			model.addAttribute("phone2", str[1]);
			model.addAttribute("phone3", str[2]);

			model.addAttribute("dbpwd", userpwd);
			model.addAttribute("inputpwd", inputPwd);

			return "mem.member.modify_view";
		} else {
			model.addAttribute("dbpwd", userpwd);
			model.addAttribute("inputpwd", inputPwd);
			return "mem.member.modify_view";
		}
	}

	@RequestMapping(value = "member_modify", method = RequestMethod.POST)
	public String member_modify(Model model, Principal principal, HttpServletRequest request, MemberDto dto)
			throws Exception {

		String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-"
				+ request.getParameter("phone3");
		System.out.println(phone);

		dto.setId(request.getParameter("id"));
		dto.setPwd(request.getParameter("pwd"));
		dto.setEmail(request.getParameter("email"));
		dto.setPhone(phone);
		dto.setAddr(request.getParameter("addr"));
		dto.setTherapy1(request.getParameter("therapy1"));
		dto.setTherapy2(request.getParameter("therapy2"));
		dto.setTherapy3(request.getParameter("therapy3"));
		dto.setPart(request.getParameter("part"));

		MemberDao dao = sqlSession.getMapper(MemberDao.class);

		dao.member_modify(dto);

		model.addAttribute("list", dao.mypage(principal.getName()));

		return "mem.member.mypage_view";
	}

	@RequestMapping("/ajax_mypage_view")
	public String ajaxMyPage(Model model, Principal principal) throws Exception {

		System.out.println(principal.getName());

		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		model.addAttribute("list", dao.mypage(principal.getName()));

		return "ajax.mem.member.mypage_view";
	}
}