package org.hj.service;

import java.util.List;

import org.hj.model.UserVO;

public interface MasterService {
	public List<UserVO> getAcceptList();
	
	public void accept(String id);
	
	public void reject(String id);
}
