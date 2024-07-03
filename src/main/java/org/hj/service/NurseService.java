package org.hj.service;

import java.util.ArrayList;

import org.hj.model.PatientVO;
import org.hj.model.UserVO;

public interface NurseService {

	// 로그인한 간호사의 담당 입원 환자 리스트 가져오기
	public ArrayList<PatientVO> getPList(UserVO uvo);

}
