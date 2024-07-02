package org.hj.controller;

import javax.servlet.http.HttpSession;

import org.hj.model.UserVO;
import org.hj.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller

public class MainController {
	

	@Autowired
	private LoginService ls;
	
	// 메인 페이지
	@GetMapping("/")
	public String main() {
		System.out.println("메인 화면");
		return "main";
	}
	
	
	// 환자 로그인 성공 페이지
	@GetMapping("/loginSuccess")
	public String loginSuccess() {
		System.out.println("환자 로그인 성공");
		return "loginSuccess";
	}
		
	// 간호사 로그인 성공 페이지
	@GetMapping("/loginSuccessNurse")
	public String loginSuccessNurse() {
		System.out.println("간호사 로그인 성공");
		return "loginSuccessNurse";
	}
		
	// 로그인 페이지
	@GetMapping("/login")
	public String login() {
		System.out.println("로그인 하러 가기");
		return "login";
	}
	
	@PostMapping("/login")
	public String gologinSuccess(HttpSession session, UserVO uvo) {
		System.out.println("로그인 컨트롤러");
			// 로그인 페이지 이동
			if (ls.login(uvo) == null) {
				System.out.println("아이디 없어서 다시 로그인 페이지로");
				return "login";
			}
			else {
				String s_team = (ls.login(uvo)).getS_team();
				session.setAttribute("userId", (ls.login(uvo)).getId());
				session.setAttribute("name", (ls.login(uvo)).getName());
				session.setAttribute("s_team", s_team);
				
				if (s_team.equals("")) {
					return "loginSuccess";
				}
				
				else if (s_team.equals("master")) {
					return "loginSuccessNurse";
				}
				
				else {
					return "loginSuccessNurse";
				}
			}
		
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
	
	// 병원 소개
	@GetMapping("/introduce")
	public String introduce() {
		System.out.println("병원 소개");
		return "introduce";
	}
	
	// 오시는 길
	@GetMapping("/ComingRoute")
	public String ComingRoute() {
		System.out.println("오시는 길");
		return "ComingRoute";
	}
	
	// 병원 내 길찾기
	@GetMapping("/FindRoute")
	public String FindRoute() {
		System.out.println("병원 내 길찾기");
		return "FindRoute";
	}
	
	// 입원 환자 등록 페이지
	@GetMapping("/patientADD")
	public String patientADD() {
		System.out.println("입원 환자 등록 페이지");
		return "patientADD";
	}
	
	
	
	
	
	
	
	
	
	
	
	// 좌표 연습 페이지
		@GetMapping("/Map2")
		public String Map2() {
			System.out.println("좌표 연습");
			return "Map2";
		}
}
