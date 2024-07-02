package org.hj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller

public class MainController {
	

	// 길찾기 페이지
	@GetMapping("/")
	public String map() {
		System.out.println("길찾기");
		return "map";
	}
	
	// 메인 페이지
	@GetMapping("/main")
	public String main() {
		System.out.println("메인");
		return "main";
	}
	

	
}
