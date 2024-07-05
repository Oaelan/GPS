package org.hj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hj.model.GPSInfoVO;
import org.hj.model.PatientGPSVO;
import org.hj.model.PatientVO;
import org.hj.model.UserVO;
import org.hj.service.NurseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/nurse")
public class NurseController {

	@Autowired
	NurseService ns;

	// 로그인한 간호사가 담당하는 입원환자 리스트 불러옴
	@GetMapping(value = "/getPList", produces = "application/json")
	public List<PatientVO> getPList(UserVO uvo, HttpSession session) {
		// System.out.println("환자 리스트 가져오기");
		uvo.setId((String) (session.getAttribute("userId")));
		List<PatientVO> patients = ns.getPList(uvo);
		// System.out.println(patients);
		return patients;
	}

	// 담당 환자의 이름을 눌렀을 때 입원번호를 받아 컨트롤러로 가져와서 해당 환자의 x,y,z를 가져옴
	@GetMapping(value = "/getPatientGps", produces = "application/json")
	public PatientGPSVO getPatientGps(@RequestParam String p_no,
			PatientGPSVO pgvo) {
		System.out.println("환자 GPS 정보 가져오기");
		pgvo.setP_no(p_no);
		// System.out.println(ns.getPatientGps(pgvo));
		return ns.getPatientGps(pgvo);
	}

	// 선택한 층에 해당하는 담당 환자들 위치 정보 가져오기
	@GetMapping(value = "/getPatientGpsByFloor", produces = "application/json")
	public List<PatientGPSVO> getPatientGpsByFloor(@RequestParam int z,
			HttpSession session) {
		System.out.println("해당 층의 담당 환자 GPS 가져오기");

		// 로그인한 간호사의 아이디 가져오기
		String userId = (String) session.getAttribute("userId");

		// 맵 생성 및 매개변수 설정
	    Map<String, Object> params = new HashMap<>();
	    params.put("userId", userId);
	    params.put("z", z);
		
	    // 매퍼 호출
	    List<PatientGPSVO> result = ns.getPatientGpsByFloor(params);
	    System.out.println(result); // 로그 확인용
		return result;
	}
	
	
	// 간호사 좌표 위치 DB에 넣기
	@PostMapping(value = "/getNurseP", produces = "application/json")
	public String goEx(@RequestBody GPSInfoVO gvo, HttpSession session) {
	
		String id = (String)(session.getAttribute("userId"));
		gvo.setId(id);				
		ns.callInsertEx(gvo);
		System.out.println(gvo);
		return "성공 적으로 데이터 전송 성공";
	}
	
	// DB 간호사 좌표 가져오기
	@GetMapping(value = "/position", produces = "application/json")
	public GPSInfoVO getGps(HttpSession session,GPSInfoVO gvo) {
		System.out.println("좌표가져오기");
		String id = (String)(session.getAttribute("userId"));
		gvo.setId(id);
		System.out.println(ns.getGps(gvo));
		return ns.getGps(gvo);
	}
	
	
}
