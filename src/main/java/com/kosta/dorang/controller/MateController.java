package com.kosta.dorang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MateController {

	@RequestMapping(value = "/mate/writeform", method=RequestMethod.GET)
	public String Writeform() {
		return "/mate/mateWriteForm";
	}
	
}
