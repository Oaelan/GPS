package org.hj.controller;

import javax.servlet.http.HttpSession;

import org.hj.model.GPSInfoVO;
import org.hj.model.PatientGPSVO;
import org.hj.model.UserVO;
import org.hj.service.GPSInfoService;
import org.hj.service.LoginService;
import org.hj.service.NurseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class MapFetchController {
	
	@Autowired
	LoginService ls;
	
	
	// 사용자 좌표 위치 DB에 넣기
		@PostMapping(value = "/sendLatLon", produces = "application/json")
		public String goEx(@RequestBody PatientGPSVO pgvo, HttpSession session) {		
			String id = (String)(session.getAttribute("userId"));
			pgvo.setP_no(id);
			ls.addPGPS_XY(pgvo);						
			return "환자 GPS X,Y 값 넣기";
		}
		
		// DB 사용자 좌표 가져오기
		@GetMapping(value = "/u_position", produces = "application/json")
		public PatientGPSVO getGps(HttpSession session, UserVO uvo) {
			System.out.println("좌표가져오기");
			String id = (String)(session.getAttribute("userId"));
			uvo.setId(id);			
			return ls.getP_XY(uvo);
		}
}
