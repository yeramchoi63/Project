package com.kosta.simli.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroduceController {

	@RequestMapping("/hellow_page")
	public String hellow_page() {

		return "board.introduce.hellow_page";
	}

	@RequestMapping("/emlpoyee_introduce")
	public String emlpoyee_introduce() {

		return "board.introduce.emlpoyee_introduce";
	}

	@RequestMapping("/operation_guide")
	public String operation_guide() {

		return "board.introduce.operation_guide";
	}

	@RequestMapping("/video_guide")
	public String video_guide() {

		return "board.introduce.video_guide";
	}

	/* ajax */

	@RequestMapping("/ajax_hellow_page")
	public String ajaxhellow_page() {

		return "ajax.board.introduce.hellow_page";
	}

	@RequestMapping("/ajax_emlpoyee_introduce")
	public String ajaxemlpoyee_introduce() {

		return "ajax.board.introduce.emlpoyee_introduce";
	}

	@RequestMapping("/ajax_operation_guide")
	public String ajaxoperation_guide() {

		return "ajax.board.introduce.operation_guide";
	}

	@RequestMapping("/ajax_video_guide")
	public String ajaxvideo_guide() {

		return "ajax.board.introduce.video_guide";
	}

}
