package com.kosta.simli.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CounselController {

	@RequestMapping(value = "/psychotherapy", method = RequestMethod.GET) // 심리상담
	public String psychotherapy(Model model) throws Throwable {
		return "board.counsel.psychotherapy";
	}

	@RequestMapping(value = "/familytherapy", method = RequestMethod.GET) // 가족상담
	public String familytherapy(Model model) throws Throwable {
		return "board.counsel.familytherapy";
	}

	@RequestMapping("/chatting_counsel")
	public String chatting_counsel() {

		return "board.counsel.chatting_counsel";
	}

	@RequestMapping("/voice_counsel")
	public String voice_counsel() {

		return "board.counsel.voice_counsel";
	}

	@RequestMapping("/cam_counsel")
	public String cam_counsel() {

		return "board.counsel.cam_counsel";
	}

	@RequestMapping("/call_counsel")
	public String call_counsel() {

		return "board.counsel.call_counsel";
	}

	@RequestMapping(value = "/ajax_psychotherapy", method = RequestMethod.GET) // 심리상담
	public String ajaxpsychotherapy(Model model) throws Throwable {
		return "ajax.board.counsel.psychotherapy";
	}

	@RequestMapping(value = "/ajax_familytherapy", method = RequestMethod.GET) // 가족상담
	public String ajaxfamilytherapy(Model model) throws Throwable {
		return "ajax.board.counsel.familytherapy";
	}

	@RequestMapping("/ajax_chatting_counsel")
	public String ajaxchatting_counsel() {

		return "ajax.board.counsel.chatting_counsel";
	}

	@RequestMapping("/ajax_voice_counsel")
	public String ajaxvoice_counsel() {

		return "ajax.board.counsel.voice_counsel";
	}

	@RequestMapping("/ajax_cam_counsel")
	public String ajaxcam_counsel() {

		return "ajax.board.counsel.cam_counsel";
	}

	@RequestMapping("/ajax_call_counsel")
	public String ajaxcall_counsel() {

		return "ajax.board.counsel.call_counsel";
	}
}
