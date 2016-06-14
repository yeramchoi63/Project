package com.kosta.simli.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.simli.dao.ExemDao;

@Controller
public class ExemController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/exemlist")
	public String exemlist(Model model) throws Throwable {
		System.out.println("여기서");
		ExemDao exemDao = sqlSession.getMapper(ExemDao.class);
		System.out.println("리스트를");
		model.addAttribute("list", exemDao.exemlist());
		System.out.println("뷰로 보냅니다." + exemDao.exemlist());
		return "exemlist.list";
		/* return "폴더명.파일명" */
	}

	@RequestMapping("/other1")
	public String other1(Model model) throws Throwable {
		return "exemlist.other1";
		/* return "폴더명.파일명" */
	}

	@RequestMapping("/other2")
	public String other2(Model model) throws Throwable {
		return "exemlist.other2";
		/* return "폴더명.파일명" */
	}

	@RequestMapping("/other3")
	public String other3(Model model) throws Throwable {
		return "exemlist.other3";
		/* return "폴더명.파일명" */
	}

	@RequestMapping("/ajaxView1")
	public String view1() {
		return "other2";
	}

	@RequestMapping("/ajaxView2")
	public String view2() {
		return "other3";
	}

}
