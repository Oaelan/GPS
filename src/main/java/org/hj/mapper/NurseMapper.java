package org.hj.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.hj.model.PatientGPSVO;
import org.hj.model.PatientVO;
import org.hj.model.UserVO;

public interface NurseMapper {
	
	// 로그인한 간호사의 담당 입원 환자 리스트 가져오기
	public ArrayList<PatientVO> getPList(UserVO uvo);
	
	// 선택한 환자의 위치 가져오기
	public PatientGPSVO getPatientGps(PatientGPSVO pgvo);
	
	// 선택한 층에 해당하는 담당 환자들 위치 정보 가져오기
	public ArrayList<PatientGPSVO> getPatientGpsByFloor(Map<String, Object> params);

}
