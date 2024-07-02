package org.hj.controller;

import org.hj.model.GPSInfoVO;
import org.hj.service.GPSInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class MapFetchController {
	
	@Autowired
	GPSInfoService gs;
	
	
	// 위도 경도 저장 컨트롤러
	@PostMapping("/sendLatLon")
    public String sendLatLon(@RequestBody GPSInfoVO gvo) {
		gs.sendLatLon(gvo);
        return "Data saved successfully";
    }
}
