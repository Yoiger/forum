package com.chen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageSkip {
	
	@RequestMapping(value="/skipTo")
	public String pageSkip(String target) {
		return "index_" + target;
	}
}
