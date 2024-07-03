package org.hj.controller;

import java.util.List;

import javax.servlet.http.HttpSession;


import org.hj.model.PatientVO;
import org.hj.model.UserVO;
import org.hj.service.NurseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
@RequestMapping("/nurse")
public class NurseController {

	@Autowired
	NurseService ns;
	
	// 로그인한 간호사가 담당하는 입원환자 리스트 불러옴 
	@GetMapping(value = "/getPList" , produces = "application/json")
	public List<PatientVO> getPList(UserVO uvo,HttpSession session) {
		System.out.println("환자 리스트 가져오기");
		uvo.setId((String)(session.getAttribute("userId")));
		List<PatientVO> patients = ns.getPList(uvo);
		System.out.println(patients);
        return patients;
    }
		
}
