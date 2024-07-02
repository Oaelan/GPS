package org.hj.service;

import org.hj.mapper.GPSInfoMapper;
import org.hj.model.GPSInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GPSInfoServiceImpl implements GPSInfoService{
	
	@Autowired
    private GPSInfoMapper gm;
	public void sendLatLon(GPSInfoVO gvo){
		gm.sendLatLon(gvo);
	}
}
