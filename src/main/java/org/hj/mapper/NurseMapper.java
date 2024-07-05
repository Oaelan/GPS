package org.hj.mapper;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hj.model.GPSInfoVO;
import org.hj.model.PatientGPSVO;
import org.hj.model.PatientVO;
import org.hj.model.UserVO;

public interface NurseMapper {

	// 로그인한 간호사의 담당 입원 환자 리스트 가져오기
	public ArrayList<PatientVO> getPList(UserVO uvo);

	// 선택한 환자의 위치 가져오기
	public PatientGPSVO getPatientGps(PatientGPSVO pgvo);

	// 선택한 층에 해당하는 담당 환자들 위치 정보 가져오기
	public ArrayList<PatientGPSVO> getPatientGpsByFloor(
			Map<String, Object> params);

	// 위치 정보 데이터 베이스에 넣어보기
	public void callInsertEx(GPSInfoVO gvo);

	// 위치 정보 꺼내오기
	public GPSInfoVO getGps(GPSInfoVO gvo);

	// 입원 환자 등록
	public void addP(PatientVO pvo);

	// 입원 환자 유저 테이블 임시 등록
	public void addPtoUser(PatientVO pvo);
}
