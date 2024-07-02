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
	
	
	// 로그인 성공 페이지
		@GetMapping("/loginSuccess")
		public String loginSuccess() {
			System.out.println("로그인 성공");
			return "loginSuccess";
		}
		
	// 로그인 페이지
	@GetMapping("/login")
	public String login() {
		System.out.println("로그인 하러 가기");
		return "login";
	}

	// 환자 회원가입 페이지
	@GetMapping("/sign")
	public String sign() {
		System.out.println("환자 회원가입 하러 가기");
		return "sign";
	}
	
	// 간호사 회원가입 페이지
	@GetMapping("/signNurse")
	public String signNurse() {
		System.out.println("간호사 회원가입 하러 가기");
		return "signNurse";
	}
}
