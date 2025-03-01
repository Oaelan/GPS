package org.hj.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hj.mapper.NurseMapper;
import org.hj.model.GPSInfoVO;
import org.hj.model.PatientGPSVO;
import org.hj.model.PatientVO;
import org.hj.model.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class NurseServiceImpl implements NurseService {
	@Autowired
	NurseMapper nm;

	// 로그인한 간호사의 담당 입원 환자 리스트 가져오기
	public ArrayList<PatientVO> getPList(UserVO uvo) {
		return nm.getPList(uvo);
	}

	// 선택한 환자의 위치 가져오기
	public PatientGPSVO getPatientGps(PatientGPSVO pgvo) {
		return nm.getPatientGps(pgvo);
	}

	// 선택한 층에 해당하는 담당 환자들 위치 정보 가져오기
	public ArrayList<PatientGPSVO> getPatientGpsByFloor(
			Map<String, Object> params) {
		return nm.getPatientGpsByFloor(params);
	}

	// 위치 정보 데이터 베이스에 넣어보기
	public void callInsertEx(GPSInfoVO gvo) {
		nm.callInsertEx(gvo);
	}
	// 위치 정보 꺼내오기
	public GPSInfoVO getGps(GPSInfoVO gvo) {
		return nm.getGps(gvo);
	}
	// 입원 환자 등록
	public void addP(PatientVO pvo) {
		nm.addP(pvo);
	};

	// 입원 환자 유저 테이블 임시 등록
	public void addPtoUser(PatientVO pvo) {
		nm.addPtoUser(pvo);
	};
}
