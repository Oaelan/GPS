package org.hj.controller;

import org.hj.model.GPSInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class MapFetchController {
	
	@Autowired
	private GPSInfoVO gvo;
	
	
	// 위도 경도 저장 컨트롤러
    @PostMapping("/sendLatLon")
    public ResponseEntity<String> sendReserve(@RequestBody GPSInfoVO gvo) {
        System.out.println("위도 경도 저장 컨트롤러");
        return ResponseEntity.ok("예약 완료");
    }
}
