package org.hj.mapper;

import org.hj.model.PatientGPSVO;
import org.hj.model.PatientVO;
import org.hj.model.UserVO;

public interface LoginMapper {
	public UserVO login(UserVO lvo);
	public PatientVO getPInfo(UserVO uvo);
	public void addPGPSInfo(PatientGPSVO pgvo);
	public void addPGPS_XY(PatientGPSVO pgvo);
	public PatientGPSVO getP_XY (UserVO uvo);
	public void logoutDelP_GPS (PatientVO pvo);
}
