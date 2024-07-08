package org.hj.service;

import org.hj.mapper.LoginMapper;
import org.hj.model.PatientGPSVO;
import org.hj.model.PatientVO;
import org.hj.model.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
    LoginMapper lm;
	
	public UserVO login(UserVO lvo) {
		return lm.login(lvo);
	}
	public PatientVO getPInfo(UserVO uvo) {
		return lm.getPInfo(uvo);
	}
	public void addPGPSInfo(PatientGPSVO pgvo) {
		lm.addPGPSInfo(pgvo);
	}
	public void addPGPS_XY(PatientGPSVO pgvo) {
		lm.addPGPS_XY(pgvo);
	}
	public PatientGPSVO getP_XY (UserVO uvo) {
		return lm.getP_XY(uvo);
	}
	public void logoutDelP_GPS (PatientVO pvo) {
		lm.logoutDelP_GPS(pvo);
	}
	public void putSignNurse(UserVO uvo) {
		lm.putSignNurse(uvo);
	}
	
	public void putSignNormal(UserVO uvo) {
		lm.putSignNormal(uvo);
	}
}
