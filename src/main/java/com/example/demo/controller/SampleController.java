package com.example.demo.controller;

import com.example.demo.entity.Onsen;
import com.example.demo.service.OnsenService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequiredArgsConstructor
public class SampleController {

    // サービスクラス
    private final OnsenService onsenService;

    @GetMapping("/onsen/{onsenName}")
    public ResponseEntity<Onsen> getOnsenInfo(@PathVariable String onsenName) {

        Onsen onsenList = onsenService.selectOnsen(onsenName);

        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_JSON)
                .body(onsenList);
    }
}
