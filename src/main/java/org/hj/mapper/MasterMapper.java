package org.hj.mapper;

import java.util.List;

import org.hj.model.UserVO;

public interface MasterMapper {
	
	public List<UserVO> getAcceptList();
	
	public void accept(String id);
	
	public void reject(String id);
	
}
