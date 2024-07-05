package org.hj.controller;

import javax.servlet.http.HttpSession;

import org.hj.model.GPSInfoVO;
import org.hj.service.GPSInfoService;
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
	NurseService ns;
	
	
	// 사용자 좌표 위치 DB에 넣기
		@PostMapping(value = "/sendLatLon", produces = "application/json")
		public String goEx(@RequestBody GPSInfoVO gvo, HttpSession session) {
		
			String id = (String)(session.getAttribute("userId"));
			gvo.setId(id);				
			ns.callInsertEx(gvo);
			System.out.println(gvo);
			return "성공 적으로 데이터 전송 성공";
		}
		
		// DB 사용자 좌표 가져오기
		@GetMapping(value = "/u_position", produces = "application/json")
		public GPSInfoVO getGps(HttpSession session,GPSInfoVO gvo) {
			System.out.println("좌표가져오기");
			String id = (String)(session.getAttribute("userId"));
			gvo.setId(id);
			System.out.println(ns.getGps(gvo));
			return ns.getGps(gvo);
		}
}
