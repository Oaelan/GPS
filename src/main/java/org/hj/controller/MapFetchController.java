package org.hj.controller;

import org.hj.service.GPSInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class MapFetchController {
	
	@Autowired
	GPSInfoService gs;
	
	
	// 위도 경도 저장 컨트롤러
    @PostMapping("/sendLatLon")
    public ResponseEntity<String> sendLatLon() {
        System.out.println("위도 경도 저장 컨트롤러");
        gs.sendLatLon();
        return ResponseEntity.ok("위도 경도 저장 완료");
    }
}
