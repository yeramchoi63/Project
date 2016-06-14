package com.kosta.simli.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TherapyController {

	@RequestMapping(value = "/gametherapy", method = RequestMethod.GET) // 놀이치료
	public String gametherapy(Model model) throws Throwable {
		return "board.therapy.gametherapy";
	}

	@RequestMapping(value = "/arttherapy", method = RequestMethod.GET) // 미술치료
	public String arttherapy(Model model) throws Throwable {
		return "board.therapy.arttherapy";
	}

	@RequestMapping(value = "/speechtherapy", method = RequestMethod.GET) // 언어치료
	public String speechtherapy(Model model) throws Throwable {
		return "board.therapy.speechtherapy";
	}

	@RequestMapping(value = "/readtherapy", method = RequestMethod.GET) // 독서치료
	public String readtherapy(Model model) throws Throwable {
		return "board.therapy.readtherapy";
	}

	@RequestMapping(value = "/musictherapy", method = RequestMethod.GET) // 음악치료
	public String musictherapy(Model model) throws Throwable {
		return "board.therapy.musictherapy";
	}

	@RequestMapping(value = "/playtherapy", method = RequestMethod.GET) // 연극치료
	public String playtherapy(Model model) throws Throwable {
		return "board.therapy.playtherapy";
	}

	@RequestMapping(value = "/mediatherapy", method = RequestMethod.GET) // 미디어치료
	public String mediatherapy(Model model) throws Throwable {
		return "board.therapy.mediatherapy";
	}

	/* ajax */

	@RequestMapping(value = "/ajax_gametherapy", method = RequestMethod.GET) // 놀이치료
	public String ajaxgametherapy(Model model) throws Throwable {
		return "ajax.board.therapy.gametherapy";
	}

	@RequestMapping(value = "/ajax_arttherapy", method = RequestMethod.GET) // 미술치료
	public String ajaxarttherapy(Model model) throws Throwable {
		return "ajax.board.therapy.arttherapy";
	}

	@RequestMapping(value = "/ajax_speechtherapy", method = RequestMethod.GET) // 언어치료
	public String ajaxspeechtherapy(Model model) throws Throwable {
		return "ajax.board.therapy.speechtherapy";
	}

	@RequestMapping(value = "/ajax_readtherapy", method = RequestMethod.GET) // 독서치료
	public String ajaxreadtherapy(Model model) throws Throwable {
		return "ajax.board.therapy.readtherapy";
	}

	@RequestMapping(value = "/ajax_musictherapy", method = RequestMethod.GET) // 음악치료
	public String ajaxmusictherapy(Model model) throws Throwable {
		return "ajax.board.therapy.musictherapy";
	}

	@RequestMapping(value = "/ajax_playtherapy", method = RequestMethod.GET) // 연극치료
	public String ajaxplaytherapy(Model model) throws Throwable {
		return "ajax.board.therapy.playtherapy";
	}

	@RequestMapping(value = "/ajax_mediatherapy", method = RequestMethod.GET) // 미디어치료
	public String ajaxmediatherapy(Model model) throws Throwable {
		return "ajax.board.therapy.mediatherapy";
	}

}
