package org.hj.controller;

import javax.servlet.http.HttpSession;

import org.hj.model.PatientGPSVO;
import org.hj.model.PatientVO;
import org.hj.model.UserVO;
import org.hj.service.LoginService;
import org.hj.service.NurseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller

public class MainController {

	@Autowired
	private LoginService ls;
	@Autowired
	NurseService ns;

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
	public String gologinSuccess(HttpSession session, UserVO uvo, Model model,
			PatientGPSVO pgvo) {
		System.out.println("로그인 컨트롤러");
		// 로그인 페이지 이동
		if (ls.login(uvo) == null) {
			System.out.println("아이디 없어서 다시 로그인 페이지로");
			return "login";
		} else {
			// 의료진인지 일반 사용자 인지 판별하는 변수
			String s_team = (ls.login(uvo)).getS_team();
			session.setAttribute("userId", (ls.login(uvo)).getId());
			session.setAttribute("name", (ls.login(uvo)).getName());
			session.setAttribute("s_team", s_team);
			// 세션에서 userId를 가져와서 문자열로 변환
			String userId = (String) session.getAttribute("userId");

			// 입원 또는 그냥 일반 사용자라는 뜻
			if ((ls.login(uvo)).getS_team() == null) {
				model.addAttribute("loginedType",
						((ls.login(uvo)).getS_team()));
				if (userId.length() == 6) {
					String p_no = ls.getPInfo(uvo).getP_no();
					String p_name = ls.getPInfo(uvo).getP_name();
					String p_gender = ls.getPInfo(uvo).getP_gender();
					String p_phone = ls.getPInfo(uvo).getP_phone();
					String p_subPhone = ls.getPInfo(uvo).getP_subPhone();
					String p_room = ls.getPInfo(uvo).getP_room();
					pgvo.setP_no(p_no);
					pgvo.setP_name(p_name);
					pgvo.setP_gender(p_gender);
					pgvo.setP_phone(p_phone);
					pgvo.setP_subPhone(p_subPhone);
					pgvo.setP_room(p_room);
					ls.addPGPSInfo(pgvo);

					return "loginSuccessForEnterH";
				} else {
					return "loginSuccess";
				}

			}

			else if (s_team.equals("master")) {
				model.addAttribute("loginedType",
						((ls.login(uvo)).getS_team()));
				System.out.println(session.getAttribute("s_team"));
				return "loginSuccessNurse";
			}

			else {
				model.addAttribute("loginedType",
						((ls.login(uvo)).getS_team()));
				return "loginSuccessNurse";
			}
		}

	}

	//로그아웃 하기
	  @GetMapping("/logout")
	  public String logout(HttpSession session, PatientVO pvo) {		  
		  if (session != null) {
			  	pvo.setP_no((String)(session.getAttribute("userId")));
			  	ls.logoutDelP_GPS(pvo);
	            session.invalidate(); // 세션 무효화
	        }
		  return "redirect:/";
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

	// 간호사 회원정보 입력
	@PostMapping("/putSignNurse")
	public String putSignNurse(UserVO uvo) {
		ls.putSignNurse(uvo);
		return "signNurseSuccess";
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
	public String goPatientADD() {
		System.out.println("입원 환자 등록 페이지");
		return "patientADD";
	}

	// 입원 환자 등록 버튼 처리
	@PostMapping("/patientAddSuccess")
	public String addP(PatientVO pvo, HttpSession session) {
		pvo.setS_id((String) session.getAttribute("userId"));
		ns.addP(pvo);
		String p_Pw = pvo.getP_id();
		// 입원환자 정보의 주민번호 앞자리 6개를 유저테이블에 비밀번호로 사용
		pvo.setP_id(p_Pw.substring(0, 6));
		ns.addPtoUser(pvo);

		return "addPSuccess";
	}

	// 좌표 연습 페이지
	@GetMapping("/Map2")
	public String Map2() {
		System.out.println("좌표 연습");
		return "Map2";
	}
}
