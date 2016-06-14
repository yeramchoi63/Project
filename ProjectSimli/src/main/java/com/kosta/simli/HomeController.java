package com.kosta.simli;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.simli.dao.OnlineboardDAO;
import com.kosta.simli.dto.PageDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String onList(Model model, PageDTO pageDTO) throws Exception {

		OnlineboardDAO ondao = sqlSession.getMapper(OnlineboardDAO.class);
		model.addAttribute("onList", ondao.onlist(pageDTO));

		return "home.main";
	}

}
