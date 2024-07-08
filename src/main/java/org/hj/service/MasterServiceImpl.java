package org.hj.service;

import java.util.List;

import org.hj.mapper.MasterMapper;
import org.hj.model.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MasterServiceImpl implements MasterService{
	
	@Autowired
    MasterMapper mm;
	
	
	public List<UserVO> getAcceptList() {
		System.out.println(mm.getAcceptList());
		return mm.getAcceptList();
	}
	
	public void accept(String id) {
		mm.accept(id);
	}
	
	public void reject(String id) {
		mm.reject(id);
	}
}
