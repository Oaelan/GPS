package org.hj.service;

import org.hj.mapper.LoginMapper;
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
}
