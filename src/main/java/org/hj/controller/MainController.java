package org.hj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class MainController {
	

	// 로그인 페이지
	@GetMapping("/")
	public String home() {
		System.out.println("홈");
		return "map";
	}
	
	// 로그인 페이지
	@GetMapping("/main")
	public String main() {
		System.out.println("메인");
		return "main";
	}
	

}
